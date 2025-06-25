import 'package:lune/data/services/services.dart';
import 'package:lune/domain/repositories/repositories.dart';

class MessagingRepositoryImpl extends MessagingRepository {
  MessagingRepositoryImpl({
    required FirebaseService firebaseService,
  }) : _firebaseService = firebaseService;

  final FirebaseService _firebaseService;

  @override
  Future<String?> getFCMToken() {
    return _firebaseService.getFCMToken();
  }
}
