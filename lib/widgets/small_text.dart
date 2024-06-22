
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SmallText extends StatelessWidget {
  TextOverflow overFlow;
  final String text;
  final Color? color;
  final double size;
  final double height;
  final FontWeight? fontWeight;
  final int maxLine;
  SmallText({
    Key ? key,
    required this.text,
    this.size=16,
    this.height= 1.2,
    this.color =  Colors.black,
    this.fontWeight,
    this.overFlow =TextOverflow.ellipsis,
    this.maxLine = 1
  }) :super (key:key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLine,
      style: TextStyle(
          fontSize: size,
          color: color,
          fontWeight: FontWeight.w500,
          fontFamily: 'Urbanist',
          overflow: overFlow,
      ),
    );
  }
}
