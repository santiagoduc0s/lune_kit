import 'package:lune/features/core/app_permission/domain/repositories/repositories.dart';

class OpenSettingsUseCase {
  OpenSettingsUseCase(this.repository);

  final AppPermissionRepository repository;

  Future<bool> call() {
    return repository.openSettings();
  }
}
