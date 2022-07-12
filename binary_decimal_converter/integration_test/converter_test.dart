import 'package:binary_decimal_converter/ui/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  group('converter ui |', () {
    group('value adjustment |', () {
      testWidgets('0 -> 1', (tester) async {
        await tester.pumpWidget(const App());
        final button = find.byKey(const Key('1'));
        final text = find.byKey(const Key('binary'));
        expect((text.evaluate().single.widget as Text).data, '0');
        await tester.tap(button);
        await tester.pumpAndSettle();
        expect((text.evaluate().single.widget as Text).data, '1');
      });
      testWidgets('1 -> 11', (tester) async {
        await tester.pumpWidget(const App());
        final text = find.byKey(const Key('binary'));
        await tester.tap(find.byKey(const Key('1')));
        await tester.pumpAndSettle();
        expect((text.evaluate().single.widget as Text).data, '1');
        await tester.tap(find.byKey(const Key('1')));
        await tester.pumpAndSettle();
        expect((text.evaluate().single.widget as Text).data, '11');
      });
      testWidgets('0 -> 7', (tester) async {
        await tester.pumpWidget(const App());
        await tester.tap(find.byKey(const Key('switch')));
        await tester.pumpAndSettle();
        final text = find.byKey(const Key('decimal'));
        expect((text.evaluate().single.widget as Text).data, '0');
        await tester.tap(find.byKey(const Key('7')));
        await tester.pumpAndSettle();
        expect((text.evaluate().single.widget as Text).data, '7');
      });
      testWidgets('1 -> 17', (tester) async {
        await tester.pumpWidget(const App());
        await tester.tap(find.byKey(const Key('switch')));
        await tester.pumpAndSettle();
        final text = find.byKey(const Key('decimal'));
        await tester.tap(find.byKey(const Key('1')));
        await tester.pumpAndSettle();
        expect((text.evaluate().single.widget as Text).data, '1');
        await tester.tap(find.byKey(const Key('7')));
        await tester.pumpAndSettle();
        expect((text.evaluate().single.widget as Text).data, '17');
      });
    });

    group('binary to decimal |', () {
      testWidgets('0 -> 0', (tester) async {
        await tester.pumpWidget(const App());
        final binary = find.byKey(const Key('binary'));
        final decimal = find.byKey(const Key('decimal'));
        expect((binary.evaluate().single.widget as Text).data, '0');
        expect((decimal.evaluate().single.widget as Text).data, '0');
        await tester.tap(find.byKey(const Key('0')));
        await tester.pumpAndSettle();
        expect((binary.evaluate().single.widget as Text).data, '0');
        expect((decimal.evaluate().single.widget as Text).data, '0');
      });
      testWidgets('1 -> 1', (tester) async {
        await tester.pumpWidget(const App());
        final binary = find.byKey(const Key('binary'));
        final decimal = find.byKey(const Key('decimal'));
        expect((binary.evaluate().single.widget as Text).data, '0');
        expect((decimal.evaluate().single.widget as Text).data, '0');
        await tester.tap(find.byKey(const Key('1')));
        await tester.pumpAndSettle();
        expect((binary.evaluate().single.widget as Text).data, '1');
        expect((decimal.evaluate().single.widget as Text).data, '1');
      });
      testWidgets('111 -> 7', (tester) async {
        await tester.pumpWidget(const App());
        final binary = find.byKey(const Key('binary'));
        final decimal = find.byKey(const Key('decimal'));
        expect((binary.evaluate().single.widget as Text).data, '0');
        expect((decimal.evaluate().single.widget as Text).data, '0');
        await tester.tap(find.byKey(const Key('1')));
        await tester.pumpAndSettle();
        await tester.tap(find.byKey(const Key('1')));
        await tester.pumpAndSettle();
        await tester.tap(find.byKey(const Key('1')));
        await tester.pumpAndSettle();
        expect((binary.evaluate().single.widget as Text).data, '111');
        expect((decimal.evaluate().single.widget as Text).data, '7');
      });
      testWidgets('1101 -> 13', (tester) async {
        await tester.pumpWidget(const App());
        final binary = find.byKey(const Key('binary'));
        final decimal = find.byKey(const Key('decimal'));
        expect((binary.evaluate().single.widget as Text).data, '0');
        expect((decimal.evaluate().single.widget as Text).data, '0');
        await tester.tap(find.byKey(const Key('1')));
        await tester.pumpAndSettle();
        await tester.tap(find.byKey(const Key('1')));
        await tester.pumpAndSettle();
        await tester.tap(find.byKey(const Key('0')));
        await tester.pumpAndSettle();
        await tester.tap(find.byKey(const Key('1')));
        await tester.pumpAndSettle();
        expect((binary.evaluate().single.widget as Text).data, '1101');
        expect((decimal.evaluate().single.widget as Text).data, '13');
      });
    });

    group('decimal to binary |', () {
      testWidgets('0 -> 0', (tester) async {
        await tester.pumpWidget(const App());
        await tester.tap(find.byKey(const Key('switch')));
        await tester.pumpAndSettle();
        await tester.pumpWidget(const App());
        final binary = find.byKey(const Key('binary'));
        final decimal = find.byKey(const Key('decimal'));
        expect((binary.evaluate().single.widget as Text).data, '0');
        expect((decimal.evaluate().single.widget as Text).data, '0');
        await tester.tap(find.byKey(const Key('0')));
        await tester.pumpAndSettle();
        expect((binary.evaluate().single.widget as Text).data, '0');
        expect((decimal.evaluate().single.widget as Text).data, '0');
      });
      testWidgets('1 -> 1', (tester) async {
        await tester.pumpWidget(const App());
        await tester.tap(find.byKey(const Key('switch')));
        await tester.pumpAndSettle();
        await tester.pumpWidget(const App());
        final binary = find.byKey(const Key('binary'));
        final decimal = find.byKey(const Key('decimal'));
        expect((binary.evaluate().single.widget as Text).data, '0');
        expect((decimal.evaluate().single.widget as Text).data, '0');
        await tester.tap(find.byKey(const Key('1')));
        await tester.pumpAndSettle();
        expect((binary.evaluate().single.widget as Text).data, '1');
        expect((decimal.evaluate().single.widget as Text).data, '1');
      });
      testWidgets('7 -> 111', (tester) async {
        await tester.pumpWidget(const App());
        await tester.tap(find.byKey(const Key('switch')));
        await tester.pumpAndSettle();
        await tester.pumpWidget(const App());
        final binary = find.byKey(const Key('binary'));
        final decimal = find.byKey(const Key('decimal'));
        expect((binary.evaluate().single.widget as Text).data, '0');
        expect((decimal.evaluate().single.widget as Text).data, '0');
        await tester.tap(find.byKey(const Key('7')));
        await tester.pumpAndSettle();
        expect((binary.evaluate().single.widget as Text).data, '111');
        expect((decimal.evaluate().single.widget as Text).data, '7');
      });
      testWidgets('13 -> 1101', (tester) async {
        await tester.pumpWidget(const App());
        await tester.tap(find.byKey(const Key('switch')));
        await tester.pumpAndSettle();
        await tester.pumpWidget(const App());
        final binary = find.byKey(const Key('binary'));
        final decimal = find.byKey(const Key('decimal'));
        expect((binary.evaluate().single.widget as Text).data, '0');
        expect((decimal.evaluate().single.widget as Text).data, '0');
        await tester.tap(find.byKey(const Key('1')));
        await tester.pumpAndSettle();
        await tester.tap(find.byKey(const Key('3')));
        await tester.pumpAndSettle();
        expect((binary.evaluate().single.widget as Text).data, '1101');
        expect((decimal.evaluate().single.widget as Text).data, '13');
      });
    });
  });
}
