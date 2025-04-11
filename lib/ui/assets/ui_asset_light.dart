import 'package:lune/gen/assets.gen.dart';
import 'package:lune/ui/assets/assets.dart';

/// The light theme implementation of [UIAsset].
class UIAssetLight implements UIAsset {
  UIAssetLight._singleton();

  /// Singleton instance of [UIAssetLight].
  static final UIAssetLight instance = UIAssetLight._singleton();

  @override
  String get logo => Assets.light.icons.logo;
}
