import 'package:flutter_test/flutter_test.dart';

import 'package:digital_manager/app.dart';

void main() {
  testWidgets('Digital Manager app loads', (tester) async {
    await tester.pumpWidget(const DigitalManagerApp());

    expect(find.text('المدير الرقمي التنفيذي'), findsOneWidget);
  });
}