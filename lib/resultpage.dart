import 'package:flutter/material.dart';
import 'package:health/resusablecard.dart';

import 'constants.dart';
import 'inputpage.dart';

class Resultpage extends StatelessWidget {
  final bmiresult;
  final resulttext;
  final interpretation;
  Resultpage(
      {@required this.bmiresult,
      @required this.resulttext,
      @required this.interpretation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Health'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Container(
            padding: EdgeInsets.all(15),
            child: Text(
              'YOUR RESULT',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.w500),
            ),
          )),
          Expanded(
              flex: 4,
              child: Resusablecard(
                colour: cardcolour,
                childcard: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      bmiresult,
                      style: resultextstyle,
                    ),
                    Text(
                      resulttext,
                      style: bmitextstyle,
                    ),
                    Text(
                      interpretation,
                      style: bodytextstyle,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              )),
          Bottombutton(
            ontap: () {
              Navigator.pop(context);
            },
            buttontitle: 'RECALUCULATE',
          )
        ],
      ),
    );
  }
}
