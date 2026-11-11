import 'package:flutter_test/flutter_test.dart';

import 'package:support_url/main.dart';

void main() {
  testWidgets('Privacy policy page renders key sections', (tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Privacy policy'), findsOneWidget);
    expect(find.text('Delete Your Personal Data'), findsOneWidget);
    expect(find.text('Links to Other Websites'), findsOneWidget);
  });
}
