import 'package:lune/domain/entities/entities.dart';

abstract class PublicOnboardRepository {
  Future<PublicOnboardStatus> getStatus();

  Future<void> setStatus(PublicOnboardStatus status);
}
