import 'dart:async';
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lune/core/exceptions/exceptions.dart';
import 'package:lune/core/utils/utils.dart';
import 'package:lune/data/models/user_model.dart';
import 'package:lune/data/services/services.dart';
import 'package:lune/domain/entities/entities.dart';
import 'package:lune/domain/repositories/repositories.dart';

class AuthRepositoryImpl extends AuthRepository {
  AuthRepositoryImpl({
    required FirebaseService firebaseService,
    required LocalStorageService localStorageService,
    FirebaseFirestore? firestore,
    FirebaseAuth? firebaseAuth,
    StreamController<UserEntity>? userController,
  })  : _firebaseService = firebaseService,
        _localStorageService = localStorageService,
        _firestore = firestore ?? FirebaseFirestore.instance,
        _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
        _userController =
            userController ?? StreamController<UserEntity>.broadcast();

  final FirebaseService _firebaseService;
  final FirebaseFirestore _firestore;
  final FirebaseAuth _firebaseAuth;
  final StreamController<UserEntity> _userController;
  final LocalStorageService _localStorageService;

  bool? _isAuthenticated;
  String? _accessToken;

  CollectionReference get _userCollection => _firestore.collection('users');

  @override
  Future<bool> isAuthenticated() async {
    if (_isAuthenticated != null) return _isAuthenticated!;
    await _getAccessToken();
    return _isAuthenticated ?? false;
  }

  @override
  Future<UserEntity?> currentUser() async {
    if (!await isAuthenticated()) return null;
    final user = _firebaseAuth.currentUser;
    if (user == null) return null;

    final snapshot = await _userCollection.doc(user.uid).get();

    if (!snapshot.exists) return null;

    return UserModel.fromJson(snapshot.data()! as Map<String, dynamic>);
  }

  Future<void> _getAccessToken() async {
    _accessToken = await _localStorageService.getAccessToken();
    _isAuthenticated = _accessToken != null;
  }

  @override
  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final result = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final token = await result.user?.getIdToken();
      await _localStorageService.setAccessToken(token);
      _accessToken = token;
      _isAuthenticated = true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-credential' || e.code == 'wrong-password') {
        throw InvalidCredentialException();
      } else if (e.code == 'network-request-failed') {
        throw NoInternetConnectionException();
      } else {
        rethrow;
      }
    }
  }

  @override
  Future<void> signUpWithEmailAndPassword({
    required String email,
    required String password,
    String? firstName,
    String? lastName,
    Uint8List? photo,
  }) async {
    try {
      final result = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await _storeUser(
        id: result.user!.uid,
        email: email,
        firstName: firstName,
        lastName: lastName,
        photo: photo,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        throw EmailAlreadyInUseException();
      } else if (e.code == 'invalid-email') {
        throw InvalidEmailException();
      } else if (e.code == 'weak-password') {
        throw WeakPasswordException();
      } else {
        rethrow;
      }
    }
  }

  Future<UserEntity> _storeUser({
    required String id,
    required String email,
    String? firstName,
    String? lastName,
    Uint8List? photo,
  }) async {
    String? photoPath;
    if (photo != null) {
      photoPath = await _firebaseService.uploadFile(
        data: photo,
        path: 'profile/$id',
      );
    }

    final userData = {
      'id': id,
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'photo': photoPath,
      'updatedAt': FieldValue.serverTimestamp(),
      'createdAt': FieldValue.serverTimestamp(),
    };

    await _userCollection.doc(id).set(userData);

    final userSnapshot = await _userCollection.doc(id).get();
    return UserModel.fromJson(userSnapshot.data()! as Map<String, dynamic>);
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
    await _localStorageService.setAccessToken(null);
    _accessToken = null;
    _isAuthenticated = false;
  }

  @override
  Future<void> forgotPassword({String? email, String? phone}) async {
    if (email == null || email.isEmpty) {
      throw ArgumentError('Email is required for password reset');
    }
    await _firebaseAuth.sendPasswordResetEmail(email: email);
  }

  @override
  Future<void> updatePassword({required String password}) async {
    final user = _firebaseAuth.currentUser;
    if (user == null) {
      throw FirebaseAuthException(
        code: 'no-user',
        message: 'No user signed in',
      );
    }
    await user.updatePassword(password);
  }

  @override
  Future<UserEntity> updateCurrentUser({
    String? firstName,
    String? lastName,
    NullableParameter<Uint8List?>? photo,
    bool? notificationsAreEnabled,
  }) async {
    final id = FirebaseAuth.instance.currentUser!.uid;

    final updates = <String, dynamic>{
      if (firstName != null) 'firstName': firstName,
      if (lastName != null) 'lastName': lastName,
      'updatedAt': FieldValue.serverTimestamp(),
      if (notificationsAreEnabled != null)
        'notificationsAreEnabled': notificationsAreEnabled,
    };

    if (photo != null) {
      if (photo.value != null) {
        final photoPath = await _firebaseService.uploadFile(
          data: photo.value!,
          path: 'profile/$id',
        );
        updates['photo'] = photoPath;
      } else {
        updates['photo'] = null;
      }
    }

    await _userCollection.doc(id).update(updates);
    final snapshot = await _userCollection.doc(id).get();
    final u = UserModel.fromJson(snapshot.data()! as Map<String, dynamic>);
    _userController.add(u);
    return u;
  }

  @override
  Future<void> deleteUser() async {
    final user = _firebaseAuth.currentUser;
    if (user == null) {
      throw FirebaseAuthException(
        code: 'no-user',
        message: 'No user is signed in',
      );
    }
    await _userCollection.doc(user.uid).delete();
    await user.delete();
  }

  @override
  Future<void> reauthenticateWithCredential(
    AuthProviderType provider,
    Map<String, dynamic> data,
  ) async {
    if (provider == AuthProviderType.email) {
      final user = _firebaseAuth.currentUser!;

      final credential = EmailAuthProvider.credential(
        email: user.email!,
        password: data['password'] as String,
      );
      await user.reauthenticateWithCredential(credential);
      return;
    }

    throw UnsupportedError('Reauthentication for $provider is not supported');
  }
}
