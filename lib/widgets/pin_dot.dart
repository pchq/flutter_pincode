import 'package:flutter/material.dart';
import 'package:pincode/theme.dart';

class PinDot extends StatelessWidget {
  final bool isActive;
  final double size;
  const PinDot({
    Key? key,
    this.isActive = false,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: isActive ? AppTheme.greenColor : Colors.transparent,
        border: Border.all(
            color: isActive ? AppTheme.greenColor : AppTheme.greyColor,
            width: 1),
        borderRadius: BorderRadius.all(Radius.circular(size / 2)),
      ),
    );
  }
}