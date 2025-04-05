import 'package:core/src/ui/assets/assets.dart';

/// The dark theme implementation of [UIAsset].
class UIAssetDark implements UIAsset {
  UIAssetDark._singleton();

  /// Singleton instance of [UIAssetDark].
  static final UIAssetDark instance = UIAssetDark._singleton();

  @override
  String get folderAssetPath => 'packages/app_ui/assets/dark';

  @override
  String get logo => '$folderAssetPath/icons/logo.svg';
}
