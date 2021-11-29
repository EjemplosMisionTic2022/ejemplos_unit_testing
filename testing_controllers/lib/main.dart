import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testing_controllers/ui/controllers/name_controller.dart';
import 'package:testing_controllers/ui/my_app.dart';

void main() {
  Get.put(NameController());
  runApp(const MyApp());
}
