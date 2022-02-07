import 'package:flutter/material.dart';

class KeyboardButton extends StatelessWidget {
  final String? label;
  final Widget? child;
  final Function() onTap;

  const KeyboardButton({
    Key? key,
    this.label,
    this.child,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Align(
        alignment: Alignment.center,
        child: label != null
            ? Text(
                label!,
                style:
                    const TextStyle(fontSize: 34, fontWeight: FontWeight.w300),
              )
            : child,
      ),
    );
  }
}