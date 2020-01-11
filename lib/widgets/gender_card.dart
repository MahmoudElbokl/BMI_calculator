import 'package:flutter/material.dart';

import '../constants.dart';

class GenderCardBody extends StatelessWidget {
  final String image;
  final String label ;

  GenderCardBody(this.image, this.label);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Image(image: AssetImage(image),
          height: 50,
          width: 50,
          color: Colors.white,),
        SizedBox(height: 10,),
        Text(label,textAlign: TextAlign.center,style:kLabelTextStyle,),
      ],
    );
  }
}
