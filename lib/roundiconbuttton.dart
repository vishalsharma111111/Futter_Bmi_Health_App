import 'package:flutter/material.dart';

class Roundiconbutton extends StatelessWidget {
  final IconData icon;
  final Function addmul;
  Roundiconbutton({this.icon, this.addmul});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: addmul,
      child: Icon(icon),
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(width: 45, height: 45),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      fillColor: Color(0XFF4C4F5E),
    );
  }
}
