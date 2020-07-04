import 'package:currency_converter_provider/currency_converter_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CurrencyConverter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text('Currency Converter')),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(child: FromCurrencyPicker()),
                Expanded(child: TextFieldValue()),
                Expanded(child: ToCurrencyPicker()),
              ],
            ),
          ),
          Expanded(child: Result())
        ],
      ),
    );
  }
}

class FromCurrencyPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CVProvider cpProvider = Provider.of<CVProvider>(context, listen: false);
    // TODO: implement build
    return Container(
      child: CupertinoPicker(
          itemExtent: 30,
          magnification: 1.3,
          onSelectedItemChanged: (int x) =>
              cpProvider.setFromCurrency(currencyMap.keys.toList()[x]),
          children: currencyMap.keys.toList().map((e) => Text(e)).toList()),
    );
  }
}

class ToCurrencyPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CVProvider cpProvider = Provider.of<CVProvider>(context, listen: false);
    // TODO: implement build
    return Container(
      child: CupertinoPicker(
          itemExtent: 30,
          magnification: 1.3,
          onSelectedItemChanged: (int x) {
            Provider.of<CVProvider>(context, listen: false)
                .setToCurrency(currencyMap.keys.toList()[x]);
          },
          children: currencyMap.keys.toList().map((e) => Text(e)).toList()),
    );
  }
}

class TextFieldValue extends StatelessWidget {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    CVProvider cpProvider = Provider.of<CVProvider>(context, listen: false);
    // TODO: implement build
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
      onChanged: (value) => cpProvider.setValue(value),
    );
  }
}

class Result extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Consumer<CVProvider>(
      builder: (context, value, child) {
        if (value.result != null) {
          return Container(
              child: Center(
            child: Text(value.result),
          ));
        } else {
          return Container(
              child: Center(
            child: Text('0'),
          ));
        }
      },
    );
  }
}
