

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:internship_task/pages/home_page_body.dart';
import 'package:internship_task/utils/colors.dart';
import 'package:internship_task/utils/dimensions.dart';
import 'package:internship_task/widgets/small_text.dart';
import 'package:internship_task/widgets/bottom_navigation_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';




class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  bool tapped = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            //header
            Padding(
              padding:  EdgeInsets.only(
                top: Dimensions.Height10*7 ,
                left: Dimensions.width10*3,
                right: Dimensions.width10*3,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //logo
                  Text(
                    'Slash.',
                    style: TextStyle(
                      fontFamily: 'Urbanist',
                      fontWeight: FontWeight.w700,
                      color: AppColors.mainColor,
                      fontSize: Dimensions.font26
                    ),
                  ),
                  //location
                  Row(
        
                    children: [
                      //location icon
                     Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: SvgPicture.asset(
                               'assets/images/location.svg',
                             width: Dimensions.iconSize24,
                             height: Dimensions.iconSize24,
                           ),
                     ),
        
                      //column -> location + city
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SmallText(text: 'Nasr City'),
                          Text(
                            'Cairo',
                            style: TextStyle(
                              color: AppColors.smallTextColor,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Urbanist',
                              fontSize: Dimensions.font16
                            ),
                          ),
        
                        ],
                      ),
                      //arrow icon
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.keyboard_arrow_down_outlined),
                      )
                    ],
                  ),
        
                  //notification
                  Stack(
                    alignment: Alignment.topRight,
                    children: [
                      SvgPicture.asset(
                        'assets/images/account_notification.svg',
                        width: Dimensions.width10*3,
                        height: Dimensions.Height10*3,
        
                      ),
                      CircleAvatar(
                        radius: 8.0,
                        backgroundColor: Colors.white,
                      ),
                      CircleAvatar(
                        radius: 6.0,
                        backgroundColor: AppColors.notifiColor,
                      ),
                    ],
                  )
                ],
              ),
            ),
            // search and slider section
            Padding(
              padding: EdgeInsets.only(
                top: Dimensions.Height20,
                bottom: Dimensions.Height20 ,
                left: Dimensions.width10*2,
                right: Dimensions.width10*2,
              ),
              child: Row(
                children: [
                  //search bar
                  Container(
                    padding: EdgeInsets.only(
                      left: Dimensions.width10*2,
                      right: Dimensions.width10*2,
                      top: Dimensions.Height30/2,
                      bottom: Dimensions.Height30/2
        
                    ),
                    width: Dimensions.width300,
                    //height:Dimensions.Height45 ,
                    decoration: BoxDecoration(
                      color: AppColors.searchBarColor,
                      borderRadius: BorderRadius.circular(Dimensions.radius15/2)
        
                    ),
                    child: Row(
                      children: [
                        //search icon
                        SvgPicture.asset(
                          'assets/images/search.svg',
                          width:Dimensions.Height25,
                          height: Dimensions.Height25,
        
                        ),
                        SizedBox(width: Dimensions.width10,),
                        //placeholder text
                        SmallText(text: 'Search here..',color: AppColors.placeHolderColor,)
                      ],
                    ),
                  ),
                  SizedBox(width: Dimensions.width10,),
                  //icon
                  Container(
                    padding: EdgeInsets.only(
                        left: Dimensions.width10,
                        right: Dimensions.width10,
                        top: Dimensions.Height10,
                        bottom: Dimensions.Height10
        
                          ),
                   width: Dimensions.width50,
                    height: Dimensions.Height50+Dimensions.Height5,
                    decoration: BoxDecoration(
                        color: AppColors.searchBarColor,
                        borderRadius: BorderRadius.circular(Dimensions.radius15/2)
                    ),
                    child:SvgPicture.asset(
                      'assets/images/sliders.svg',
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: Dimensions.Height5,),
            HomePageBody(),
        
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBarWidget(),
    );
  }

}


