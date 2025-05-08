import 'package:lune/features/pages/public_onboard/domain/entities/entities.dart';

abstract class PublicOnboardRepository {
  Future<PublicOnboardStatusEntity> getStatus();

  Future<void> setStatus(PublicOnboardStatusEntity value);
}
