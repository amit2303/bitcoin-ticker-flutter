import 'package:flutter/material.dart';
import 'price_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
          primaryColor: const Color.fromARGB(255, 10, 55, 76),
          scaffoldBackgroundColor: Colors.white),
      home: PriceScreen(),
    );
  }
}
