import 'package:flutter/material.dart';
import '../constants.dart';

class CardChildContent extends StatelessWidget {
  const CardChildContent({
    this.fontAwesomeIcon,
    this.childText,
  });

  final IconData fontAwesomeIcon;
  final String childText;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          fontAwesomeIcon,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          childText,
          style: kLabelTextStyle,
        ),
      ],
    );
  }
}
