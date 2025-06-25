import 'package:lune/domain/repositories/repositories.dart';

class SaveTokenUseCase {
  SaveTokenUseCase({
    required MessagingRepository messagingRepository,
    required DeviceRepository deviceRepository,
  })  : _messagingRepository = messagingRepository,
        _deviceRepository = deviceRepository;

  final MessagingRepository _messagingRepository;
  final DeviceRepository _deviceRepository;

  Future<void> call() async {
    final token = await _messagingRepository.getFCMToken();

    if (token == null) return;

    await _deviceRepository.updateDevice(
      token: token,
    );
  }
}
