
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:internship_task/utils/colors.dart';
import 'package:internship_task/widgets/big_text.dart';
import 'package:internship_task/widgets/small_text.dart';

import '../utils/dimensions.dart';

class CardWidget extends StatefulWidget {
  final String backhroundImage;
  final String brandImage;
  final String text;
  final String price;
  const CardWidget({
    super.key,
    required this.text,
    required this.price,
    required this.backhroundImage,
    required this.brandImage,
  });

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  bool tapped = false;
  bool add = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:EdgeInsets.only(
        top:Dimensions.Height30,
        right: Dimensions.width15
      ),
      child: Container(
        width: Dimensions.width10*15,

        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // stack  have image and fav icon
          Container(
          width: Dimensions.Height10*15,
          height: Dimensions.Height10*13,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
              image: AssetImage(widget.backhroundImage),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                top: 8,
                right: 8,
                child: GestureDetector(
                  onTap: (){
                    setState(() {
                      tapped=!tapped;
                    });
                  },
                  child: Container(
                    width: Dimensions.width35,
                    height: Dimensions.width35,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.searchBarColor,
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                         tapped? 'assets/images/icons/redfav.svg':'assets/images/icons/untappedfav.svg',
                        width: Dimensions.Height20,
                          height: Dimensions.Height20,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          ),
            // container in column and then row
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               SmallText(text: widget.text,size: Dimensions.font20-3,fontWeight: FontWeight.w400,),
               SizedBox(height: 3,),
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   BigText(text: widget.price ,fontWeight: FontWeight.w700,size: Dimensions.font20,),
                   Row(
                     children: [
                       //brandd
                       Container(
                         width: Dimensions.Height30,
                         height:Dimensions.Height30,
                         decoration: BoxDecoration(
                           shape: BoxShape.circle, // Border properties
                           image: DecorationImage(
                             image: AssetImage(widget.brandImage), // Replace with your image path
                             fit: BoxFit.fitWidth,
                           ),
                         ),
                       ),
                       SizedBox(width: 4,),
                       GestureDetector(
                         onTap: (){
                           setState(() {
                             add=!add;
                           });
                         },
                         child: Container(
                           width: Dimensions.Height25,
                           height: Dimensions.Height25,
                           decoration: BoxDecoration(
                             shape: BoxShape.circle,
                             color: AppColors.mainColor,
                           ),
                           child: Center(
                             child: SvgPicture.asset(
                               add? 'assets/images/icons/added.svg':'assets/images/icons/add.svg',
                               width: Dimensions.Height5*3,
                               height: Dimensions.Height5*3,
                             ),
                           ),
                         ),
                       )

                     ],
                   ),

                 ],
               )
              ],
            ),
          ],
        ),
      ),
    );

  }
}
