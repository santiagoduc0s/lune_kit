import 'package:lune/features/pages/public_onboard/domain/domain.dart';

class GetPublicOnboardStatusUseCase {
  GetPublicOnboardStatusUseCase(this._repository);

  final PublicOnboardRepository _repository;

  Future<PublicOnboardStatusEnum> call() {
    return _repository.getStatus();
  }
}
