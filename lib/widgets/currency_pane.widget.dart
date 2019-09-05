import 'package:currency_converter/screens/currencies.screen.dart';
import 'package:flutter/material.dart';
import 'package:currency_converter/constants.dart';
import 'package:currency_converter/models/currency.model.dart';

class CurrencyPane extends StatelessWidget {
  CurrencyPane(
      {@required this.position,
      @required this.currency,
      @required this.amount,
      @required this.onTap,
       this.onSelectCurrency});

  final Position position;
  final Currency currency;
  final double amount;
  final Function onTap;
  final Function onSelectCurrency;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: position == Position.top ? kRed : kWhite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(_createCurrencyRoute(position == Position.top ? true : false)).then(
                  (value) {
                    if (value != null) {
                      onSelectCurrency(value);
                    }
                  }
                );
              },
              child: position == Position.top
                  ? Text(
                      currency.name,
                      style: kTopCurrencyTextStyle,
                      textAlign: TextAlign.center,
                    )
                  : Text(
                      currency.code,
                      style: kAbbreviatedCurrencyTextStyle,
                    ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: <Widget>[
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    amount.toStringAsFixed(2),
                    style: position == Position.top
                        ? kTopAmountText.copyWith(
                            fontSize: amount.toStringAsFixed(2).length >= 7
                                ? 45.0
                                : 75.0)
                        : kBottomAmountText.copyWith(
                            fontSize: amount.toStringAsFixed(2).length >= 7
                                ? 45.0
                                : 75.0),
                  ),
                ),
                Text(
                  currency.symbol,
                  style: kSymbolTextStyle,
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(_createCurrencyRoute(position == Position.top ? true : false)).then(
                  (value) {
                    if (value != null) {
                      onSelectCurrency(value);
                    }
                  }
                );
              },
              child: position == Position.top
                  ? Text(
                      currency.code,
                      style: kAbbreviatedCurrencyTextStyle,
                    )
                  : Text(
                      currency.name,
                      style: kBottomCurrencyTextStyle,
                      textAlign: TextAlign.center,
                    ),
            )
          ],
        ),
      ),
    );
  }
}

Route _createCurrencyRoute(bool fromTop) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => CurrencyList(
      fromTop: fromTop,
    ),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      // var begin = Offset(0.0, -1.0); // This makes a transition from the top
      var begin = Offset(1.0, 0.0);
      var end = Offset.zero;
      var curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
