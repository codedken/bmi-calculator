import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../constants.dart';
import '../components/icon_content.dart';
import '../components/reusable_card.dart';
import '../components/round_icon_button.dart';
import './results_page.dart';
import '../components/bottom_button.dart';
import '../calculator_brain.dart';

enum Gender {
  Male,
  Female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender _selectedGender;
  var _height = 180;
  var _weight = 50;
  var _age = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        centerTitle: true,
        leading: Icon(Icons.sort),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableContainer(
                    onPress: () {
                      setState(() {
                        _selectedGender = Gender.Male;
                      });
                    },
                    colour: _selectedGender == Gender.Male
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: CardChildContent(
                      fontAwesomeIcon: FontAwesomeIcons.mars,
                      childText: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableContainer(
                    onPress: () {
                      setState(() {
                        _selectedGender = Gender.Female;
                      });
                    },
                    colour: _selectedGender == Gender.Female
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: CardChildContent(
                      fontAwesomeIcon: FontAwesomeIcons.venus,
                      childText: 'FEMALE',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableContainer(
              colour: kInactiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        _height.toString(),
                        style: kNumberTextStyle,
                      ),
                      Text(
                        'cm',
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Color(0xFF8D8E98),
                      overlayColor: Color(0x1fEB1555),
                      thumbColor: kBottomContainerColor,
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(
                      min: 120.0,
                      max: 220.0,
                      value: _height.toDouble(),
                      onChanged: (double value) {
                        setState(() {
                          _height = value.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableContainer(
                    colour: kInactiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('WEIGHT', style: kLabelTextStyle),
                        Text('$_weight', style: kNumberTextStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              function: () {
                                setState(() {
                                  if (_weight == 0) {
                                    return;
                                  }
                                  _weight--;
                                });
                              },
                            ),
                            SizedBox(width: 10.0),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              function: () {
                                setState(() {
                                  _weight++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableContainer(
                    colour: kInactiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('AGE', style: kLabelTextStyle),
                        Text('$_age', style: kNumberTextStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              function: () {
                                setState(() {
                                  if (_age == 1) {
                                    return;
                                  }
                                  _age--;
                                });
                              },
                            ),
                            SizedBox(width: 10.0),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              function: () {
                                setState(() {
                                  _age++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            onTap: () {
              CalculatorBrain bmi = CalculatorBrain(
                height: _height,
                weight: _weight,
              );
              bmi.calculateBMI();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultsPage(
                    result: bmi.calculateBMI(),
                    resultText: bmi.getResult(),
                    interpretation: bmi.getInterpretation(),
                  ),
                ),
              );
            },
            buttonText: 'CALCULATE YOUR BMI',
          ),
        ],
      ),
    );
  }
}
