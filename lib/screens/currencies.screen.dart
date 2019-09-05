import 'package:currency_converter/models/currency.model.dart';
import 'package:flutter/material.dart';
import 'package:currency_converter/services/bank.dart';

import '../constants.dart';

class CurrencyList extends StatefulWidget {
  CurrencyList({@required this.fromTop});

  final bool fromTop;

  @override
  _CurrencyListState createState() => _CurrencyListState();
}

class _CurrencyListState extends State<CurrencyList> {
  List<Currency> currencies = Bank.getCurrencies().values.toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.fromTop ? kRed : kWhite,
      body: buildList(context),
    );
  }

  buildList(BuildContext context) {
    return ListView.builder(
      itemCount: currencies.length,
      itemBuilder: (context, index) {
        return ListTileTheme(
          // selectedColor: kRedAccent,
          textColor: widget.fromTop ? kRedAccentLight : kRedAccent,
          child: GestureDetector(
            onTap: (){
              Navigator.pop(context, currencies[index]);
            },
            child: ListTile(
              title: Text(
                currencies[index].name,
                style: widget.fromTop ? kListTitleStyle : kListTitleStyleLight,
              ),
              trailing: Text(
                currencies[index].code,
                style: kListTrailStyle,
              ),
            ),
          ),
        );
      },
    );
  }
}
