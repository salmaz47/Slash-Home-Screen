import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:internship_task/utils/colors.dart';
import 'package:internship_task/widgets/small_text.dart';

import '../utils/dimensions.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final String image;
  final VoidCallback onTap;

   CategoryItem({
    Key? key,
    required this.title,
    required this.image,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child:  Padding(
        padding:  EdgeInsets.only(right: Dimensions.Height10),
        child: Column(
          children: [
            // category icon
            Container(
                width: Dimensions.width35*2,
                height: Dimensions.width35*2,
                padding: EdgeInsets.all(Dimensions.width8),
                decoration: BoxDecoration(
                    color: AppColors.mainColor,
                    borderRadius: BorderRadius.circular(145)
                ),
                child: Center(
                  child: SvgPicture.asset(
                    image,
                    width: Dimensions.Height30,
                    height: Dimensions.Height30,
                  ) ,
                )

            ),
            // category text
            SizedBox(height: Dimensions.Height4*2,),
            SmallText(
              text: title,
              fontWeight: FontWeight.w900,
              color: AppColors.mainColor,
              maxLine: 1,
            )
          ],
        ),
      )
    );
  }

}