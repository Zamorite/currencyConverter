import 'package:flutter/material.dart';
import 'input.screen.dart';
import 'package:currency_converter/brain.dart';
import 'package:currency_converter/constants.dart';
import 'package:currency_converter/services/bank.dart';
import 'package:currency_converter/models/currency.model.dart';
import 'package:currency_converter/widgets/fab_overlay_hack.widget.dart';
import 'package:currency_converter/widgets/currency_pane.widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double topAmount = 1;
  double bottomAmount = 449.04;

  IconData directionIcon = Icons.arrow_downward;

  var rates;
  final Brain brain = Brain();

  Currency topCurrency = Bank.getDefaultTopCurrency();
  Currency bottomCurrency = Bank.getDefaultBottomCurrency();

  Widget build(BuildContext context) {
    return Container(
      color: kRed,
      child: Scaffold(
        backgroundColor: kRed,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              CurrencyPane(
                position: Position.top,
                currency: topCurrency,
                amount: topAmount,
                onTap: () {
                  Navigator.of(context)
                      .push(
                    _createRoute(false, topAmount),
                  )
                      .then((value) {
                    if (value != null) {
                      setState(() {
                        topAmount = value;
                        directionIcon = Icons.arrow_downward;

                        bottomAmount = brain.convert(
                            topAmount, topCurrency, bottomCurrency);
                      });
                    }
                  });
                },
                onSelectCurrency: (currency) {
                  if (currency != null) {
                    setState(() {
                      topCurrency = currency;
                      directionIcon = Icons.arrow_downward;

                      bottomAmount =
                          brain.convert(topAmount, topCurrency, bottomCurrency);
                    });
                  }
                },
              ),
              FabOverlay(
                icon: directionIcon,
              ),
              CurrencyPane(
                position: Position.bottom,
                currency: bottomCurrency,
                amount: bottomAmount,
                onTap: () {
                  Navigator.of(context)
                      .push(
                    _createRoute(true, bottomAmount),
                  )
                      .then((value) {
                    if (value != null) {
                      setState(() {
                        bottomAmount = value;
                        directionIcon = Icons.arrow_upward;

                        topAmount = brain.convert(
                            bottomAmount, bottomCurrency, topCurrency);
                      });
                    }
                  });
                },
                onSelectCurrency: (currency) {
                  if (currency != null) {
                    setState(() {
                      bottomCurrency = currency;
                      directionIcon = Icons.arrow_upward;

                      topAmount = brain.convert(
                          bottomAmount, bottomCurrency, topCurrency);
                    });
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// body: Center(
//         child: RaisedButton(
//           child: Text('Go!'),
//           onPressed: () {
//             Navigator.of(context).push(_createRoute());
//           },
//         ),
//       ),

Route _createRoute(bool upwards, double amount) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => InputScreen(
      fromTop: !upwards,
      amount: amount.toString(),
    ),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      // var begin = Offset(0.0, -1.0); // This makes a transition from the top
      var begin = Offset(0.0, upwards ? 1.0 : -1.0);
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
