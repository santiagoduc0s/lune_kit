import 'package:lune/core/exceptions/exceptions.dart';
import 'package:lune/domain/entities/device_entity.dart';
import 'package:lune/domain/repositories/device_repository.dart';

class GetDeviceUseCase {
  GetDeviceUseCase(this._repository);

  final DeviceRepository _repository;

  Future<DeviceEntity> call() async {
    try {
      return await _repository.getDevice();
    } on NotFoundException {
      await _repository.createDevice();
      return _repository.getDevice();
    }
  }
}
