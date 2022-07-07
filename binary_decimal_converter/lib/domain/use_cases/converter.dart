class Converter {
  
  static String adjustValue(String oldValue, int newDigit) {
    String newValue;
    if (oldValue == "0") {
      newValue = "$newDigit";
    } else {
      newValue = oldValue + "$newDigit";
    }
    return newValue;
  }

  static String bin2dec(String binary) {
    return int.parse(binary, radix: 2).toRadixString(10);
  }

  static String dec2bin(String decimal) {
    return int.parse(decimal, radix: 10).toRadixString(2);
  }
}
