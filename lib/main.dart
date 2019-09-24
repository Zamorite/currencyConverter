import 'package:currency_converter/constants.dart';
import 'package:currency_converter/screens/splash.screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(CurrencyConverter());

class CurrencyConverter extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: kRed,
        accentColor: kRedAccentLight,
      ),
      title: 'Currency Converter',
      home: Splash(),
    );
  }
}
