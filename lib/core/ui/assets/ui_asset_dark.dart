import 'package:lune/core/ui/assets/assets.dart';
import 'package:lune/gen/assets.gen.dart';

/// The dark theme implementation of [UIAsset].
class UIAssetDark implements UIAsset {
  UIAssetDark._singleton();

  /// Singleton instance of [UIAssetDark].
  static final UIAssetDark instance = UIAssetDark._singleton();

  @override
  String get logo => Assets.dark.icons.logo;
}
