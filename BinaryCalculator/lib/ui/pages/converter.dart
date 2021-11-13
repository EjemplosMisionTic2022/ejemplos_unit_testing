import 'package:flutter/material.dart';
import '../widgets/bin2dec.dart';
import '../widgets/dec2bin.dart';

class Converter extends StatefulWidget {
  const Converter({Key? key}) : super(key: key);

  @override
  _ConverterState createState() => _ConverterState();
}

class _ConverterState extends State<Converter> {
  String _buttonText = "Binary -> Decimal";
  int _widgetID = 0;
  Widget _widget = const Bin2Dec();

  void _swapWidget() {
    setState(() {
      switch (_widgetID) {
        case 0:
          _buttonText = "Decimal -> Binary";
          _widgetID = 1;
          _widget = const Dec2Bin();
          break;
        case 1:
          _buttonText = "Binary -> Decimal";
          _widgetID = 0;
          _widget = const Bin2Dec();
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(12.0),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xffffffff),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0.00, 3.00),
                    color: const Color(0xff000000).withOpacity(0.16),
                    blurRadius: 6,
                  ),
                ],
                borderRadius: BorderRadius.circular(4.00),
              ),
              child: MaterialButton(
                  key: const Key("switch"),
                  child: Text(_buttonText),
                  onPressed: () {
                    _swapWidget();
                  }),
            ),
          ),
          Expanded(child: _widget),
        ]);
  }
}
