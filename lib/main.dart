import 'package:currency_converter_provider/lecture_provider/CVProvider.dart';
import 'package:currency_converter_provider/lecture_provider/currency_converter_home_page.dart';
import 'package:currency_converter_provider/personal_information.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CurrencyConverterPovider>(
      create: (context) => CurrencyConverterPovider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        home: HomePage(),
      ),
    );
  }
}
