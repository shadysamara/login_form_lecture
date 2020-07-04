import 'package:flutter/Material.dart';

class CVProvider extends ChangeNotifier {
  String fromCurrencyString = 'usd';

  String toCurrencyString = 'usd';
  double value = 1;
  String result = '1';
  setFromCurrency(String x) {
    this.fromCurrencyString = x;
    print(x);
    calculateResult();
  }

  setToCurrency(String x) {
    this.toCurrencyString = x;
    calculateResult();
  }

  setValue(String x) {
    this.value = double.parse(x);
    // print(this.value.toString());
    calculateResult();
  }

  calculateResult() {
    result =
        '${currencyMap[fromCurrencyString] / currencyMap[toCurrencyString] * value}';
    notifyListeners();
  }
}

const Map<String, double> currencyMap = {'usd': 3.5, 'nis': 1, 'jd': 5.1};
