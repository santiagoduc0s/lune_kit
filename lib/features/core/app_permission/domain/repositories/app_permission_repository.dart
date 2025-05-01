import 'package:lune/features/core/app_permission/domain/enums/enums.dart';

abstract class PermissionRepository {
  Future<PermissionStatus> check(
    AppPermissionEnum permission,
  );

  Future<PermissionStatus> request(
    AppPermissionEnum permission,
  );
}
