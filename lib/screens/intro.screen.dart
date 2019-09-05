import 'package:flutter/material.dart';
import 'home.screen.dart';
import 'package:intro_views_flutter/Models/page_view_model.dart';
import 'package:intro_views_flutter/intro_views_flutter.dart';
import 'package:currency_converter/constants.dart';
import 'package:localstorage/localstorage.dart';

class Intros extends StatefulWidget {
  @override
  _IntrosState createState() => _IntrosState();
}

class _IntrosState extends State<Intros> {
  final LocalStorage cache = new LocalStorage('cache');
  final pages = [
    PageViewModel(
        pageColor: kRed,
        // iconImageAssetPath: 'assets/air-hostess.png',
        bubble: Image.asset('assets/images/intro_img_1.png'),
        body: Text(
          'Made for Exhibition during Aptech Career Quest',
          style: kAbbreviatedCurrencyTextStyle,
        ),
        title: Text(
          'For Aptech',
          style: kTopCurrencyTextStyle,
        ),
        mainImage: Image.asset(
          'assets/images/intro_img_1.png',
          height: 285.0,
          width: 285.0,
          alignment: Alignment.center,
        )),
    PageViewModel(
      pageColor: kRedAccent,
      bubble: Image.asset('assets/images/intro_img_2.png'),
      body: Text(
        'Easy conversion - Don\'t stress yourself with currency conversion',
        style: kAbbreviatedCurrencyTextStyle,
      ),
      title: Text(
        'Stress Free!',
        style: kTopCurrencyTextStyle,
      ),
      mainImage: Image.asset(
        'assets/images/intro_img_2.png',
        height: 285.0,
        width: 285.0,
        alignment: Alignment.center,
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Builder(
        builder: (context) => IntroViewsFlutter(
          pages,
          onTapDoneButton: () {
            cache.setItem('introComplete', true).then((value) {
              print(
                  '\n======================================================\n');
              print('[i] introComplete >> ' +
                  cache.getItem('introComplete').toString());
              print(
                  '======================================================\n\n');
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeScreen(),
                ), //MaterialPageRoute
              );
            });
          },
          pageButtonTextStyles: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
          ),
        ), //IntroViewsFlutter
      ),
    ); //Builder
  }
}
