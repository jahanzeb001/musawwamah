import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../reusable_widgets/reusable_text.dart';
import '../../../../utils/colors/colors.dart';
import '../../../../utils/spacing/gaps.dart';
import '../../../../utils/text_styles/textstyles.dart';
import '../../../user/settings/wallet_portfolio/view/wallet_portfolio_screen.dart';
import '../../wallet/view/delivery_wallet_screen.dart';

class DeliveryHomeOptionWidget extends StatelessWidget {
  final String assetName;
  final String text;
  final Function()? onTapFunction;

  const DeliveryHomeOptionWidget(
      {Key? key,
      required this.assetName,
      required this.text,
      required this.onTapFunction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapFunction,
      child: Container(
        height: 100,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: cWhiteColor),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              assetName,
              height: 35,
              width: 35,
              color: cOnyxColor,
            ),
            gapH5,
            Text(
              text.tr,
              style: black413,
            ),
          ],
        ),
      ),
    );
  }
}

class DeliveryHomeBalanceReceipt extends StatelessWidget {
  final String assetName;
  final String containerText;
  final String headerText;
  final String valueText;
  int deliveryId;

  DeliveryHomeBalanceReceipt(
      {Key? key,
      required this.assetName,
      required this.containerText,
      required this.headerText,
      required this.valueText,
      required this.deliveryId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("************************* ====== delivery id:{$deliveryId}");
    return InkWell(
      onTap: () {
        Get.to(() => MyDeliveryWalletScreen(deliveryId: deliveryId));
        // Navigator.pushNamed(context, deliveryWalletScreen, arguments: {
        //   "deliveryId": deliveryId,
        // });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        height: 100,
        width: context.width * 1,
        decoration: BoxDecoration(
          color: cPrimaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              flex: 2,
              child: Container(
                alignment: Alignment.center,
                height: 80,
                decoration: BoxDecoration(
                  color: cWhiteColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      assetName,
                      height: 35,
                      width: 35,
                    ),
                    gapH5,
                    Text(
                      containerText.tr,
                      style: black413,
                    ),
                  ],
                ),
              ),
            ),
            gapW70,
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(headerText.tr, style: onyx612),
                  gapH5,
                  ReUsableText(text: valueText, textStyle: onyx824),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
