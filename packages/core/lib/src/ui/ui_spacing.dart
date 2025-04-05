/// Extension on [double] to provide spacing constants.
extension UISpacingExtensionDouble on num {
  /// Spacing multiplier for 1x.
  double get space => (this * UISpacing.spaceUnit).toDouble();
}

// /// Extension on [int] to provide spacing constants.
// extension UISpacingExtensionInt on int {
//   /// Spacing multiplier for 1x.
//   int get space => this * UISpacing.spaceUnit;
// }

/// A class that defines the spacing constants used in the UI.
abstract class UISpacing {
  /// Spacing constants.
  static const spaceUnit = 4;

  /// Spacing infinity.
  static const infinity = double.infinity;

  /// Spacing zero.
  static const zero = 0.0;
}
