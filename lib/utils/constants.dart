import 'package:flutter/material.dart';

class Constants {
  static const radius = 10.0;
  final kThemeApp = ThemeData(
    colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.teal)
        .copyWith(secondary: Color(0xFFDE5B6D)),
  );
}
