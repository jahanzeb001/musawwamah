import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:obaiah_mobile_app/utils/spacing/padding.dart';

import '../../../../reusable_widgets/reusable_text.dart';
import '../../../../utils/colors/colors.dart';
import '../../../../utils/spacing/gaps.dart';
import '../../../../utils/text_styles/textstyles.dart';

class DeliveryOperationHistoryTile extends StatelessWidget {
  final String entryType, date, amount;
  final bool needImage;

  const DeliveryOperationHistoryTile(
      {Key? key,
      required this.entryType,
      required this.date,
      required this.amount,
      required this.needImage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width * 1,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: entryType == "credit"
            ? cOnyxColor24Opacity
            : cPrimaryColor24Opacity,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                date.tr,
                style: black512,
              ),
              const Spacer()
            ],
          ),
          gapH10,
          Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Spacer(
                flex: needImage ? 3 : 1,
              ),
              ReUsableText(text: amount, textStyle: black824),
              Spacer(
                flex: needImage ? 2 : 1,
              ),
              needImage
                  ? Container(
                      padding: padA15,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: cPrimaryColor),
                      child: Text(
                        "transfer image".tr,
                        style: black708,
                      ),
                    )
                  : const SizedBox.shrink()
            ],
          ),
          gapH2,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "order number #".tr,
                style: black410,
              ),
              const Text(
                "1544208",
                style: black410,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
