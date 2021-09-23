import 'package:binary_calculator/domain/models/convertion_model.dart';

class Convertion {
  final ConvertionData _data;

  Convertion() : _data = ConvertionData();

  ConvertionData get data => _data;

  void convertDecimal(int number) {
    _data.updateDecimal(number);
  }

  void convertBinary(int number) {
    _data.updateBinary(number);
  }

  void reset() {
    _data.reset();
  }
}
