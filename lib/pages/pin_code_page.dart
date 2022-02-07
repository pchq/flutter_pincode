import 'package:flutter/material.dart';

import 'package:pincode/theme.dart';
import 'package:pincode/widgets/keyboard_button.dart';
import 'package:pincode/widgets/pin_dot.dart';

const int _pinCodeLength = 4;
const double _pinDotSize = 28;

class PinCodePage extends StatefulWidget {
  const PinCodePage({Key? key}) : super(key: key);

  @override
  State<PinCodePage> createState() => _PinCodePageState();
}

class _PinCodePageState extends State<PinCodePage> {
  String _code = '';

  void _addNumber(int number) {
    if (_code.length < _pinCodeLength) {
      setState(() {
        _code += number.toString();
      });
    }
  }

  void _removeNumber() {
    if (_code.isNotEmpty) {
      setState(() {
        _code = _code.substring(0, _code.length - 1);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isVertical = size.width < size.height;

    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.help_outline,
              color: Colors.black.withOpacity(.6),
              size: 24,
            ),
          )
        ],
      ),
      body: Column(
        children: [
          const Spacer(flex: 4),
          const Text(
            'Please enter PIN code',
            style: TextStyle(fontSize: 24, height: 1),
          ),
          const Spacer(flex: 5),
          SizedBox(
            width: _pinDotSize * _pinCodeLength + 24 * (_pinCodeLength - 1),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List<PinDot>.generate(
                _pinCodeLength,
                (int index) => PinDot(
                  size: _pinDotSize,
                  isActive: index < _code.length,
                ),
              ),
            ),
          ),
          const Spacer(flex: 18),
          GridView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: isVertical ? 2 : 5,
            ),
            children: [
              KeyboardButton(label: '1', onTap: () => _addNumber(1)),
              KeyboardButton(label: '2', onTap: () => _addNumber(2)),
              KeyboardButton(label: '3', onTap: () => _addNumber(3)),
              KeyboardButton(label: '4', onTap: () => _addNumber(4)),
              KeyboardButton(label: '5', onTap: () => _addNumber(5)),
              KeyboardButton(label: '6', onTap: () => _addNumber(6)),
              KeyboardButton(label: '7', onTap: () => _addNumber(7)),
              KeyboardButton(label: '8', onTap: () => _addNumber(8)),
              KeyboardButton(label: '9', onTap: () => _addNumber(9)),
              KeyboardButton(
                child: const Icon(Icons.fingerprint, size: 36),
                onTap: () {},
              ),
              KeyboardButton(label: '0', onTap: () => _addNumber(0)),
              KeyboardButton(
                child: const Icon(Icons.backspace_outlined, size: 36),
                onTap: () => _removeNumber(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
