

import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:internship_task/utils/colors.dart';
import 'package:internship_task/widgets/big_text.dart';
import 'package:internship_task/widgets/cart_widget.dart';
import 'package:internship_task/widgets/category_item.dart';
import 'package:internship_task/widgets/small_text.dart';
import 'package:internship_task/data/data.dart';


import '../utils/dimensions.dart';


class HomePageBody extends StatefulWidget {
  const HomePageBody({super.key});

  @override
  State<HomePageBody> createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {


  PageController pageController = PageController(viewportFraction: 0.9);
  var _currPageValue = 0.0;
  double _scaleFactor=0.9;
  double _height = Dimensions.Height170;
  @override
  void initState()
  {
    super.initState();
    pageController.addListener((){
      setState(() {
        _currPageValue = pageController.page!;
      });
    });
  }
  @override
  void dispose()
  {
    pageController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisSize: MainAxisSize.min,

                  children: [
                    //black friday
                    Container(
                      height:Dimensions.Height170,
                      child: PageView.builder(
                          controller: pageController,
                          itemCount: 2,
                          itemBuilder: (context,position)
                      {
                        return _buildPageItem(position);
                      }
                      ),
                    ),
                    SizedBox(
                  height: Dimensions.Height4*3,
                ),
                    //dots
                    new DotsIndicator(
                dotsCount: 2,
                position: _currPageValue.toInt(),
                decorator: DotsDecorator(
                  activeColor: AppColors.mainColor,
                  size: const Size.square(9.0),
                  activeSize: const Size(18.0, 9.0),
                  activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                  spacing: EdgeInsets.all(2)
                ),
                ),
                    // row=> categories and see all
                    Padding(
                      padding:EdgeInsets.only(
                        top:Dimensions.Height30,
                        left: Dimensions.width10*2,
                        right: Dimensions.width10*2,
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              BigText(
                                  text: 'Categories',
                                color: AppColors.mainColor ,
                                size: Dimensions.font26,
                                fontWeight: FontWeight.w600
                              ),
                              // see all + icon
                              Row(
                                children: [
                                  SmallText(text: 'See all',
                                  color: AppColors.mainColor,
                                    fontWeight: FontWeight.w600,
                                    size: 18,
                                  ),
                                  SizedBox(width: Dimensions.width10,),
                                  Container(
                                    padding: EdgeInsets.all(5),
                                   width: Dimensions.Height25,
                                      height: Dimensions.Height25,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      color: AppColors.containerColor
                                    ),
                                    child: SvgPicture.asset(
                                      'assets/images/icons/right.svg',
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                         SizedBox(height: Dimensions.Height20,),
                          //categories
                          Container(
                            height: Dimensions.Height10*Dimensions.Height10,
                            child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount:images.length ,
                                itemBuilder: (_, index)
                                {
                                  return CategoryItem(title: titles[index], image: images[index], onTap: (){});
                                }
                            ),
                          ),
                        ],
                      ),
                    ),
                    //best selling
                    Padding(
                      padding:EdgeInsets.only(
                        top:Dimensions.Height30,
                        left: Dimensions.width10*2,
                        right: Dimensions.width10*2,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          //Best Selling and see all
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              BigText(
                                  text: 'Best Selling',
                                  color: AppColors.mainColor ,
                                  size: Dimensions.font26,
                                  fontWeight: FontWeight.w600
                              ),
                              // see all + icon
                              Row(
                                children: [
                                  SmallText(text: 'See all',
                                    color: AppColors.mainColor,
                                    fontWeight: FontWeight.w600,
                                    size: 18,
                                  ),
                                  SizedBox(width: Dimensions.width10,),
                                  Container(
                                    padding: EdgeInsets.all(5),
                                    width: Dimensions.Height25,
                                    height: Dimensions.Height25,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        color: AppColors.containerColor
                                    ),
                                    child: SvgPicture.asset(
                                      'assets/images/icons/right.svg',
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          //
                          Container(
                            height: Dimensions.Height230,
                            child: ListView.builder(
                                itemCount: bestSellingImage.length,
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context,index)
                                {
                                  return CardWidget(
                                      text: bestSellingText[index],
                                      price: bestSellingPrice[index],
                                      backhroundImage: bestSellingImage[index],
                                      brandImage: bestSellingBrand[index]);
                                }
                            ),
                          ),
                        ],
                      ),
                    ),
                    //New Arrival
                    Padding(
                      padding:EdgeInsets.only(
                        top:Dimensions.Height30,
                        left: Dimensions.width10*2,
                        right: Dimensions.width10*2,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          //Best Selling and see all
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              BigText(
                                  text: 'New Arrival',
                                  color: AppColors.mainColor ,
                                  size: Dimensions.font26,
                                  fontWeight: FontWeight.w600
                              ),
                              // see all + icon
                              Row(
                                children: [
                                  SmallText(text: 'See all',
                                    color: AppColors.mainColor,
                                    fontWeight: FontWeight.w600,
                                    size: 18,
                                  ),
                                  SizedBox(width: Dimensions.width10,),
                                  Container(
                                    padding: EdgeInsets.all(5),
                                    width: Dimensions.Height25,
                                    height: Dimensions.Height25,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        color: AppColors.containerColor
                                    ),
                                    child: SvgPicture.asset(
                                      'assets/images/icons/right.svg',
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          //
                          Container(
                            height: Dimensions.Height230,
                            child: ListView.builder(
                                itemCount: bestSellingImage.length,
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context,index)
                                {
                                  return CardWidget(
                                      text: newArrivalText[index],
                                      price: newArrivalPrice[index],
                                      backhroundImage: newArrivalImage[index],
                                      brandImage: newArrivalBrand[index]);
                                }
                            ),
                          ),
                        ],
                      ),
                    ),
                    //recommended for you
                    Padding(
                      padding:EdgeInsets.only(
                        top:Dimensions.Height30,
                        left: Dimensions.width10*2,
                        right: Dimensions.width10*2,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          //Best Selling and see all
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              BigText(
                                  text: 'Recommended for you',
                                  color: AppColors.mainColor ,
                                  size: Dimensions.font26,
                                  fontWeight: FontWeight.w600
                              ),
                              // see all + icon
                              Row(
                                children: [
                                  SmallText(text: 'See all',
                                    color: AppColors.mainColor,
                                    fontWeight: FontWeight.w600,
                                    size: 18,
                                  ),
                                  SizedBox(width: Dimensions.width10,),
                                  Container(
                                    padding: EdgeInsets.all(5),
                                    width: Dimensions.Height25,
                                    height: Dimensions.Height25,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        color: AppColors.containerColor
                                    ),
                                    child: SvgPicture.asset(
                                      'assets/images/icons/right.svg',
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          //
                          Container(
                            height: Dimensions.Height230,
                            child: ListView.builder(
                                itemCount: bestSellingImage.length,
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context,index)
                                {
                                  return CardWidget(
                                      text: recommendText[index],
                                      price: recommendPrice[index],
                                      backhroundImage:recommendImage[index],
                                      brandImage:recommendBrand[index]);
                                }
                            ),
                          ),
                        ],
                      ),
                    ),

                 ]


    );


  }











  Widget _buildPageItem(int index)
  {
    Matrix4 matrix = new Matrix4.identity();
    if(index == _currPageValue.floor())
      {
        var currScale = 1-(_currPageValue-index)*(1-_scaleFactor);
        var currTrans = _height*(1-currScale)/2;//
        matrix =Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
      }else if(index == _currPageValue.floor()+1)
    {
         var currScale = _scaleFactor+(_currPageValue-index+1)*(1-_scaleFactor);
         var currTrans = _height*(1-currScale)/2;//1-0.8 /2
         matrix =Matrix4.diagonal3Values(1, currScale, 1);
         matrix =Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
    }else if(index == _currPageValue.floor()-1)
    {
      var currScale = 1-(_currPageValue-index)*(1-_scaleFactor);
      var currTrans = _height*(1-currScale)/2;
      matrix =Matrix4.diagonal3Values(1, currScale, 1);
      matrix =Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
    }
    else
      {
        var currScale=0.8;
        matrix =Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, _height*(1-_scaleFactor)/2, 0);


      }

    return Transform(
      transform: matrix,
      child: Container(
       // height: 200,
        margin: EdgeInsets.only(left: Dimensions.Height4, right: Dimensions.Height4*2,),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.radius12),
          //color: Colors.red,
          image: DecorationImage(
              image: AssetImage(
                  'assets/images/offers/blackfriday.png',
              ),
            fit: BoxFit.cover
          ),
        ),

      ),
    );
  }
}
