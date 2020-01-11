import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Color color ;
  final cardChild ;
  final Function onPress ;

  ReusableCard({@required this.color,this.cardChild, this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: const EdgeInsets.only(top: 15, left: 15, right: 10, bottom: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color:color,
        ),
        child: cardChild,
      ),
    );
  }
}
