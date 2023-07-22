import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:obaiah_mobile_app/reusable_widgets/reusable_payment_action.dart';
import 'package:obaiah_mobile_app/utils/spacing/gaps.dart';
import 'package:obaiah_mobile_app/utils/spacing/padding.dart';

import '../../../../../reusable_widgets/reusable_button.dart';
import '../../../../../reusable_widgets/reusable_text.dart';
import '../../../../../utils/colors/colors.dart';
import '../../../../../utils/text_styles/textstyles.dart';
import '../../checkout/controller/checkout_controller.dart';

class ImageSliderComponent extends StatelessWidget {
  const ImageSliderComponent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 14,
      height: 4,
      decoration: BoxDecoration(
        color: cGhostWhiteColor,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}

//Component InsuranceConfirmationDialog
class InsuranceConfirmationDialog extends StatelessWidget {
  final Function()? onPressFunction;

  const InsuranceConfirmationDialog({
    Key? key,
    required this.onPressFunction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        scrollable: true,
        backgroundColor: cScaffoldBackground,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        content: Container(
          width: 330,
          decoration: const BoxDecoration(color: cScaffoldBackground),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                  padding: padA10,
                  decoration: const BoxDecoration(
                      color: cWhiteColor,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Text(
                    "You must add an insurance amount of 500 riyals to be able to bid."
                        .tr,
                    textAlign: TextAlign.justify,
                    style: homePageOnyxPrice,
                  )),
              gapH20,
              ReusableOutlineUnfixedButton(
                width: 200,
                height: 50,
                stringText: "add insurance",
                onPressFunction: onPressFunction,
                radius: 10,
              ),
              gapH20,
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: cRomanSilverColor,
                      shape: const StadiumBorder()),
                  child: Text(
                    "cancel".tr,
                    style: auctionDescriptionBoldTextStyle,
                  ))
            ],
          ),
        ));
  }
}
//Component BidAdditionDialog

class BidAdditionDialog extends StatelessWidget {
  final Function()? onPressFunction;

  const BidAdditionDialog({
    Key? key,
    required this.onPressFunction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        scrollable: true,
        backgroundColor: cScaffoldBackground,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        content: Container(
          width: 330,
          decoration: const BoxDecoration(color: cScaffoldBackground),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  BidAdditionBoxComponent(text: "100"),
                  BidAdditionBoxComponent(text: "200"),
                  BidAdditionBoxComponent(text: "500"),
                ],
              ),
              gapH20,
              ReusableOutlineUnfixedButton(
                width: 200,
                height: 50,
                stringText: "add",
                radius: 10,
                onPressFunction: onPressFunction,
              ),
              gapH20,
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: cRomanSilverColor,
                      shape: const StadiumBorder()),
                  child: Text(
                    "cancel".tr,
                    style: auctionDescriptionBoldTextStyle,
                  ))
            ],
          ),
        ));
  }
}

//Component BidAdditionDialog
class BidAmountPaymentDialog extends StatelessWidget {
  final Function()? onPressFunction;

  const BidAmountPaymentDialog({
    Key? key,
    required this.onPressFunction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final checkoutController = Get.find<CheckoutController>();
    return AlertDialog(
        scrollable: true,
        backgroundColor: cScaffoldBackground,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        content: Container(
          // height: 170,
          width: 330,
          decoration: const BoxDecoration(color: cScaffoldBackground),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                "add credit".tr,
                style: homePageOnyxGridPrice,
              ),
              gapH20,
              Row(
                children: const [
                  Expanded(
                    child: BidPaymentBoxComponent(
                        text: "500", headerText: "amount", color: cWhiteColor),
                  ),
                  Expanded(
                    child: BidPaymentBoxComponent(
                        text: "500",
                        headerText: "your new balance amount",
                        color: Colors.grey),
                  ),
                ],
              ),
              gapH10,
              ReusablePaymentActionWidget(
                  visaMasterCardPaymentFunction: () {},
                  madaPaymentFunction: () {},
                  applePaymentFunction: () {},
                  width: context.width * 1,
                  userid: checkoutController.userId,
                  horseid: '1234',
                  sellerid: '1234',
                  totalprice: '500',
                  role: ''),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: cRomanSilverColor,
                      shape: const StadiumBorder()),
                  child: Text(
                    "cancel".tr,
                    style: auctionDescriptionBoldTextStyle,
                  ))
            ],
          ),
        ));
  }
}

class BidAdditionBoxComponent extends StatelessWidget {
  final String text;

  const BidAdditionBoxComponent({Key? key, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
          height: 40,
          padding: padA10,
          decoration: const BoxDecoration(
              color: cWhiteColor,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: ReUsableText(
            text: text,
            textStyle: homePageOnyxPrice,
          )),
    );
  }
}

class BidPaymentBoxComponent extends StatelessWidget {
  final String text;
  final Color color;
  final String headerText;

  const BidPaymentBoxComponent(
      {Key? key,
      required this.text,
      required this.color,
      required this.headerText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
                height: 40,
                padding: padA10,
                decoration: BoxDecoration(
                    color: color,
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
                child: ReUsableText(
                  text: text,
                  textStyle: textStyle913,
                )),
          ),
          Align(
              alignment: Alignment.topCenter,
              child: Text(
                headerText.tr,
                style: homePageGridHeading,
              )),
        ],
      ),
    );
  }
}
