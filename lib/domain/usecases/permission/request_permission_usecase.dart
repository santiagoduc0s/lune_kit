import 'package:lune/domain/entities/entities.dart';
import 'package:lune/domain/repositories/repositories.dart';

class RequestPermissionUseCase {
  RequestPermissionUseCase(this.repository);

  final PermissionRepository repository;

  Future<PermissionStatus> call(
    PermissionType permission,
  ) {
    return repository.request(permission);
  }
}
