import 'package:flutter/material.dart';

class Hello extends StatefulWidget {
  const Hello({Key? key}) : super(key: key);

  @override
  _HelloState createState() => _HelloState();
}

class _HelloState extends State<Hello> {
  TextEditingController controller = TextEditingController();
  String _name = "";

  @override
  void initState() {
    setState(() {
      _name = 'N/A';
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  _setName(value) {
    setState(() {
      _name = value;
    });
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
                  controller.clear();
                })
          ],
        ),
        Text('Hello $_name', style: Theme.of(context).textTheme.headline4)
      ]),
    );
  }
}
