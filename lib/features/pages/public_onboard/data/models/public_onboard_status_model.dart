import 'package:lune/features/pages/public_onboard/domain/enums/enums.dart';

class PublicOnboardStatusModel {
  PublicOnboardStatusModel({
    required this.value,
  });

  factory PublicOnboardStatusModel.fromString(String? value) {
    return PublicOnboardStatusModel(
      value: value ?? 'unseen',
    );
  }

  factory PublicOnboardStatusModel.fromEntity(
    PublicOnboardStatusEnum value,
  ) {
    switch (value) {
      case PublicOnboardStatusEnum.seen:
        return PublicOnboardStatusModel(value: 'seen');
      case PublicOnboardStatusEnum.unseen:
        return PublicOnboardStatusModel(value: 'unseen');
    }
  }

  final String value;

  PublicOnboardStatusEnum toEntity() {
    switch (value) {
      case 'seen':
        return PublicOnboardStatusEnum.seen;
      case 'unseen':
        return PublicOnboardStatusEnum.unseen;
      default:
        return PublicOnboardStatusEnum.unseen;
    }
  }
}
