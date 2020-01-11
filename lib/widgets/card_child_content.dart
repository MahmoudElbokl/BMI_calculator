import 'package:flutter/material.dart';

import '../constants.dart';

class CardChildContent extends StatelessWidget {
  final String label;
  final int value;
  final Function increase;
  final Function decrease;

  CardChildContent({this.label, this.value, this.increase, this.decrease});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          label,
          style: kLabelTextStyle,
        ),
        label != "WEIGHT"
            ? Text(
          "$value",
          style: kNumberTextStyle,
        )
            :
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          textBaseline: TextBaseline.alphabetic,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          children: <Widget>[
            Text(
              "$value",
              style: kNumberTextStyle,
            ),
            Text("Kg"),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              backgroundColor: Color(0xFF4C4F5E),
              child: InkWell(
                onTap: increase,
                child: Icon(
                  Icons.add,
                  size: 30,
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            CircleAvatar(
              backgroundColor: Color(0xFF4C4F5E),
              child: InkWell(
                onTap: decrease,
                child: Icon(
                  Icons.remove,
                  size: 30,
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
