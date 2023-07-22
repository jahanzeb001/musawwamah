import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:obaiah_mobile_app/utils/colors/colors.dart';
import 'package:obaiah_mobile_app/utils/spacing/gaps.dart';
import 'package:obaiah_mobile_app/utils/text_styles/textstyles.dart';

import '../../../../../reusable_widgets/reusable_text.dart';
import '../../../../../utils/constants/constants.dart';

class ProfileOptionWidget extends StatelessWidget {
  final String assetName;
  final String text;
  final Function()? onTapFunction;
  final bool needIcon;

  const ProfileOptionWidget(
      {Key? key,
      this.assetName = "",
      required this.text,
      this.needIcon = false,
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
            needIcon
                ? const Icon(
                    Icons.favorite_outline_rounded,
                    size: 35,
                    color: cPrimaryColor,
                  )
                : Image.asset(
                    assetName,
                    height: 35,
                    width: 35,
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

class BalanceReceipt extends StatefulWidget {
  final String assetName;
  final String containerText;
  final String headerText;
  final String valueText;

  const BalanceReceipt({
    Key? key,
    required this.assetName,
    required this.containerText,
    required this.headerText,
    required this.valueText,
  }) : super(key: key);

  @override
  State<BalanceReceipt> createState() => _BalanceReceiptState();
}

class _BalanceReceiptState extends State<BalanceReceipt> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, walletPortfolioScreen);
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
                      widget.assetName,
                      height: 35,
                      width: 35,
                    ),
                    gapH5,
                    Text(
                      widget.containerText.tr,
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
                  Text(widget.headerText.tr, style: onyx612),
                  gapH5,
                  ReUsableText(text: widget.valueText, textStyle: onyx824),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
