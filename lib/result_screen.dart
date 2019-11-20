import 'package:bmi_calculator/reusable_card.dart';
import 'package:flutter/material.dart';
import 'constants.dart';

class ResultScreen extends StatelessWidget {
  static final routeName = "/result_screen";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: FlatButton(
          padding: EdgeInsets.symmetric(vertical: 14),
          color: Color(0xFFEB1555),
          onPressed: () {},
          child: Text(
            "RECALCULATE",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
        body: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
                  "Your Result",
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.w600),

            ),
            Expanded(
              child: Padding(padding: EdgeInsets.only(bottom: 15,top: 25),
                child: ReusableCard(
                  color: kCardActiveColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                       ReusableCard(color: kCardActiveColor)
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
