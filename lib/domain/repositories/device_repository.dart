import 'package:lune/domain/entities/entities.dart';

abstract class DeviceRepository {
  Future<DeviceEntity> getDevice();

  Future<void> createDevice();

  Future<void> updateDevice({
    String? token,
  });

  Future<void> deleteDevice();
}
