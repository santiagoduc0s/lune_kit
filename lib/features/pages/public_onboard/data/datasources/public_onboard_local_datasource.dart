import 'package:lune/core/utils/utils.dart';
import 'package:lune/features/pages/public_onboard/data/datasources/datasources.dart';
import 'package:lune/features/pages/public_onboard/data/models/public_onboard_status_model.dart';

class PublicOnboardLocalDatasource extends PublicOnboardDatasource {
  PublicOnboardLocalDatasource(this.storage);

  static const String _showPublicManager = 'publicOnboardStatus';

  final KeyValueLocalStorage storage;

  @override
  Future<PublicOnboardStatusModel> getStatus() async {
    final publicOnboardStatusRaw = storage.get<String>(
      _showPublicManager,
    );

    return PublicOnboardStatusModel.fromString(
      publicOnboardStatusRaw,
    );
  }

  @override
  Future<void> setStatus(PublicOnboardStatusModel value) {
    return storage.save(
      _showPublicManager,
      value.value,
    );
  }
}
