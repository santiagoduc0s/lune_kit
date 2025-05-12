import 'package:lune/features/screens/public_onboard/domain/entities/entities.dart';

abstract class PublicOnboardRepository {
  Future<PublicOnboardStatusEntity> getStatus();

  Future<void> setStatus(PublicOnboardStatusEntity value);
}
