import 'package:lune/domain/entities/entities.dart';

abstract class PermissionRepository {
  Future<PermissionStatus> check(
    PermissionType permission,
  );

  Future<PermissionStatus> request(
    PermissionType permission,
  );

  Future<bool> openSettings();
}
