import 'package:lune/features/core/app_permission/domain/enums/enums.dart';
import 'package:lune/features/core/app_permission/domain/repositories/repositories.dart';

class CheckPermissionUseCase {
  CheckPermissionUseCase(this.repository);

  final PermissionRepository repository;

  Future<PermissionStatus> call(AppPermissionEnum permission) {
    return repository.check(permission);
  }
}
