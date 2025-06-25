import 'dart:typed_data';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseService {
  FirebaseService({
    FirebaseMessaging? messaging,
    FirebaseStorage? storage,
  })  : _messaging = messaging ?? FirebaseMessaging.instance,
        _storage = storage ?? FirebaseStorage.instance;

  final FirebaseMessaging _messaging;
  final FirebaseStorage _storage;

  Future<String?> getFCMToken() {
    return _messaging.getToken();
  }

  Future<String> uploadFile({
    required Uint8List data,
    required String path,
  }) async {
    try {
      final ref = _storage.ref().child(path);
      final uploadTask = ref.putData(data);
      final snapshot = await uploadTask;
      final downloadUrl = await snapshot.ref.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      throw Exception('File upload failed: $e');
    }
  }

  Future<void> deleteFile({required String path}) async {
    try {
      final ref = _storage.ref().child(path);
      await ref.delete();
    } catch (e) {
      throw Exception('File deletion failed: $e');
    }
  }
}
