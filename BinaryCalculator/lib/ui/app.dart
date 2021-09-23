import 'package:binary_calculator/ui/pages/converter.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MisiónTIC 2022',
      theme: ThemeData(
        colorScheme: const ColorScheme.light(
          primary: Color(0xff4264b4),
          secondary: Color(0xff1d2448),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('MisiónTIC 2022 - Móvil'),
        ),
        body: const Center(
          child: Converter(),
        ),
      ),
    );
  }
}
