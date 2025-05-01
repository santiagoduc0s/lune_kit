import 'package:lune/features/core/app_permission/data/datasources/datasources.dart';
import 'package:lune/features/core/app_permission/domain/enums/enums.dart';
import 'package:permission_handler/permission_handler.dart';

class AppPermissionHandlerDatasource implements AppPermissionDataSource {
  static const Map<AppPermissionEnum, Permission> _permissionMap = {
    AppPermissionEnum.camera: Permission.camera,
    AppPermissionEnum.photos: Permission.photos,
    AppPermissionEnum.location: Permission.location,
  };

  Permission _toPermission(AppPermissionEnum perm) {
    final p = _permissionMap[perm];
    if (p == null) {
      throw ArgumentError('Unsupported permission: $perm');
    }
    return p;
  }

  PermissionStatusEnum _mapStatus(PermissionStatus status) {
    if (status.isGranted) return PermissionStatusEnum.granted;
    if (status.isPermanentlyDenied) {
      return PermissionStatusEnum.permanentlyDenied;
    }
    if (status.isDenied) return PermissionStatusEnum.denied;
    if (status.isRestricted) return PermissionStatusEnum.denied;
    if (status.isLimited) return PermissionStatusEnum.denied;
    return PermissionStatusEnum.denied;
  }

  @override
  Future<PermissionStatusEnum> status(AppPermissionEnum permission) async {
    final raw = await _toPermission(permission).status;
    return _mapStatus(raw);
  }

  @override
  Future<PermissionStatusEnum> request(AppPermissionEnum permission) async {
    final raw = await _toPermission(permission).request();
    return _mapStatus(raw);
  }

  @override
  Future<bool> openSettings() {
    return openAppSettings();
  }
}
