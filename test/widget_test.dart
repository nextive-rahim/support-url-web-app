import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:support_url/main.dart';

void main() {
  testWidgets('delete button is enabled only after typing DELETE', (
    WidgetTester tester,
  ) async {
    tester.view.physicalSize = const Size(1200, 2400);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);

    await tester.pumpWidget(const MyApp());

    expect(find.text('Delete Your Account'), findsOneWidget);
    expect(find.text('Shikkhangon15@gmail.com'), findsOneWidget);

    await tester.tap(find.widgetWithText(FilledButton, 'Delete Account'));
    await tester.pumpAndSettle();
    expect(find.text('Delete your account?'), findsOneWidget);

    FilledButton confirmButton() => tester.widget<FilledButton>(
      find.descendant(
        of: find.byType(Dialog),
        matching: find.widgetWithText(FilledButton, 'Delete Account'),
      ),
    );

    expect(confirmButton().onPressed, isNull);

    await tester.enterText(find.byType(TextField), 'DELETE');
    await tester.pump();
    expect(confirmButton().onPressed, isNotNull);

    await tester.tap(
      find.descendant(
        of: find.byType(Dialog),
        matching: find.widgetWithText(FilledButton, 'Delete Account'),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.text('Request submitted'), findsOneWidget);
  });
}
