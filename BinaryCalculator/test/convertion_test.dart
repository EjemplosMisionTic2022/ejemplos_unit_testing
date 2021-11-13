import 'package:binary_calculator/domain/use_cases/convertion.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late Convertion convertion;

  setUp(() {
    convertion = Convertion();
  });
  
  test('convertion-init', () {
    expect(convertion.data.decimal, "0");
    expect(convertion.data.binary, "0");
  });

  test('binary-to-decimal', () {
    convertion.convertBinary(1);
    expect(convertion.data.decimal, "1");
    expect(convertion.data.binary, "1");
  });

  test('decimal-to-binary', () {
    convertion.convertDecimal(7);
    expect(convertion.data.decimal, "7");
    expect(convertion.data.binary, "111");
  });

  test('reset', () {
    convertion.convertDecimal(7);
    expect(convertion.data.decimal, "7");
    expect(convertion.data.binary, "111");
    convertion.reset();
    expect(convertion.data.decimal, "0");
    expect(convertion.data.binary, "0");
  });
  // Sigue las instrucciones del instructor para crear los siguientes tests
  //   'convertion-init'
  //  'binary-to-decimal',
  //   'decimal-to-binary'
  //   'reset'
}
