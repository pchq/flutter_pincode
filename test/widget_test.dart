import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:pincode/main.dart';
import 'package:pincode/widgets/pin_dot.dart';

void main() {
  testWidgets('Pin code input test', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(
      find.byWidgetPredicate((widget) => widget is PinDot && widget.isActive),
      findsNothing,
    );

    await tester.tap(find.text('1'));
    await tester.pump();
    expect(
      find.byWidgetPredicate((widget) => widget is PinDot && widget.isActive),
      findsOneWidget,
    );

    await tester.tap(find.text('0'));
    await tester.pump();
    expect(
      find.byWidgetPredicate((widget) => widget is PinDot && widget.isActive),
      findsNWidgets(2),
    );

    await tester.tap(find.text('5'));
    await tester.pump();
    expect(
      find.byWidgetPredicate((widget) => widget is PinDot && widget.isActive),
      findsNWidgets(3),
    );

    await tester.tap(find.text('9'));
    await tester.pump();
    expect(
      find.byWidgetPredicate((widget) => widget is PinDot && widget.isActive),
      findsNWidgets(4),
    );

    await tester.tap(find.text('9'));
    await tester.pump();
    expect(
      find.byWidgetPredicate((widget) => widget is PinDot && widget.isActive),
      findsNWidgets(4),
    );

    final backspaceButton = find.byIcon(Icons.backspace_outlined);
    await tester.tap(backspaceButton);
    await tester.pump();
    expect(
      find.byWidgetPredicate((widget) => widget is PinDot && !widget.isActive),
      findsOneWidget,
    );

    await tester.tap(backspaceButton);
    await tester.pump();
    expect(
      find.byWidgetPredicate((widget) => widget is PinDot && !widget.isActive),
      findsNWidgets(2),
    );

    await tester.tap(backspaceButton);
    await tester.tap(backspaceButton);
    await tester.tap(backspaceButton);
    await tester.tap(backspaceButton);
    await tester.pump();
    expect(
      find.byWidgetPredicate((widget) => widget is PinDot && widget.isActive),
      findsNothing,
    );
  });
}
