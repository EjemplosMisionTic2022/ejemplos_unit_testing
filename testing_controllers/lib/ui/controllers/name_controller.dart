import 'package:get/get.dart';

class NameController extends GetxController {
  var _name = 'N/A'.obs;

  String get name => _name.value;

  setName(val) => _name.value = val;
}
