import 'package:lune/domain/repositories/repositories.dart';

class OpenSettingsUseCase {
  OpenSettingsUseCase(this.repository);

  final PermissionRepository repository;

  Future<bool> call() {
    return repository.openSettings();
  }
}
