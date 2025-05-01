/// lib/domain/repositories/permission_repository.dart
abstract class PermissionRepository {
  /// Returns true if the permission is already granted (not denied/restricted).
  Future<bool> isGranted(Permission permission);

  /// Requests the permission; returns true if granted, false otherwise.
  Future<bool> request(
    Permission permission, {
    bool showRationaleDialog = false,
  });
}
