import 'package:lune/features/screens/public_onboard/domain/domain.dart';

class GetPublicOnboardStatusUseCase {
  GetPublicOnboardStatusUseCase(this._repository);

  final PublicOnboardRepository _repository;

  Future<PublicOnboardStatusEntity> call() {
    return _repository.getStatus();
  }
}
