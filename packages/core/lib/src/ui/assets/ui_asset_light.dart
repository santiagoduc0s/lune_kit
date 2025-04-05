import 'package:core/src/ui/assets/assets.dart';

/// The light theme implementation of [UIAsset].
class UIAssetLight implements UIAsset {
  UIAssetLight._singleton();

  /// Singleton instance of [UIAssetLight].
  static final UIAssetLight instance = UIAssetLight._singleton();

  @override
  String get folderAssetPath => 'packages/app_ui/assets/light';

  @override
  String get logo => '$folderAssetPath/icons/logo.svg';
}
