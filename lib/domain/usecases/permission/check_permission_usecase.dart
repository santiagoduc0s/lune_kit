import 'package:lune/domain/entities/entities.dart';
import 'package:lune/domain/repositories/repositories.dart';

class CheckPermissionUseCase {
  CheckPermissionUseCase(this.repository);

  final PermissionRepository repository;

  Future<PermissionStatus> call(PermissionType permission) {
    return repository.check(permission);
  }
}
