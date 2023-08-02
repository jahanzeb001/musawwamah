import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Payments/fatoorah_Custom.dart';
import '../generated/assets.dart';
import '../utils/colors/colors.dart';
import '../utils/spacing/gaps.dart';
import '../utils/spacing/padding.dart';

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
              beforeLogoAssetString: Assets.paymentImagesMadaLogo,
              afterLogoAssetString: Assets.paymentImagesMadaTextIcon,
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
              beforeLogoAssetString: Assets.paymentImagesVisaIcon,
              afterLogoAssetString: Assets.paymentImagesMasterCardLogo,
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
