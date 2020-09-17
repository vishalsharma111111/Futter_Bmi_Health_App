import 'package:flutter/material.dart';

class Resusablecard extends StatelessWidget {
  final Color colour;
  final Widget childcard;
  final Function onpress;
  Resusablecard({@required this.colour, this.childcard, this.onpress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpress,
      child: Container(
        child: childcard,
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: colour, borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
