import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:obaiah_mobile_app/reusable_widgets/reusable_text.dart';
import 'package:obaiah_mobile_app/utils/colors/colors.dart';
import 'package:obaiah_mobile_app/utils/spacing/gaps.dart';

import '../../../../../../utils/text_styles/textstyles.dart';

class OperationHistoryTile extends StatelessWidget {
  final title, description;
  const OperationHistoryTile(
      {Key? key, required this.title, required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width * 1,
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      decoration: BoxDecoration(
        color: cPrimaryColor24Opacity,
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading: Container(
            padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 7),
            height: double.infinity,
            width: 50,
            decoration: BoxDecoration(
              color: cWhiteColor,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Image.asset('assets/images/profile_images/myWallet.png')),
        title: Text(title, style: black824),
        subtitle: Text(
          description,
          style: const TextStyle(
              fontFamily: "Tajawal",
              color: cOnyxColor,
              fontSize: 12,
              fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
