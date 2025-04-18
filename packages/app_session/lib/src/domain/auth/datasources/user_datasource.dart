import 'package:app_session/src/domain/auth/models/user.dart';

/// Datasource interface for user operations.
abstract class UserDatasource {
  /// Finds a user by ID.
  Future<User> find();

  /// Gets a list of users.
  Future<List<User>> get();

  /// Creates a new user.
  Future<User> store();

  /// Updates an existing user.
  Future<User> update();

  /// Deletes a user.
  Future<void> delete();
}
