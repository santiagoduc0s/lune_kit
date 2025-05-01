import 'package:lune/features/core/app_permission/domain/enums/enums.dart';

abstract class AppPermissionRepository {
  Future<PermissionStatusEnum> check(
    AppPermissionEnum permission,
  );

  Future<PermissionStatusEnum> request(
    AppPermissionEnum permission,
  );

  Future<bool> openSettings();
}
