import 'package:currency_converter/screens/intro.screen.dart';
import 'package:currency_converter/services/rates.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:splashscreen/splashscreen.dart';
import 'home.screen.dart';
import 'intro.screen.dart';
import 'package:currency_converter/constants.dart';
import 'package:localstorage/localstorage.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  final LocalStorage cache = new LocalStorage('cache');
  bool introComplete = false;

  getRates() async {
    await Rates.getRates();
  }

  Future checkIntroSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    introComplete = (prefs.getBool('seenIntro') ?? false);

    if (!introComplete) {
      prefs.setBool('seenIntro', true);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Intros()));
    } else {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
    }
  }

  @override
  void deactivate() {
    getRates();
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    checkIntroSeen();

    return SafeArea(
      child: SplashScreen(
        seconds: 14,
        title: new Text(
          'Currency Converter',
          style: kTopCurrencyTextStyle,
        ),
        image: new Image.asset('assets/images/intro_img_1.png'),
        backgroundColor: kRed,
        styleTextUnderTheLoader: new TextStyle(),
        photoSize: 100.0,
        loaderColor: kWhite,
      ),
    );
  }
}
