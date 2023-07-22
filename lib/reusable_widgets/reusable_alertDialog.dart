import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:obaiah_mobile_app/reusable_widgets/reusable_button.dart';
import 'package:obaiah_mobile_app/utils/spacing/gaps.dart';
import 'package:otp_text_field/style.dart';
import '../utils/colors/colors.dart';
import 'package:otp_text_field/otp_text_field.dart';

import '../utils/text_styles/textstyles.dart';

class CustomAlertDialog extends StatelessWidget {
  final Function()? onPressFunction;
  final String phoneNumber;
  final OtpFieldController otpController;

  const CustomAlertDialog({
    Key? key,
    required this.otpController,
    required this.onPressFunction,
    required this.phoneNumber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        scrollable: true,
        backgroundColor: cScaffoldBackground,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        content: Container(
          height: 240,
          width: 335,
          decoration: const BoxDecoration(color: cScaffoldBackground),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              FittedBox(
                child: Text(
                  "please enter the verification code sent to the number".tr,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontFamily: "Tajawal",
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                      color: cBlackColor),
                ),
              ),
              Text(
                phoneNumber,
                style: const TextStyle(
                    fontFamily: "Tajawal",
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                    color: cBlackColor),
                textAlign: TextAlign.center,
              ),
              gapH15,
              Directionality(
                textDirection: TextDirection.ltr,
                child: OTPTextField(
                  controller: otpController,
                  length: 6,
                  width: MediaQuery.of(context).size.width,
                  fieldWidth: 40,
                  fieldStyle: FieldStyle.box,
                  style: const TextStyle(
                      fontFamily: "Tajawal",
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      color: cBlackColor),
                  textFieldAlignment: MainAxisAlignment.spaceAround,
                  otpFieldStyle: OtpFieldStyle(
                      backgroundColor: Colors.white.withOpacity(0.7)),
                  keyboardType: TextInputType.number,
                  onCompleted: (pin) {
                    log("Completed: $pin!");
                  },
                  onChanged: (pin) {
                    log("Value Entered $pin");
                  },
                ),
              ),
              gapH15,
              ReusableButton(
                  onPressFunction: onPressFunction,
                  stringText: "realization".tr)
            ],
          ),
        ));
  }
}

class ShowDescriptionDialog extends StatelessWidget {
  final String descriptionText;
  final String titleText;
  final bool isThirdTextChild;
  final String bottomText;

  const ShowDescriptionDialog({
    Key? key,
    required this.descriptionText,
    required this.titleText,
    this.isThirdTextChild = false,
    this.bottomText = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        scrollable: true,
        backgroundColor: cScaffoldBackground,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        content: Container(
          width: 335,
          decoration: const BoxDecoration(color: cScaffoldBackground),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                titleText.tr,
                style: auctionMediumPrimaryTextStyle,
                textAlign: TextAlign.center,
              ),
              gapH15,
              Text(
                descriptionText.tr,
                style: auctionHeadingTextStyle,
                textAlign: TextAlign.justify,
              ),
              isThirdTextChild
                  ? Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        gapH15,
                        Text(
                          bottomText.tr,
                          style: primary712,
                        ),
                      ],
                    )
                  : const SizedBox.shrink(),
              gapH15,
              ReusableButton(
                  onPressFunction: () {
                    Navigator.pop(context);
                  },
                  stringText: "close".tr)
            ],
          ),
        ));
  }
}
