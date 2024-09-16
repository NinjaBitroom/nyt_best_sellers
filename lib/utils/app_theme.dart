import 'package:flutter/material.dart';

abstract final class AppTheme {
  static final defaultLightTheme = ThemeData.from(
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.redAccent,
      brightness: Brightness.light,
      dynamicSchemeVariant: DynamicSchemeVariant.fidelity,
    ),
  );
  static final defaultDarkTheme = ThemeData.from(
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.redAccent,
      brightness: Brightness.dark,
      dynamicSchemeVariant: DynamicSchemeVariant.fidelity,
    ),
  );
}
