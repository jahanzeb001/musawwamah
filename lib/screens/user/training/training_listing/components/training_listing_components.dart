import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/colors/colors.dart';
import '../../../../../utils/spacing/padding.dart';
import '../../../../../utils/text_styles/textstyles.dart';

class TrainingListingComponent extends StatelessWidget {
  final String numberOfShares;
  final Function()? onPressFunction;
  final String price;

  const TrainingListingComponent(
      {Key? key,
      required this.numberOfShares,
      required this.onPressFunction,
      required this.price})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IntrinsicWidth(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "number of shares".tr,
                style: primary709,
              ),
              Container(
                padding: padA5,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: cWhiteColor, borderRadius: BorderRadius.circular(5)),
                child: Text(
                  numberOfShares,
                  style: black732,
                ),
              )
            ],
          ),
        ),
        Flexible(
          flex: 2,
          child: RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(text: price, style: black732),
                const TextSpan(text: " "),
                TextSpan(text: "riyal".tr, style: primary712),
              ],
            ),
          ),
        ),
        Flexible(
            child: ElevatedButton(
                onPressed: onPressFunction,
                style: ElevatedButton.styleFrom(
                  backgroundColor: cPrimaryColor,
                  fixedSize: Size(context.width, 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7),
                  ),
                  elevation: 0.0,
                ),
                child: FittedBox(
                    child: Text("participation".tr, style: black714)))),
      ],
    );
  }
}
