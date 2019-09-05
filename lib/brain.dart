import 'package:currency_converter/services/rates.dart';
import 'package:currency_converter/models/currency.model.dart';

class Brain {
  convert(double amount, Currency from, Currency to) {
    if (from.code == 'USD') {
      double toRate = Rates.rates['USD' + to.code];
      return toRate * amount;
    } else if (to.code == 'USD') {
      double fromRate = Rates.rates['USD' + from.code];
      return amount / fromRate;
    } else {
      double toRate = Rates.rates['USD' + to.code];
      double fromRate = Rates.rates['USD' + from.code];
      return (toRate / fromRate) * amount;
    }
  }
}
