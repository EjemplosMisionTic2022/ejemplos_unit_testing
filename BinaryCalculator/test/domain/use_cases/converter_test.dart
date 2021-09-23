import 'package:binary_calculator/domain/use_cases/converter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('0-adjustment', () {
    final result = Converter.adjustValue("0", 1);
    expect(result, "1");
  });

  test('non-0-adjustment', () {
    final result = Converter.adjustValue("12", 3);
    expect(result, "123");
  });

  test('binary-to-decimal', () {
    expect(Converter.bin2dec("111"), "7");
  });

  test('decimal-to-binary', () {
    expect(Converter.dec2bin("7"), "111");
  });
}
