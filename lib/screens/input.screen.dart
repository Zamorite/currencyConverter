import 'package:flutter/material.dart';
import 'package:currency_converter/widgets/keypad.widget.dart';
import 'package:currency_converter/constants.dart';

class InputScreen extends StatefulWidget {
  InputScreen({Key key, @required this.fromTop, this.amount}) : super(key: key);
  final bool fromTop;
  final String amount;

  @override
  _InputScreenState createState() =>
      _InputScreenState(fromTop: fromTop, amount: amount);
}

class _InputScreenState extends State<InputScreen> {
  _InputScreenState({@required this.amount, this.fromTop});

  String amount;
  bool fromTop;

  void concat(String input) {
    var segments = amount.split('.');

    if (segments.length == 1) {
      if (segments[0] == '0') {
        amount = input != '.' ? input : '0.';
      } else {
        amount += input;
      }
    } else {
      if (segments[1].length < 2) {
        amount += input != '.' ? input : '';
      }
    }
  }

  void del() {
    amount = '0';
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: fromTop ? kRed : kWhite,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    del();
                  });
                },
                child: Text(
                  'Tap to Delete',
                  style: kAbbreviatedCurrencyTextStyle,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 20.0),
              child: Text(
                double.parse(amount).toStringAsFixed(2),
                style: fromTop
                    ? kTopAmountText.copyWith(
                        fontSize: amount.length >= 7 ? 45.0 : 75.0)
                    : kTopAmountTextDark.copyWith(
                        fontSize: amount.length >= 7 ? 45.0 : 75.0),
                        textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: Container(
                child: Keypad(
                  fromTop: fromTop,
                  onPressed: (String key) {
                    setState(() {
                      concat(key);
                    });
                  },
                  onSubmit: () {
                    String exportStr = double.parse(amount).toStringAsFixed(2);
                    Navigator.pop(context, double.parse(exportStr));
                  },
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                print('Leaving page...');
                Navigator.pop(context);
              },
              child: Container(
                width: double.infinity,
                color: fromTop ? kRed : kWhite,
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: IconTheme(
                  data: IconThemeData(color: fromTop ? kWhite : kRed),
                  child: Icon(
                    fromTop
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
