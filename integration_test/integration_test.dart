import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:flutter_one/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('integration testing', (WidgetTester tester) async {
    //setup
    app.main();
    await tester.pumpAndSettle();
    dynamic button = find.byIcon(Icons.skip_next);
    // var elv = find.byType(FloatingActionButton);
    // var elv = find.byType(Icon);
    // dynamic button = find.ancestor(
    //   of: find.byIcon(Icons.add),
    //   matching:
    //       find.byWidgetPredicate((widget) => widget is FloatingActionButton),
    // );
    // final  button =  find.byType(FloatingActionButton);
    // do
    // await tester.tap(find.byIcon(Icons.add));
    // await tester.tap(find.byType(FloatingActionButton));
    await tester.tap(button);
    await Future.delayed(const Duration(seconds: 1));
    dynamic text = find.text('hello');
    await tester.pumpAndSettle();

    // test
    expect(text, findsOneWidget);
    // expect(button, findsOneWidget);
    // expect(elv, findsNWidgets(6));
    // expect(elv, findsOneWidget);
  });
}
