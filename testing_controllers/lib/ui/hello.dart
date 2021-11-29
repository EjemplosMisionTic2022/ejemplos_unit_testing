import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testing_controllers/ui/controllers/name_controller.dart';

class Hello extends StatefulWidget {
  const Hello({Key? key}) : super(key: key);

  @override
  _HelloState createState() => _HelloState();
}

class _HelloState extends State<Hello> {
  TextEditingController controller = TextEditingController();
  NameController nameController = Get.find();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  _setName(value) {
    nameController.setName(value);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Text('Testing demo', style: Theme.of(context).textTheme.headline4),
        Row(
          children: [
            Flexible(
              child: TextField(
                key: const Key('TextFieldName'),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Your name',
                ),
                controller: controller,
              ),
            ),
            TextButton(
                key: const Key('ButtonSetName'),
                child: const Text('Set name'),
                onPressed: () {
                  _setName(controller.text);
                })
          ],
        ),
        Obx(() => Text('Hello ${nameController.name}',
            style: Theme.of(context).textTheme.headline4))
      ]),
    );
  }
}
