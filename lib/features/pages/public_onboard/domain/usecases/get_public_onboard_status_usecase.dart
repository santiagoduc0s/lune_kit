import 'package:lune/features/pages/public_onboard/domain/domain.dart';

class SetPublicOnboardStatusUseCase {
  SetPublicOnboardStatusUseCase(this._repository);

  final PublicOnboardRepository _repository;

  Future<void> call(PublicOnboardStatusEntity value) async {
    await _repository.setStatus(value);
  }
}
