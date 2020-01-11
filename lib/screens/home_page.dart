import 'package:flutter/material.dart';

import 'package:bmi_calculator/calculator.dart';
import 'package:bmi_calculator/screens/result_screen.dart';
import '../constants.dart';
import 'package:bmi_calculator/widgets/reusable_card.dart';
import 'package:bmi_calculator/widgets/gender_card.dart';
import '../widgets/card_child_content.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Gender gender;

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
          padding: const EdgeInsets.symmetric(vertical: 14),
          color: Color(0xFF4C4F5E),
          onPressed: () {
            CalculatorBrain calc =
                CalculatorBrain(height: height, weight: weight);
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => ResultScreen(
                  bmiResult: calc.calculateBMI(),
                  resultText: calc.getResult(),
                  interpretation: calc.getInterpretation(),
                ),
              ),
            );
          },
          child: Text(
            "CALCULATE",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            StatefulBuilder(builder: (context, setState) {
              return Expanded(
                  flex: 10,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                          child: ReusableCard(
                        color: gender == Gender.Male
                            ? kCardinActiveColor
                            : kCardUnActiveColor,
                        cardChild: GenderCardBody("images/male.png", "MALE"),
                        onPress: () {
                          setState(() {
                            if (gender == Gender.Male) {
                              gender = Gender.NotActive;
                            } else {
                              gender = Gender.Male;
                            }
                          });
                        },
                      )),
                      Expanded(
                          child: ReusableCard(
                        color: gender == Gender.Female
                            ? kCardinActiveColor
                            : kCardUnActiveColor,
                        cardChild:
                            GenderCardBody("images/female.png", "FEMALE"),
                        onPress: () {
                          setState(() {
                            if (gender == Gender.Female) {
                              gender = Gender.NotActive;
                            } else
                              gender = Gender.Female;
                          });
                        },
                      )),
                    ],
                  ));
            }),
            StatefulBuilder(builder: (context, setState) {
              return Expanded(
                flex: 8,
                child: ReusableCard(
                  color: kCardUnActiveColor,
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
                          thumbColor: Color(0xFF4C4F5E),
                          overlayColor: Color(0x29EB1555),
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 12),
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 24),
                        ),
                        child: Slider(
                            value: height.toDouble(),
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
              );
            }),
            StatefulBuilder(builder: (context, setState) {
              return Expanded(
                  flex: 10,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: ReusableCard(
                          color: kCardUnActiveColor,
                          cardChild: CardChildContent(
                            label: "WEIGHT",
                            value: weight,
                            increase: () {
                              setState(() {
                                weight++;
                              });
                            },
                            decrease: () {
                              setState(() {
                                weight--;
                              });
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        child: ReusableCard(
                          color: kCardUnActiveColor,
                          cardChild: CardChildContent(
                              label: "AGE",
                              value: age,
                              increase: () {
                                setState(() {
                                  age++;
                                });
                              },
                              decrease: () {
                                setState(() {
                                  age--;
                                });
                              }),
                        ),
                      ),
                    ],
                  ));
            }),
          ],
        ),
      ),
    );
  }
}
