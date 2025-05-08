import 'package:lune/features/pages/public_onboard/domain/entities/public_onboard_status_entity.dart';
import 'package:lune/features/pages/public_onboard/domain/enums/enums.dart';

class PublicOnboardStatusModel extends PublicOnboardStatusEntity {
  PublicOnboardStatusModel({
    required super.status,
  });

  factory PublicOnboardStatusModel.fromString(String? value) {
    return PublicOnboardStatusModel(
      status: _statusFromString(value),
    );
  }

  factory PublicOnboardStatusModel.fromEntity(
    PublicOnboardStatusEntity entity,
  ) {
    return PublicOnboardStatusModel(
      status: entity.status,
    );
  }

  String toJson() => _stringFromStatus(status);

  static PublicOnboardStatusEnum _statusFromString(String? value) {
    switch (value) {
      case 'seen':
        return PublicOnboardStatusEnum.seen;
      case 'unseen':
      default:
        return PublicOnboardStatusEnum.unseen;
    }
  }

  static String _stringFromStatus(PublicOnboardStatusEnum status) {
    switch (status) {
      case PublicOnboardStatusEnum.seen:
        return 'seen';
      case PublicOnboardStatusEnum.unseen:
        return 'unseen';
    }
  }
}
