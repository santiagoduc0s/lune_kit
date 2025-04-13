import 'package:app_session/src/domain/models/user.dart';

abstract class UserDatasource {
  Future<User> find();
  Future<List<User>> get();
  Future<User> store();
  Future<User> update();
  Future<void> delete();
}
