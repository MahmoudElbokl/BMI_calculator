import 'package:flutter/material.dart';
import 'constants.dart';
class CardContent extends StatelessWidget {
  final IconData icon ;
  final String label ;

  CardContent(this.icon, this.label);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Icon(icon,size: 50,),
        Text(label,textAlign: TextAlign.center,style:kLabelTextStyle,),
      ],
    );
  }
}
