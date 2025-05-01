import 'package:lune/features/core/app_permission/domain/enums/enums.dart';
import 'package:lune/features/core/app_permission/domain/repositories/repositories.dart';

class RequestPermissionUseCase {
  RequestPermissionUseCase(this.repository);

  final AppPermissionRepository repository;

  Future<PermissionStatusEnum> call(
    AppPermissionEnum permission, {
    bool showRationaleDialog = false,
  }) {
    return repository.request(permission);
  }
}
