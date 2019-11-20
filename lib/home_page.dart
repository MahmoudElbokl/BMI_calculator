import 'package:bmi_calculator/result_screen.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:bmi_calculator/reusable_card.dart';
import 'package:bmi_calculator/card_content.dart';
import 'card_child_content.dart';

enum Gender { Male, Female , Else}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Gender gender ;
  int height = 170;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 10,
          title: Text("BMI Calculator"),
          centerTitle: true,
        ),
        bottomNavigationBar: FlatButton(
          padding: EdgeInsets.symmetric(vertical: 14),
          color: Color(0xFFEB1555),
          onPressed: () {
            Navigator.pushReplacementNamed(context, ResultScreen.routeName);
          },
          child: Text(
            "CALCULATE",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
                flex: 10,
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: ReusableCard(
                      color: gender == Gender.Male
                          ? kCardActiveColor
                          : kCardinActiveColor,
                      cardChild: CardContent(Icons.call_made, "MALE"),
                      onPress: () {
                        setState(() {
                          if (gender == Gender.Male){
                            gender = Gender.Else ;
                          }else {
                            gender =Gender.Male;
                          }
                        });
                      },
                    )),
                    Expanded(
                        child: ReusableCard(
                      color: gender == Gender.Female
                          ? kCardActiveColor
                          : kCardinActiveColor,
                      cardChild: CardContent(Icons.call_made, "FEMALE"),
                      onPress: () {
                        setState(() {
                          if (gender == Gender.Female ){
                            gender = Gender.Else;
                          }else
                          gender = Gender.Female;
                        });
                      },
                    )),
                  ],
                )),
            Expanded(
              flex: 8,
              child: ReusableCard(
                color: kCardActiveColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "HEIGHT",
                      style: kLabelTextStyle,
                    ),
                    Row(
                      textBaseline: TextBaseline.alphabetic,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "$height",
                          style: kNumberTextStyle,
                        ),
                        Text("cm"),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.white,
                        thumbColor: Color(0xFFEB1555),
                        overlayColor: Color(0x29EB1555),
                        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12),
                        overlayShape: RoundSliderOverlayShape(overlayRadius: 24),
                      ),
                      child: Slider(
                          value: height.toDouble(),
//                          activeColor: Colors.white, This activeColor is the activeTrackColor and ThumbColor
                          min: 100,
                          max: 240,
                          onChanged: (double newValue) {
                            setState(() {
                              height = newValue.round();
                            });
                          }),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
                flex: 10,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: ReusableCard(
                        color: kCardActiveColor,
                        cardChild: CardChildContent(label: "WEIGHT", value: weight,increase: (){
                          setState(() {
                            weight++ ;
                          });
                        },decrease: (){
                          setState(() {
                            weight-- ;
                          });
                        },),
                      ),
                    ),
                    Expanded(
                      child: ReusableCard(
                        color: kCardActiveColor,
                        cardChild: CardChildContent(label: "AGE", value: age,increase: (){
                          setState(() {
                            age++ ;
                          });
                        },decrease: (){
                          setState(() {
                            age-- ;
                          });
                        }),
                      ),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
