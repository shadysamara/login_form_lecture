import 'package:currency_converter_provider/lecture_provider/CVProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Provider.of<CurrencyConverterPovider>(context).fromCurrency = 'hello';
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
          title: Text(
              Provider.of<CurrencyConverterPovider>(context).fromCurrency)),
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: FromCurrencyPicker(),
                  ),
                  Expanded(
                    child: TextFieldValue(),
                  ),
                  Expanded(
                    child: ToCurrencyPicker(),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Result(),
            )
          ],
        ),
      ),
    );
  }
}

class FromCurrencyPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CurrencyConverterPovider currencyConverterPovider =
        Provider.of<CurrencyConverterPovider>(context);
    return Container(
        child: CupertinoPicker(
      itemExtent: 30,
      magnification: 1.3,
      onSelectedItemChanged: (int x) {
        currencyConverterPovider.setFromCurrency(currencyMap.keys.toList()[x]);
      },
      children: currencyMap.keys.map((e) => Text(e)).toList(),
    ));
  }
}

class ToCurrencyPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CurrencyConverterPovider currencyConverterPovider =
        Provider.of<CurrencyConverterPovider>(context);
    // TODO: implement build
    return Container(
        child: CupertinoPicker(
      itemExtent: 30,
      magnification: 1.3,
      onSelectedItemChanged: (int x) {
        currencyConverterPovider.setToCurrency(currencyMap.keys.toList()[x]);
      },
      children: currencyMap.keys.map((e) => Text(e)).toList(),
    ));
  }
}

class TextFieldValue extends StatelessWidget {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    CurrencyConverterPovider currencyConverterPovider =
        Provider.of<CurrencyConverterPovider>(context);
    // TODO: implement build
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
      onChanged: (value) => currencyConverterPovider.setValue(value),
    );
  }
}

class Result extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CurrencyConverterPovider currencyConverterPovider =
        Provider.of<CurrencyConverterPovider>(context);
    // TODO: implement build
    return Container(
      child: Center(
        child: Text(
          currencyConverterPovider.result,
          style: TextStyle(fontSize: 50),
        ),
      ),
    );
  }
}
