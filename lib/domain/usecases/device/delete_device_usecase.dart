import 'package:lune/domain/repositories/device_repository.dart';

class DeleteDeviceUseCase {
  DeleteDeviceUseCase(this._repository);

  final DeviceRepository _repository;

  Future<void> call() async {
    await _repository.deleteDevice();
  }
}
