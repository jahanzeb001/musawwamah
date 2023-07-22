import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:obaiah_mobile_app/utils/colors/colors.dart';
import 'package:obaiah_mobile_app/utils/text_styles/textstyles.dart';

import '../../../../../utils/spacing/gaps.dart';

class SettingCardComponent extends StatelessWidget {
  final String assetName;
  final String componentOptionTitle;
  final bool switchValue;
  final Function(bool) switchFunction;

  const SettingCardComponent({
    Key? key,
    required this.assetName,
    required this.componentOptionTitle,
    required this.switchValue,
    required this.switchFunction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      padding: const EdgeInsets.all(2),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: cWhiteColor,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(assetName),
          gapH10,
          Text(
            componentOptionTitle.tr,
            style: onyx712,
          ),
          gapH4,
          CupertinoSwitch(
            value: switchValue,
            onChanged: switchFunction,
            thumbColor: switchValue ? cWhiteColor : cBlackColor,
            activeColor: cPrimaryColor,
            trackColor: cCulturedWhiteColor,
          ),
          gapH2,
          Text(
            switchValue ? "enabled".tr : "disabled".tr,
            style: onyx708,
          ),
        ],
      ),
    );
  }
}
