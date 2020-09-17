import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:health/calculater_brain.dart';
import 'package:health/resultpage.dart';
import 'constants.dart';
import 'resusablecard.dart';

import 'iconcontent.dart';
import 'roundiconbuttton.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  int height = 140;
  int weight = 50;
  int age = 20;
  Gender selectedgender;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Be",
                style: TextStyle(
                    color: bottomcontainercolor,
                    fontWeight: FontWeight.bold,
                    fontSize: 24),
              ),
              Text(
                " the Diet",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              )
            ],
          ),
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: Resusablecard(
                  onpress: () {
                    setState(() {
                      selectedgender = Gender.male;
                    });
                  },
                  colour: selectedgender == Gender.male
                      ? cardcolour
                      : inactivecardcolour,
                  childcard: IconContent(
                    icon: FontAwesomeIcons.mars,
                    label: 'MALE',
                  ),
                )),
                Expanded(
                  child: Resusablecard(
                      onpress: () {
                        setState(() {
                          selectedgender = Gender.female;
                        });
                      },
                      colour: selectedgender == Gender.female
                          ? cardcolour
                          : inactivecardcolour,
                      childcard: IconContent(
                          icon: FontAwesomeIcons.venus, label: 'FEMALE')),
                ),
              ],
            ),
          ),
          Expanded(
            child: Resusablecard(
              colour: cardcolour,
              childcard: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: TextStyle(
                            fontSize: 40.0, fontWeight: FontWeight.w900),
                      ),
                      Text('CM'),
                    ],
                  ),
                  Slider(
                      value: height.toDouble(),
                      min: 120,
                      max: 400,
                      activeColor: Color(0xFFADFF2F),
                      inactiveColor: Color(0xFF8D8E98),
                      onChanged: (double newvalue) {
                        setState(() {
                          height = newvalue.round();
                        });
                      }),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: Resusablecard(
                  colour: cardcolour,
                  childcard: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'WEIGHT',
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                      Text(
                        weight.toString(),
                        style: TextStyle(
                            fontSize: 40.0, fontWeight: FontWeight.w500),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Roundiconbutton(
                            icon: FontAwesomeIcons.plus,
                            addmul: () {
                              setState(() {
                                weight++;
                              });
                            },
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Roundiconbutton(
                            icon: FontAwesomeIcons.minus,
                            addmul: () {
                              setState(() {
                                weight--;
                              });
                            },
                          )
                        ],
                      )
                    ],
                  ),
                )),
                Expanded(
                    child: Resusablecard(
                  colour: cardcolour,
                  childcard: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'AGE',
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                      Text(
                        age.toString(),
                        style: TextStyle(
                            fontSize: 40.0, fontWeight: FontWeight.w500),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Roundiconbutton(
                            icon: FontAwesomeIcons.plus,
                            addmul: () {
                              setState(() {
                                age++;
                              });
                            },
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Roundiconbutton(
                            icon: FontAwesomeIcons.minus,
                            addmul: () {
                              setState(() {
                                age--;
                              });
                            },
                          )
                        ],
                      )
                    ],
                  ),
                )),
              ],
            ),
          ),
          Bottombutton(
            ontap: () {
              Calculaterbrain calc =
                  Calculaterbrain(height: height, weight: weight);

              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Resultpage(
                            bmiresult: calc.calculatebmi(),
                            resulttext: calc.getresult(),
                            interpretation: calc.getinterpretation(),
                          )));
            },
            buttontitle: 'CALUCULATE',
          )
        ],
      ),
    );
  }
}

class Bottombutton extends StatelessWidget {
  final Function ontap;
  final String buttontitle;

  Bottombutton({this.ontap, this.buttontitle});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        child: Center(
          child: Text(
            buttontitle,
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
        color: bottomcontainercolor,
        margin: EdgeInsets.all(2),
        //  padding: EdgeInsets.only(bottom: 15.0),
        width: double.infinity,
        height: bottomcontainerheight,
      ),
    );
  }
}
