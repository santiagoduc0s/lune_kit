import 'package:lune/features/core/app_permission/domain/enums/enums.dart';

abstract class AppPermissionDataSource {
  Future<PermissionStatusEnum> status(AppPermissionEnum permission);
  Future<PermissionStatusEnum> request(AppPermissionEnum permission);
  Future<bool> openSettings();
}
