
import 'package:flutter/cupertino.dart';

import '../utils/dimensions.dart';

class BigText extends StatelessWidget {
  final String text;
  final Color? color;
  double size;
 final FontWeight? fontWeight ;
//  TextOverflow overflow;
  BigText({
    super.key,
    required this.text,
    this.color,
  //  this.overflow= TextOverflow.ellipsis,
    this.size=0,
    this.fontWeight
  });
  @override
  Widget build(BuildContext context) {
    return  Text(text,
      maxLines: 1,
     // overflow: overflow,
      style:TextStyle(
        color: color,
        fontFamily: 'Urbanist',
        fontWeight: fontWeight,
        fontSize: size==0?Dimensions.font20:size,
      ) ,
    );
  }
}
