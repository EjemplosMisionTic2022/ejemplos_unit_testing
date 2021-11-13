import 'package:binary_calculator/domain/use_cases/convertion.dart';
import 'package:flutter/material.dart';

class Bin2Dec extends StatefulWidget {
  const Bin2Dec({Key? key}) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<Bin2Dec> {
  late Convertion convertion;

  @override
  void initState() {
    super.initState();
    convertion = Convertion();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(8.0),
            alignment: Alignment.centerRight,
            child: Text(
              convertion.data.binary,
              textAlign: TextAlign.right,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.secondary,
                  fontSize: 35),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8.0),
            alignment: Alignment.centerRight,
            child: Text(
              convertion.data.decimal,
              textAlign: TextAlign.right,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.secondary,
                  fontSize: 35),
            ),
          ),
          Expanded(
            flex: 4,
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      key: const Key('1'),
                      padding: const EdgeInsets.all(8.0),
                      child: MaterialButton(
                        color: Theme.of(context).primaryColor,
                        child: const Text(
                          "1",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            convertion.convertBinary(1);
                          });
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      key: const Key('0'),
                      padding: const EdgeInsets.all(8.0),
                      child: MaterialButton(
                        color: Theme.of(context).primaryColor,
                        child: const Text(
                          "0",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            convertion.convertBinary(0);
                          });
                        },
                      ),
                    ),
                  ),
                ]),
          ),
          Expanded(
            flex: 1,
            child: Container(
              key: const Key('reset'),
              padding: const EdgeInsets.all(8.0),
              child: MaterialButton(
                color: Theme.of(context).colorScheme.secondary,
                onPressed: () {
                  setState(() {
                    convertion.reset();
                  });
                },
                child: const Text(
                  "Reset",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ]);
  }
}
