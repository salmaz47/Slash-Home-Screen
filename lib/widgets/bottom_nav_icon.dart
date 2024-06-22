

import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:internship_task/widgets/small_text.dart';
import '../utils/colors.dart';
import '../utils/dimensions.dart';

class BottomNavIcon extends StatefulWidget {
  final String tappedImage;
  final String untappedImage;
  final String text;
  const BottomNavIcon({
    super.key,
    required  this.text,
    required this.tappedImage,
     required this.untappedImage
  });

  @override
  State<BottomNavIcon> createState() => _BottomNavIconState();
}

class _BottomNavIconState extends State<BottomNavIcon> {
  bool tapped = false;
 //
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        setState(() {
          tapped =!tapped;
        });
      },
      child:  Container(
          width: Dimensions.screenWidth/4,
          child: Column(

            children: [
              AnimatedContainer(
                duration:Duration(milliseconds: 1500),
                curve: Curves.fastLinearToSlowEaseIn,
               // margin: EdgeInsets.only(right:Dimensions.width15, left: Dimensions.width15,),
                width: tapped? Dimensions.width10*10:0,
                height: tapped ?6: 0,

                decoration: BoxDecoration(
                    color: AppColors.mainColor,
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(tapped ? Dimensions.radius20 : Dimensions.radius20/2),
                    )
                ) ,
              ),
              SizedBox(height: Dimensions.Height10,),
              SvgPicture.asset(
                tapped ? widget.tappedImage: widget.untappedImage,
                width: Dimensions.Height30,
                height: Dimensions.Height30,
              ),
              SizedBox(height: Dimensions.Height5,),
              SmallText(text:widget.text  ,color: AppColors.mainColor,fontWeight: FontWeight.w900,),

            ],
          ),
        ),

    );
  }
}
