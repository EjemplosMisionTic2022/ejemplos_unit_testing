import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/mockito.dart';
import 'package:testing_controllers/ui/controllers/name_controller.dart';
import 'package:testing_controllers/ui/hello.dart';

// Una versión Mock de nuestro controlador, en ella podemos controlar los métodos
// y atributos para tener valores fijos contra lo que podamos probar

class MockNameController extends GetxService
    with Mock
    implements NameController {
  var _name = 'NAME'.obs;

  @override
  String get name => _name.value;

  @override
  setName(val) => _name.value = val;
}

void main() {
  setUp(() {});
  testWidgets('Simple hello test', (WidgetTester tester) async {
    // aquí instanciamos el mock controller
    MockNameController mockNameController = MockNameController();
    // lo pasamos al DI de Get
    Get.put<NameController>(mockNameController);
    await tester.pumpWidget(const MaterialApp(
        home: Scaffold(
      body: Hello(),
    )));

    await tester.pump();

    expect(find.text('Testing demo'), findsOneWidget);

    expect(find.text('Hello NAME'), findsOneWidget);

    await tester.enterText(find.byKey(const Key('TextFieldName')), 'Juan');

    await tester.tap(find.byKey(const Key('ButtonSetName')));

    await tester.pump();

    expect(find.text('Hello Juan'), findsOneWidget);

    expect(find.text('Hello NAME'), findsNothing);

    expect(find.text('Testing demo'), findsOneWidget);
  });
}
