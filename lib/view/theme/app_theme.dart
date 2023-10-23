import 'package:flutter/material.dart';

final class AppTheme {
  const AppTheme._();

  static final dark = ThemeData.dark().copyWith(
    primaryColor: const Color(0xff1989d4),
  );

  static final light = ThemeData.light().copyWith(
    primaryColor: const Color(0xff1989d4),
  );
}
