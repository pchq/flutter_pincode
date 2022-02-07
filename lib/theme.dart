import 'package:flutter/material.dart';

class AppTheme {
  static final theme = ThemeData(
    fontFamily: 'Roboto',
    textTheme: const TextTheme(
      bodyText2: TextStyle(
        color: AppTheme.foregroundColor,
      ),
    ),
  );

  /// colors
  static const backgroundColor = Colors.white;
  static const foregroundColor = Colors.black87;
  static const greyColor = Colors.black12;
  static const greenColor = Colors.greenAccent;
}
