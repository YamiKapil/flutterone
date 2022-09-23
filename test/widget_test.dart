import 'package:flutter/material.dart';
import 'package:flutter_one/click_game/click_game.dart';
import 'package:flutter_one/main_page.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('tesing textfield', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: MainPage(),
    ));
    final button = find.byKey(const ValueKey('keyTextField'));
    expect(button, findsOneWidget);
  });
}
