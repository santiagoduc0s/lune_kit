import 'package:lune/features/core/app_permission/data/datasources/datasources.dart';
import 'package:lune/features/core/app_permission/domain/enums/enums.dart';
import 'package:lune/features/core/app_permission/domain/repositories/repositories.dart';

class AppPermissionRepositoryImpl implements AppPermissionRepository {
  AppPermissionRepositoryImpl({
    required this.datasource,
  });

  final AppPermissionDataSource datasource;

  @override
  Future<PermissionStatusEnum> check(AppPermissionEnum permission) {
    return datasource.status(permission);
  }

  @override
  Future<bool> openSettings() {
    return datasource.openSettings();
  }

  @override
  Future<PermissionStatusEnum> request(AppPermissionEnum permission) {
    return datasource.request(permission);
  }
}
