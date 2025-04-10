import 'package:core/core.dart';

enum PublicOnboardStatus {
  /// The user has seen the public onboard
  seen,

  /// The user has not seen the public onboard
  unseen;

  static PublicOnboardStatus fromString(String? value) {
    switch (value) {
      case 'seen':
        return seen;
      case 'unseen':
        return unseen;
      default:
        return unseen;
    }
  }

  String get value {
    switch (this) {
      case seen:
        return 'seen';
      case unseen:
        return 'unseen';
    }
  }
}

class PublicOnboardManager {
  static const String _showPublicManager = 'publicOnboardStatus';

  static PublicOnboardStatus getPublicOnboardStatus() {
    final publicOnboardStatusRaw = KeyValueStorage.instance.get<String>(
      _showPublicManager,
    );

    return PublicOnboardStatus.fromString(
      publicOnboardStatusRaw,
    );
  }

  static void setPublicOnboardStatus(PublicOnboardStatus status) {
    KeyValueStorage.instance.save(
      _showPublicManager,
      status.value,
    );
  }
}
