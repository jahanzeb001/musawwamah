import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/colors/colors.dart';
import '../../../../../utils/spacing/gaps.dart';
import '../../../../../utils/text_styles/textstyles.dart';

class ServicesComponent extends StatelessWidget {
  final String serviceName;
  final bool isServiceAvailable;

  const ServicesComponent(
      {Key? key, required this.serviceName, required this.isServiceAvailable})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          serviceName.tr,
          style: onyx713,
        ),
        gapH7,
        Icon(
          Icons.check_rounded,
          color: isServiceAvailable ? cPrimaryColor : cWhiteColor,
          size: isServiceAvailable ? 25 : 25,
        ),
      ],
    );
  }
}
