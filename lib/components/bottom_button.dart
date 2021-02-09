import 'package:flutter/material.dart';

import '../constants.dart';

class BottomButton extends StatelessWidget {
  final String buttonText;
  final Function onTap;
  BottomButton({
    @required this.buttonText,
    @required this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        color: kBottomContainerColor,
        width: double.infinity,
        height: kBottomContainerHeight,
        child: Text(
          buttonText,
          style: kLargeButtonTextStyle,
        ),
      ),
    );
  }
}
