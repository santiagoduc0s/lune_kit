import 'package:flutter/material.dart';

class MaterialThemeCustom {
  const MaterialThemeCustom(this.textTheme);
  final TextTheme textTheme;

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff904a45),
      surfaceTint: Color(0xff904a45),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffffdad6),
      onPrimaryContainer: Color(0xff73332f),
      secondary: Color(0xff775653),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffffdad6),
      onSecondaryContainer: Color(0xff5d3f3c),
      tertiary: Color(0xff725b2e),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xfffedea6),
      onTertiaryContainer: Color(0xff584419),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff93000a),
      surface: Color(0xfffff8f7),
      onSurface: Color(0xff231918),
      onSurfaceVariant: Color(0xff534342),
      outline: Color(0xff857371),
      outlineVariant: Color(0xffd8c2bf),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff392e2d),
      inversePrimary: Color(0xffffb3ac),
      primaryFixed: Color(0xffffdad6),
      onPrimaryFixed: Color(0xff3b0908),
      primaryFixedDim: Color(0xffffb3ac),
      onPrimaryFixedVariant: Color(0xff73332f),
      secondaryFixed: Color(0xffffdad6),
      onSecondaryFixed: Color(0xff2c1513),
      secondaryFixedDim: Color(0xffe7bdb8),
      onSecondaryFixedVariant: Color(0xff5d3f3c),
      tertiaryFixed: Color(0xfffedea6),
      onTertiaryFixed: Color(0xff261900),
      tertiaryFixedDim: Color(0xffe1c38c),
      onTertiaryFixedVariant: Color(0xff584419),
      surfaceDim: Color(0xffe8d6d4),
      surfaceBright: Color(0xfffff8f7),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffff0ef),
      surfaceContainer: Color(0xfffceae8),
      surfaceContainerHigh: Color(0xfff6e4e2),
      surfaceContainerHighest: Color(0xfff1dedc),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff5e2320),
      surfaceTint: Color(0xff904a45),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffa15852),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff4b2f2c),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff876561),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff463309),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff826a3b),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff740006),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffcf2c27),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffff8f7),
      onSurface: Color(0xff180f0e),
      onSurfaceVariant: Color(0xff413331),
      outline: Color(0xff5f4f4d),
      outlineVariant: Color(0xff7b6967),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff392e2d),
      inversePrimary: Color(0xffffb3ac),
      primaryFixed: Color(0xffa15852),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff84413c),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff876561),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff6d4d4a),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff826a3b),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff675126),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffd4c3c1),
      surfaceBright: Color(0xfffff8f7),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffff0ef),
      surfaceContainer: Color(0xfff6e4e2),
      surfaceContainerHigh: Color(0xffebd9d7),
      surfaceContainerHighest: Color(0xffdfcecc),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff511917),
      surfaceTint: Color(0xff904a45),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff763631),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff3f2523),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff60423f),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff3b2902),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff5b461b),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff600004),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff98000a),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffff8f7),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff000000),
      outline: Color(0xff362927),
      outlineVariant: Color(0xff554544),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff392e2d),
      inversePrimary: Color(0xffffb3ac),
      primaryFixed: Color(0xff763631),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff59201d),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff60423f),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff472c29),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff5b461b),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff423006),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffc6b5b3),
      surfaceBright: Color(0xfffff8f7),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xffffedeb),
      surfaceContainer: Color(0xfff1dedc),
      surfaceContainerHigh: Color(0xffe2d0ce),
      surfaceContainerHighest: Color(0xffd4c3c1),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffffb3ac),
      surfaceTint: Color(0xffffb3ac),
      onPrimary: Color(0xff571e1b),
      primaryContainer: Color(0xff73332f),
      onPrimaryContainer: Color(0xffffdad6),
      secondary: Color(0xffe7bdb8),
      onSecondary: Color(0xff442927),
      secondaryContainer: Color(0xff5d3f3c),
      onSecondaryContainer: Color(0xffffdad6),
      tertiary: Color(0xffe1c38c),
      onTertiary: Color(0xff402d04),
      tertiaryContainer: Color(0xff584419),
      onTertiaryContainer: Color(0xfffedea6),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff1a1110),
      onSurface: Color(0xfff1dedc),
      onSurfaceVariant: Color(0xffd8c2bf),
      outline: Color(0xffa08c8a),
      outlineVariant: Color(0xff534342),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xfff1dedc),
      inversePrimary: Color(0xff904a45),
      primaryFixed: Color(0xffffdad6),
      onPrimaryFixed: Color(0xff3b0908),
      primaryFixedDim: Color(0xffffb3ac),
      onPrimaryFixedVariant: Color(0xff73332f),
      secondaryFixed: Color(0xffffdad6),
      onSecondaryFixed: Color(0xff2c1513),
      secondaryFixedDim: Color(0xffe7bdb8),
      onSecondaryFixedVariant: Color(0xff5d3f3c),
      tertiaryFixed: Color(0xfffedea6),
      onTertiaryFixed: Color(0xff261900),
      tertiaryFixedDim: Color(0xffe1c38c),
      onTertiaryFixedVariant: Color(0xff584419),
      surfaceDim: Color(0xff1a1110),
      surfaceBright: Color(0xff423735),
      surfaceContainerLowest: Color(0xff140c0b),
      surfaceContainerLow: Color(0xff231918),
      surfaceContainer: Color(0xff271d1c),
      surfaceContainerHigh: Color(0xff322827),
      surfaceContainerHighest: Color(0xff3d3231),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffffd2cd),
      surfaceTint: Color(0xffffb3ac),
      onPrimary: Color(0xff481311),
      primaryContainer: Color(0xffcc7b74),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xfffed2ce),
      onSecondary: Color(0xff381f1d),
      secondaryContainer: Color(0xffad8884),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xfff8d8a0),
      onTertiary: Color(0xff332300),
      tertiaryContainer: Color(0xffa88d5b),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffd2cc),
      onError: Color(0xff540003),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff1a1110),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffeed7d5),
      outline: Color(0xffc2adab),
      outlineVariant: Color(0xff9f8c8a),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xfff1dedc),
      inversePrimary: Color(0xff743430),
      primaryFixed: Color(0xffffdad6),
      onPrimaryFixed: Color(0xff2c0102),
      primaryFixedDim: Color(0xffffb3ac),
      onPrimaryFixedVariant: Color(0xff5e2320),
      secondaryFixed: Color(0xffffdad6),
      onSecondaryFixed: Color(0xff200b09),
      secondaryFixedDim: Color(0xffe7bdb8),
      onSecondaryFixedVariant: Color(0xff4b2f2c),
      tertiaryFixed: Color(0xfffedea6),
      onTertiaryFixed: Color(0xff190f00),
      tertiaryFixedDim: Color(0xffe1c38c),
      onTertiaryFixedVariant: Color(0xff463309),
      surfaceDim: Color(0xff1a1110),
      surfaceBright: Color(0xff4d4241),
      surfaceContainerLowest: Color(0xff0d0605),
      surfaceContainerLow: Color(0xff251b1a),
      surfaceContainer: Color(0xff302524),
      surfaceContainerHigh: Color(0xff3b302f),
      surfaceContainerHighest: Color(0xff463b3a),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffffecea),
      surfaceTint: Color(0xffffb3ac),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xffffaea6),
      onPrimaryContainer: Color(0xff220001),
      secondary: Color(0xffffecea),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffe3b9b5),
      onSecondaryContainer: Color(0xff190605),
      tertiary: Color(0xffffeed4),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xffddbf89),
      onTertiaryContainer: Color(0xff120a00),
      error: Color(0xffffece9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffaea4),
      onErrorContainer: Color(0xff220001),
      surface: Color(0xff1a1110),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffffffff),
      outline: Color(0xffffecea),
      outlineVariant: Color(0xffd4bebb),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xfff1dedc),
      inversePrimary: Color(0xff743430),
      primaryFixed: Color(0xffffdad6),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xffffb3ac),
      onPrimaryFixedVariant: Color(0xff2c0102),
      secondaryFixed: Color(0xffffdad6),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffe7bdb8),
      onSecondaryFixedVariant: Color(0xff200b09),
      tertiaryFixed: Color(0xfffedea6),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xffe1c38c),
      onTertiaryFixedVariant: Color(0xff190f00),
      surfaceDim: Color(0xff1a1110),
      surfaceBright: Color(0xff5a4d4c),
      surfaceContainerLowest: Color(0xff000000),
      surfaceContainerLow: Color(0xff271d1c),
      surfaceContainer: Color(0xff392e2d),
      surfaceContainerHigh: Color(0xff443938),
      surfaceContainerHighest: Color(0xff504443),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
        useMaterial3: true,
        brightness: colorScheme.brightness,
        colorScheme: colorScheme,
        textTheme: textTheme.apply(
          bodyColor: colorScheme.onSurface,
          displayColor: colorScheme.onSurface,
        ),
        scaffoldBackgroundColor: colorScheme.surface,
        canvasColor: colorScheme.surface,
      );

  List<ExtendedColor> get extendedColors => [];
}

class ExtendedColor {
  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
  final Color seed;
  final Color value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
