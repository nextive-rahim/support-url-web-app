import 'package:flutter_test/flutter_test.dart';

import 'package:support_url/main.dart';

void main() {
  testWidgets('Support page renders key sections', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Support – Vitez App'), findsOneWidget);
    expect(find.text('Common Troubleshooting'), findsOneWidget);
    expect(find.text('Contact Us'), findsOneWidget);
    expect(find.text('FAQs'), findsOneWidget);
  });
}
