import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lune/domain/repositories/repositories.dart';

class SupportRespositoryImpl extends SupportRepository {
  SupportRespositoryImpl({
    FirebaseFirestore? firebase,
  }) : _firestore = firebase ?? FirebaseFirestore.instance;

  final FirebaseFirestore _firestore;

  CollectionReference get _supportCollection =>
      _firestore.collection('support_tickets');

  @override
  Future<void> createTicket({
    required String email,
    required String title,
    required String description,
  }) {
    return _supportCollection.add({
      'email': email,
      'title': title,
      'description': description,
      'createdAt': FieldValue.serverTimestamp(),
    });
  }
}
