import 'package:flutter/material.dart';
import 'package:obaiah_mobile_app/utils/colors/colors.dart';
import 'package:obaiah_mobile_app/utils/spacing/gaps.dart';
import 'package:obaiah_mobile_app/utils/text_styles/textstyles.dart';

class NoDataMessage extends StatelessWidget {
  String message;
  NoDataMessage({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/home_images/no-data.png",
            height: 100,
            color: cPrimaryColor,
          ),
          gapH10,
          Text(
            message,
            style: homePagePrice,
          )
        ],
      ),
    );
  }
}
