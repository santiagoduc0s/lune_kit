import 'package:lune/domain/entities/entities.dart';
import 'package:lune/domain/repositories/repositories.dart';

class SetPublicOnboardStatusUseCase {
  SetPublicOnboardStatusUseCase(this._repository);

  final PublicOnboardRepository _repository;

  Future<void> call(PublicOnboardStatus value) async {
    await _repository.setStatus(value);
  }
}
