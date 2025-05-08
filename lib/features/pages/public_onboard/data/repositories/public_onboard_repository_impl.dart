import 'package:lune/features/pages/public_onboard/data/datasources/datasources.dart';
import 'package:lune/features/pages/public_onboard/data/models/models.dart';
import 'package:lune/features/pages/public_onboard/domain/domain.dart';

class PublicOnboardRepositoryImpl extends PublicOnboardRepository {
  PublicOnboardRepositoryImpl(this.datasource);

  final PublicOnboardDatasource datasource;

  @override
  Future<PublicOnboardStatusEntity> getStatus() {
    return datasource.getStatus();
  }

  @override
  Future<void> setStatus(PublicOnboardStatusEntity value) {
    return datasource.setStatus(PublicOnboardStatusModel.fromEntity(value));
  }
}
