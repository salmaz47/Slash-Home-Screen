
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../utils/dimensions.dart';
import 'bottom_nav_icon.dart';
import 'package:internship_task/data/data.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  const BottomNavigationBarWidget({super.key});

  @override
  State<BottomNavigationBarWidget> createState() => _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: Dimensions.Height10*8,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(Dimensions.radius20),
              topLeft: Radius.circular(Dimensions.radius20),
            )
        ),
        child: Padding(
          padding:  EdgeInsets.only(left: 0, right: 0),
          child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: listOfTapped.length,
              itemBuilder: (context , index)
              {
                return BottomNavIcon(text: texts[index], tappedImage: listOfTapped[index], untappedImage: listOfUntapped[index]);
              }
          ),
        )
    )
    ;
  }
  }

