import 'package:booklyapp/core/utilies/styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton(
      {super.key, required this.backgroundColor, required this.textColor , required this.text , this.borderRadius , this.fontSize});

  Color backgroundColor;
  Color textColor;
  String text ;
  BorderRadius ? borderRadius ;
  double ? fontSize ;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
              backgroundColor:backgroundColor,
              shape: RoundedRectangleBorder(
                  borderRadius: borderRadius ?? BorderRadius.circular(16))),
          child: Text(
            text,
            style: Styles.textStyle16.copyWith(
              color: textColor,
              fontWeight: FontWeight.bold,
              fontSize: fontSize
            ),
          )),
    );
  }
}
