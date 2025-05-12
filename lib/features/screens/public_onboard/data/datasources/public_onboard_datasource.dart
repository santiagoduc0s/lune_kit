import 'package:lune/features/screens/public_onboard/data/models/models.dart';

abstract class PublicOnboardDatasource {
  Future<PublicOnboardStatusModel> getStatus();

  Future<void> setStatus(PublicOnboardStatusModel status);
}
