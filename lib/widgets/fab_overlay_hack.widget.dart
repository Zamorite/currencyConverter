import 'package:flutter/material.dart';
import 'package:currency_converter/constants.dart';

class FabOverlay extends StatelessWidget {
  FabOverlay({@required this.icon});

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/currency_converter_hack.jpg'),
            fit: BoxFit.cover),
        // gradient: LinearGradient(
        //   colors: [kRed, kWhite],
        //   begin: Alignment.topCenter,
        //   end: Alignment.bottomCenter,
        // ),
      ),
      child: RawMaterialButton(
        shape: CircleBorder(
            side: BorderSide(
          color: kRed,
          width: 2.0,
        )),
        fillColor: kWhite,
        elevation: 0.0,
        // constraints: BoxConstraints.tightFor(
        //   width: 60,
        //   height: 60,
        // ),
        padding: EdgeInsets.all(20.0),
        splashColor: kRed,
        highlightColor: kRed,
        child: Icon(
          icon,
          color: kRed,
        ),
        onPressed: null,
      ),
    );
  }
}
