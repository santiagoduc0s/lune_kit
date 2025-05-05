import 'package:lune/features/pages/public_onboard/data/datasources/datasources.dart';
import 'package:lune/features/pages/public_onboard/data/models/models.dart';
import 'package:lune/features/pages/public_onboard/domain/enums/public_onboard_status_enum.dart';
import 'package:lune/features/pages/public_onboard/domain/repositories/repositories.dart';

class PublicOnboardRepositoryImpl extends PublicOnboardRepository {
  PublicOnboardRepositoryImpl(this.datasource);

  final PublicOnboardDatasource datasource;

  @override
  Future<PublicOnboardStatusEnum> getStatus() async {
    return (await datasource.getStatus()).toEntity();
  }

  @override
  Future<void> setStatus(PublicOnboardStatusEnum value) {
    return datasource.setStatus(PublicOnboardStatusModel.fromEntity(value));
  }
}
