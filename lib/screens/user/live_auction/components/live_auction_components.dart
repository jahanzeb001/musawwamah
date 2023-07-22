import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:obaiah_mobile_app/generated/assets.dart';
import 'package:obaiah_mobile_app/models/home_model.dart';
import 'package:obaiah_mobile_app/utils/constants/constants.dart';
import 'package:obaiah_mobile_app/utils/spacing/gaps.dart';
import 'package:obaiah_mobile_app/utils/spacing/padding.dart';
import '../../../../../reusable_widgets/reusable_text.dart';
import '../../../../../utils/colors/colors.dart';
import '../../../../../utils/text_styles/textstyles.dart';
import '../../../../reusable_widgets/reusable_payment_action.dart';
import '../../home/checkout/controller/checkout_controller.dart';
import '../../home/home/components/home_screen_components.dart';

class ContainerTileLiveAuction extends StatelessWidget {
  final HomeModel homeModel;
  final int index;

  const ContainerTileLiveAuction(
      {Key? key, required this.homeModel, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, horseDetailsScreen,
            arguments: {"homePageModel": homeModel});
      },
      child: Container(
        height: 45,
        width: context.width * 1,
        padding: padA10,
        decoration: BoxDecoration(
          color: homeModel.status == "over" && homeModel.isGreen == false
              ? cRomanSilverColorOpacity5
              : homeModel.isGreen == true
                  ? cGreenAccentColorOpacity5
                  : homeModel.status == "bidding is now taking place"
                      ? cPrimaryColor
                      : cWhiteColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  index.toString(),
                  style: onyx816,
                ),
                const Text(
                  "#",
                  style: onyx816,
                ),
              ],
            ),
            Text(
              homeModel.name,
              style: onyx514,
            ),
            Text(
              homeModel.status.tr,
              style: homeModel.status == "over" && homeModel.isGreen == false
                  ? cWhiteGrey714
                  : homeModel.isGreen == true
                      ? cWhiteGrey714
                      : homeModel.status == "bidding is now taking place"
                          ? white712
                          : romanSilver714,
              // style: onyx714,
            ),
          ],
        ),
      ),
    );
  }
}

//Component BidAdditionDialog For Live Auction

class BidAdditionDialogLiveAuction extends StatelessWidget {
  final Function()? onPressFunction;

  const BidAdditionDialogLiveAuction({
    Key? key,
    required this.onPressFunction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        scrollable: true,
        backgroundColor: cScaffoldBackground,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
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
              SvgPicture.asset(
                Assets.auctionImagesVerified,
                height: 35,
                width: 35,
              ),
              gapH10,
              Text(
                "i won the auction".tr,
                style: onyx820,
              ),
              gapH20,
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: cWhiteColor),
                padding: padA10,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    BiddingTableColumnComponent(
                      headerText: "auction",
                      valueText: "1900",
                    ),
                    BiddingTableColumnComponent(
                      headerText: "pursuit",
                      valueText: "47.5",
                    ),
                    BiddingTableColumnComponent(
                      headerText: "total",
                      valueText: "1947.5",
                    )
                  ],
                ),
              ),
              gapH25,
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "please pay for the auction within 3 business days".tr,
                    style: primary713,
                  ),
                  Text(
                    "in the event that you are late in paying, the sale will be canceled and the deposit will be confiscated"
                        .tr,
                    style: onyx708,
                  ),
                ],
              ),
              gapH20,
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Spacer(),
                  Expanded(
                    flex: 3,
                    child: HomeFilterAlertDialogButtonComponent(
                      text: "my purchases",
                      backGroundColor: cPrimaryColor,
                      onPressedFunction: onPressFunction,
                    ),
                  ),
                  gapW10,
                  Expanded(
                    flex: 2,
                    child: HomeFilterAlertDialogButtonComponent(
                      text: "close",
                      backGroundColor: cRomanSilverColor,
                      onPressedFunction: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  const Spacer()
                ],
              ),
            ],
          ),
        ));
  }
}

//Component BidAdditionDialog
class BidAmountPaymentDialogLiveAuction extends StatelessWidget {
  final Function()? onPressFunction;

  const BidAmountPaymentDialogLiveAuction({
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
          width: 330,
          decoration: const BoxDecoration(color: cScaffoldBackground),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                "you cannot bid".tr,
                style: onyx718,
              ),
              gapH20,
              Container(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: cCulturedWhiteColor),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "to be able to bid, you must pay a deposit of 10,000 riyals. You will be able to retrieve it later whenever you want"
                          .tr,
                      textAlign: TextAlign.center,
                      style: onyx413,
                    ),
                    gapH10,
                    ReusablePaymentActionWidget(
                        visaMasterCardPaymentFunction: () {},
                        madaPaymentFunction: () {},
                        applePaymentFunction: () {},
                        width: context.width * 0.5,
                        userid: checkoutController.userId,
                        horseid: '',
                        sellerid: '',
                        totalprice: '500',
                        role: ''),
                    gapH15,
                  ],
                ),
              ),
              gapH20,
              HomeFilterAlertDialogButtonComponent(
                text: "close",
                backGroundColor: cRomanSilverColor,
                onPressedFunction: () {
                  Navigator.pop(context);
                },
              )
            ],
          ),
        ));
  }
}

class BiddingTableColumnComponent extends StatelessWidget {
  final String headerText;
  final String valueText;

  const BiddingTableColumnComponent(
      {Key? key, required this.headerText, required this.valueText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          headerText.tr,
          style: onyx713,
        ),
        gapH10,
        ReUsableText(text: valueText, textStyle: onyx413)
      ],
    );
  }
}
