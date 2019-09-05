import 'package:flutter/material.dart';
import 'package:currency_converter/constants.dart';

class Keypad extends StatelessWidget {
  Keypad(
      {@required this.onPressed,
      @required this.onSubmit,
      @required this.fromTop});

  final bool fromTop;
  final Function onPressed;
  final Function onSubmit;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            PadKey(
              fromTop: fromTop,
              child: Text('1',
                  style:
                      fromTop ? kBloodyKeypadTextStyle : kPureKeypadTextStyle),
              onPressed: () => onPressed('1'),
            ),
            PadKey(
              fromTop: fromTop,
              child: Text('2',
                  style:
                      fromTop ? kBloodyKeypadTextStyle : kPureKeypadTextStyle),
              onPressed: () => onPressed('2'),
            ),
            PadKey(
              fromTop: fromTop,
              child: Text('3',
                  style:
                      fromTop ? kBloodyKeypadTextStyle : kPureKeypadTextStyle),
              onPressed: () => onPressed('3'),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            PadKey(
              fromTop: fromTop,
              child: Text('4',
                  style:
                      fromTop ? kBloodyKeypadTextStyle : kPureKeypadTextStyle),
              onPressed: () => onPressed('4'),
            ),
            PadKey(
              fromTop: fromTop,
              child: Text('5',
                  style:
                      fromTop ? kBloodyKeypadTextStyle : kPureKeypadTextStyle),
              onPressed: () => onPressed('5'),
            ),
            PadKey(
              fromTop: fromTop,
              child: Text('6',
                  style:
                      fromTop ? kBloodyKeypadTextStyle : kPureKeypadTextStyle),
              onPressed: () => onPressed('6'),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            PadKey(
              fromTop: fromTop,
              child: Text('7',
                  style:
                      fromTop ? kBloodyKeypadTextStyle : kPureKeypadTextStyle),
              onPressed: () => onPressed('7'),
            ),
            PadKey(
              fromTop: fromTop,
              child: Text('8',
                  style:
                      fromTop ? kBloodyKeypadTextStyle : kPureKeypadTextStyle),
              onPressed: () => onPressed('8'),
            ),
            PadKey(
              fromTop: fromTop,
              child: Text('9',
                  style:
                      fromTop ? kBloodyKeypadTextStyle : kPureKeypadTextStyle),
              onPressed: () => onPressed('9'),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            PadKey(
              fromTop: fromTop,
              child: Text('.',
                  style:
                      fromTop ? kBloodyKeypadTextStyle : kPureKeypadTextStyle),
              onPressed: () => onPressed('.'),
            ),
            PadKey(
              fromTop: fromTop,
              child: Text('0',
                  style:
                      fromTop ? kBloodyKeypadTextStyle : kPureKeypadTextStyle),
              onPressed: () => onPressed('0'),
            ),
            PadKey(
              fromTop: fromTop,
              child: IconTheme(
                data: IconThemeData(color: fromTop ? kWhite : kRed),
                child: Icon(
                  Icons.check,
                ),
              ),
              onPressed: () => onSubmit(),
            ),
          ],
        ),
      ],
    );
  }
}

class PadKey extends StatelessWidget {
  PadKey(
      {@required this.child, @required this.onPressed, @required this.fromTop});

  final Widget child;
  final bool fromTop;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      shape: CircleBorder(),
      fillColor: fromTop ? kRedAccent : kRedAccentLight,
      elevation: 0.0,
      padding: EdgeInsets.all(15.0),
      splashColor: kRed,
      highlightColor: kRed,
      child: child,
      onPressed: onPressed,
    );
  }
}
