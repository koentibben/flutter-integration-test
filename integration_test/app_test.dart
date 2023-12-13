import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:integration_test_tutorial/main.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  testWidgets(
    "After inputting a text, check that text is correctly shown on input field",
    (WidgetTester tester) async {
      await tester.pumpWidget(MyApp());

      final inputText = 'Hello there, this is an input.';
      await tester.enterText(find.byKey(Key('your-text-field')), inputText);

      expect(find.byType(TypingPage), findsOneWidget);
      expect(find.byType(DisplayPage), findsNothing);
      expect(find.text(inputText), findsOneWidget);
    },
  );
}
