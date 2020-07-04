import 'package:currency_converter_provider/currency_converter_provider.dart';
import 'package:currency_converter_provider/currency_home_page.dart';
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
    return ChangeNotifierProvider<CVProvider>(
      create: (BuildContext context) => CVProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        home: PersonalInfo(),
      ),
    );
  }
}
