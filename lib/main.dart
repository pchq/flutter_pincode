import 'package:flutter/material.dart';
import 'package:pincode/pages/pin_code_page.dart';
import 'package:pincode/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const PinCodePage(),
      theme: AppTheme.theme,
    );
  }
}
