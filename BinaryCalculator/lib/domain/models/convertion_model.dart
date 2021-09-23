import 'package:binary_calculator/domain/use_cases/converter.dart';

class ConvertionData {
  String _decimal = "0", _binary = "0";

  String get decimal => _decimal;

  String get binary => _binary;

  void reset() {
    _decimal = "0";
    _binary = "0";
  }

  void updateBinary(int digit) {
    _binary = Converter.adjustValue(_binary, digit);
    _decimal = Converter.bin2dec(_binary);
  }

  void updateDecimal(int digit) {
    _decimal = Converter.adjustValue(_decimal, digit);
    _binary = Converter.dec2bin(_decimal);
  }
}
