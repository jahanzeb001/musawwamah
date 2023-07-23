import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../Payments/fatoorah_Custom.dart';
import '../../../../../utils/colors/colors.dart';
import '../../../../../utils/spacing/gaps.dart';
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

class AddAmountDialog extends StatelessWidget {
  final price;
  int userid;
  final hospitilityid;
  final month;

  AddAmountDialog({
    Key? key,
    required this.price,
    required this.userid,
    required this.hospitilityid,
    required this.month,
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
          // height: 170,
          width: 330,
          decoration: const BoxDecoration(color: cScaffoldBackground),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: padA10,
                margin: EdgeInsets.only(left: 35, right: 35),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        "To Be Paid".tr,
                        style: homePageOnyxGridPrice,
                      ),
                    ),
                    SizedBox(width: 30),
                    Expanded(
                      child: Text(
                        "$price  Rayal".tr,
                        style: homePageOnyxGridPrice,
                      ),
                    )
                  ],
                ),
              ),
              gapH10,
              ReusablePaymentActionWidget(
                  visaMasterCardPaymentFunction: () {
                    Navigator.pop(context);
                  },
                  madaPaymentFunction: () {},
                  applePaymentFunction: () {},
                  width: context.width * 0.5,
                  userid: userid,
                  horseid: hospitilityid,
                  sellerid: '$month',
                  totalprice: '$price',
                  role: 'traning'),
              gapH15,
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

class ReusablePaymentActionWidget extends StatefulWidget {
  final Function()? visaMasterCardPaymentFunction,
      madaPaymentFunction,
      applePaymentFunction;

  final double width;
  var userid;
  var horseid;
  var sellerid;
  var totalprice;
  var role;

  ReusablePaymentActionWidget({
    Key? key,
    required this.visaMasterCardPaymentFunction,
    required this.madaPaymentFunction,
    required this.applePaymentFunction,
    required this.width,
    required this.userid,
    required this.horseid,
    required this.sellerid,
    required this.totalprice,
    required this.role,
  }) : super(key: key);

  @override
  State<ReusablePaymentActionWidget> createState() =>
      _ReusablePaymentActionWidgetState();
}

class _ReusablePaymentActionWidgetState
    extends State<ReusablePaymentActionWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconsDisplayCardWidget(
              onTapFunction: () {
                Navigator.pop(context);
                //Get.to(() => PaymentScreen());
                Get.to(() => FatoorahCustom(
                      userid: widget.userid,
                      horseid: widget.horseid,
                      sellerid: widget.sellerid,
                      totalprice: widget.totalprice,
                      role: widget.role,
                    ));
              },
              beforeLogoAssetString:
                  'assets/images/payment_images/mada_logo.png',
              afterLogoAssetString:
                  'assets/images/payment_images/mada_text_icon.png',
            ),
            IconsDisplayCardWidget(
              onTapFunction: () {
                Navigator.pop(context);
                //Get.to(() => PaymentScreen());
                Get.to(() => FatoorahCustom(
                      userid: widget.userid,
                      horseid: widget.horseid,
                      sellerid: widget.sellerid,
                      totalprice: widget.totalprice,
                      role: widget.role,
                    ));
                // Get.to(() => PaymentScreen(
                //       Category: 'frommada',
                //       discountvalue: '10',
                //       finalprice: 100,
                //       frommada: true,
                //       isdiscount: true,
                //       saloonId: '12345',
                //       saloonname: 'alibaba',
                //       totalamount: '100',
                //       totaldiscount: '50',
                //     ));
              },
              beforeLogoAssetString:
                  'assets/images/payment_images/visa_icon.png',
              afterLogoAssetString:
                  'assets/images/payment_images/master_card_logo.png',
            ),
          ],
        ),
        gapH15,
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
            Get.to(() => FatoorahCustom(
                  userid: widget.userid,
                  horseid: widget.horseid,
                  sellerid: widget.sellerid,
                  totalprice: widget.totalprice,
                  role: widget.role,
                ));
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: cBlackColor,
              fixedSize: Size(widget.width, 40),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  "assets/images/apple_icon/apple_icon.png",
                  //Assets.appleIconAppleIcon,

                  alignment: Alignment.center,
                ),
                gapW5,
                Text(
                  "Pay",
                  style: TextStyle(
                      fontFamily: "Tajawal",
                      color: cWhiteColor,
                      fontWeight: FontWeight.w800,
                      fontSize: 27),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class IconsDisplayCardWidget extends StatelessWidget {
  final Function()? onTapFunction;
  final String beforeLogoAssetString, afterLogoAssetString;

  const IconsDisplayCardWidget(
      {Key? key,
      required this.onTapFunction,
      required this.beforeLogoAssetString,
      required this.afterLogoAssetString})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapFunction,
      child: Container(
        padding: padA10,
        decoration: BoxDecoration(
            color: cWhiteColor, borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              afterLogoAssetString,
              height: 30,
            ),
            gapW5,
            Image.asset(
              beforeLogoAssetString,
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
