import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyCustomText extends StatelessWidget {
  final String text;
  final FontWeight? fontWeight;
  final double fontSize;
  final IconData? icon;
  final MainAxisAlignment? mainAxisAlignment;

  const MyCustomText({
    super.key,
    required this.text,
    this.fontWeight,
    required this.fontSize,
    this.icon,
    this.mainAxisAlignment,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment != null ? mainAxisAlignment! : MainAxisAlignment.start,
      textDirection: TextDirection.rtl,
      children: [
        if(icon != null) ...{
          Icon(icon)
        },
        const SizedBox(width: 5,),
        Text(
          text,
          textDirection: TextDirection.rtl,
          style: TextStyle(
            color: Colors.black,
            fontWeight: fontWeight,
            fontFamily: 'cairo',
            fontSize: fontSize,
          ),
        ),
      ],
    );
  }
}
