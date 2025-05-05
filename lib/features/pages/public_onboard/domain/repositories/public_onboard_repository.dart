import 'package:lune/features/pages/public_onboard/domain/enums/enums.dart';

abstract class PublicOnboardRepository {
  Future<PublicOnboardStatusEnum> getStatus();

  Future<void> setStatus(PublicOnboardStatusEnum value);
}
