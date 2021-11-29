import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:integration_test/integration_test.dart';
import 'package:testing_controllers/ui/controllers/name_controller.dart';
import 'package:testing_controllers/ui/my_app.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  testWidgets('Simple integration hello test', (WidgetTester tester) async {
    Get.put(NameController());
    await tester.pumpWidget(MyApp());

    await tester.pump();

    expect(find.text('Testing demo'), findsOneWidget);

    expect(find.text('Hello N/A'), findsOneWidget);

    await tester.enterText(find.byKey(const Key('TextFieldName')), 'Juan');

    await tester.tap(find.byKey(const Key('ButtonSetName')));

    await tester.pump(const Duration(seconds: 3));

    expect(find.text('Hello Juan'), findsOneWidget);

    expect(find.text('Hello N/A'), findsNothing);

    expect(find.text('Testing demo'), findsOneWidget);

    await tester.pumpAndSettle(const Duration(seconds: 3));
  });
}
