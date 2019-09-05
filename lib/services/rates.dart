import 'dart:convert';
import 'bank.dart';
import 'network_helper.dart';
import 'package:currency_converter/constants.dart';
import 'package:localstorage/localstorage.dart';

class Rates {
  static Map rates;

  static Future getRates() async {
    final LocalStorage cache = new LocalStorage('cache');

    var fromCache = await cache.getItem('rates');

    String url = 'http://apilayer.net/api/live?access_key=$kAccessKey&format=1';

    NetworkHelper postman = NetworkHelper(url);

    await postman.getData().then((value) {
      rates = value;
      cache.setItem('rates', rates);
    }).catchError((err) {
      print(
          '[!] Error: $err\n\n[!] Could not fetch rates from the internet. Checking out cache...');

      if (fromCache != null) {
        rates = fromCache;
        print('[i] - Found rates in cache...\n>> Fetching from cache...');
      } else {
        print('[i] - Rates not found in cache...\n>> Using stale data...');
        rates = jsonDecode(Bank.getStaleRates());
        cache.setItem('rates', rates);
      }
    });
  }
}
