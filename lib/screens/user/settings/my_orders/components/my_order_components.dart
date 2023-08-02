import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:obaiah_mobile_app/reusable_widgets/reusable_text.dart';
import 'package:obaiah_mobile_app/screens/user/settings/my_orders/model/get_my_purchase_response.dart';
import 'package:obaiah_mobile_app/utils/colors/colors.dart';
import 'package:obaiah_mobile_app/utils/constants/app_urls.dart';
import 'package:obaiah_mobile_app/utils/spacing/gaps.dart';
import 'package:obaiah_mobile_app/utils/spacing/padding.dart';
import '../../../../../Payments/fatoorah_Custom.dart';
import '../../../../../reusable_widgets/reusable_payment_action.dart';
import '../../../../../utils/text_styles/textstyles.dart';
import '../../../home/checkout/controller/checkout_controller.dart';
import '../../../live_auction/controller/add_rating.dart';
import '../../wallet_portfolio/components/wallet_portfoio_components.dart';
import '../view/rating_screen.dart';

class MyOrderListViewInfoCard extends StatelessWidget {
  final Datum homePageModel;

  const MyOrderListViewInfoCard({Key? key, required this.homePageModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padA15,
      width: context.width * 1,
      decoration: BoxDecoration(
        color: cWhiteColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Spacer(),
              Text(
                homePageModel.nameOfHorse ?? "",
                style: primary717,
              ),
              const Spacer(
                flex: 2,
              ),
              Text(
                homePageModel.horseNumber ?? "".tr,
                style: onyx718,
              ),
              const Spacer(),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              gapW10,
              Expanded(
                  child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "type".tr,
                        style: homePageHeading,
                      ),
                      gapH5,
                      Text(
                        homePageModel.type ?? "",
                        style: homePageValue,
                      ),
                      gapH10,
                      Text(
                        "color".tr,
                        style: homePageHeading,
                      ),
                      gapH5,
                      Text(
                        homePageModel.color ?? "",
                        style: homePageValue,
                      ),
                      gapH10,
                      Text(
                        "age".tr,
                        style: homePageHeading,
                      ),
                      gapH5,
                      Text(
                        homePageModel.age.toString(),
                        style: homePageValue,
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "originality".tr,
                        style: homePageHeading,
                      ),
                      gapH5,
                      Text(
                        homePageModel.originality ?? "",
                        style: homePageValue,
                      ),
                      gapH10,
                      Text(
                        "height".tr,
                        style: homePageHeading,
                      ),
                      gapH5,
                      Text(
                        homePageModel.height.toString(),
                        style: homePageValue,
                      ),
                      gapH10,
                      Text(
                        "misfortune".tr,
                        style: homePageHeading,
                      ),
                      gapH5,
                      Text(
                        "no".tr,
                        style: homePageValue,
                      ),
                    ],
                  ),
                ],
              )),
              gapW10,
              Expanded(
                  child: ClipPath(
                clipper: const ShapeBorderClipper(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)))),
                child: Container(
                  height: 170,
                  width: 155,
                  decoration: const BoxDecoration(
                    border: Border(
                      right: BorderSide(width: 3.0, color: cPrimaryColor),
                      bottom: BorderSide(width: 3.0, color: cPrimaryColor),
                    ),
                  ),
                  child:
                      // CachedNetworkImage(
                      //   imageUrl:
                      //       "${AppUrls.ImagebaseUrl}${homePageModel.horseFrontView ?? ""}",
                      //   imageBuilder: (context, imageProvider) => Container(
                      //     decoration: BoxDecoration(
                      //       image: DecorationImage(
                      //         //image size fill
                      //         image: imageProvider,
                      //         fit: BoxFit.cover,
                      //       ),
                      //     ),
                      //   ),
                      //   placeholder: (context, url) => Container(
                      //     alignment: Alignment.center,
                      //     child: CircularProgressIndicator(
                      //       color: cPrimaryColor,
                      //     ), // you can add pre loader iamge as well to show loading.
                      //   ), //show progress  while loading image
                      //   errorWidget: (context, url, error) => Container(
                      //     alignment: Alignment.center,
                      //     child: CircularProgressIndicator(
                      //       color: cPrimaryColor,
                      //     ), // you can add pre loader iamge as well to show loading.
                      //   ), //s
                      //   //show no iamge availalbe image on error laoding
                      // )
                      Image.network(
                          "${AppUrls.ImagebaseUrl}${homePageModel.horseFrontView ?? ""}",
                          fit: BoxFit.cover),
                ),
              )),
            ],
          ),
          gapH5,
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "price".tr,
                      style: romanSilver408,
                    ),
                    ReUsableText(
                        text: homePageModel.totalPrice.toString(),
                        textStyle: homePagePrice),
                    homePageModel.isDelivered == '1'
                        ? OutlinedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              shadowColor: cPrimaryColor,
                              foregroundColor: cPrimaryColor,
                              side: const BorderSide(color: cBlackColor),
                              fixedSize: const Size(133, 24),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              elevation: 0.0,
                            ),
                            child: FittedBox(
                              child: Text("bill".tr, style: black512),
                            ),
                          )
                        : const SizedBox.shrink(),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "allegiance case".tr,
                      style: onyx814,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Container(
                        padding: padA10,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: homePageModel.isPaid == '1'
                                ? cPrimaryColor
                                : cRomanSilverColor,
                            borderRadius: BorderRadius.circular(6)),
                        child: FittedBox(
                          child: Text(
                            homePageModel.isDelivered == '1'
                                ? "delivered successfully".tr
                                : "awaiting delivery".tr,
                            style: onyx810,
                          ),
                        ),
                      ),
                    ),
                    homePageModel.isDelivered == '1'
                        ? gapH7
                        : const SizedBox.shrink()
                  ],
                ),
              )
            ],
          ),
          homePageModel.isPaid == '1'
              ? const SizedBox.shrink()
              : OutlinedButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) => MyOrderAddAmountDialog(
                              orderNo: homePageModel.horseNumber.toString(),
                              currentbalance:
                                  homePageModel.accountBalance.toString(),
                              paid: homePageModel.price.toString(),
                              userid: homePageModel.userId,
                              horseid: homePageModel.horseId,
                              salerid: homePageModel.sellerId,
                            ));
                  },
                  style: ElevatedButton.styleFrom(
                    shadowColor: cPrimaryColor,
                    foregroundColor: cPrimaryColor,
                    side: const BorderSide(color: cBlackColor),
                    fixedSize: Size(context.width * 1, 30),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 0.0,
                  ),
                  child: FittedBox(
                    child: Text("pay now".tr, style: black512),
                  ),
                ),
        ],
      ),
    );
  }
}

/*===============================Grid View Components==========================================*/
class MyOrdersGridViewInfoCard extends StatefulWidget {
  final Datum homePageModel;

  const MyOrdersGridViewInfoCard({Key? key, required this.homePageModel})
      : super(key: key);

  @override
  State<MyOrdersGridViewInfoCard> createState() =>
      _MyOrdersGridViewInfoCardState();
}

class _MyOrdersGridViewInfoCardState extends State<MyOrdersGridViewInfoCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padA15,
      decoration: BoxDecoration(
        color: cWhiteColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Text(
            widget.homePageModel.nameOfHorse ?? "",
            style: primary717,
          ),
          Text(
            widget.homePageModel.horseNumber ?? "".tr,
            style: onyx718,
          ),
          gapH10,
          Expanded(
            child: ClipPath(
              clipper: const ShapeBorderClipper(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)))),
              child: Container(
                decoration: const BoxDecoration(
                  border: Border(
                    right: BorderSide(width: 3.0, color: cPrimaryColor),
                    bottom: BorderSide(width: 3.0, color: cPrimaryColor),
                  ),
                ),
                child:
                    // CachedNetworkImage(
                    //   imageUrl:
                    //       "${AppUrls.ImagebaseUrl}${widget.homePageModel.horseFrontView ?? ""}",
                    //   imageBuilder: (context, imageProvider) => Container(
                    //     decoration: BoxDecoration(
                    //       image: DecorationImage(
                    //         //image size fill
                    //         image: imageProvider,
                    //         fit: BoxFit.cover,
                    //       ),
                    //     ),
                    //   ),
                    //   placeholder: (context, url) => Container(
                    //     alignment: Alignment.center,
                    //     child: CircularProgressIndicator(
                    //       color: cPrimaryColor,
                    //     ), // you can add pre loader iamge as well to show loading.
                    //   ), //show progress  while loading image
                    //   errorWidget: (context, url, error) => Image.asset(
                    //       "assets/images/home_images/horse_image_large.jpg"),
                    //   //show no iamge availalbe image on error laoding
                    // )
                    Image.network(
                        "${AppUrls.ImagebaseUrl}${widget.homePageModel.horseFrontView ?? ""}",
                        fit: BoxFit.cover),
              ),
            ),
          ),
          gapH10,
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "age".tr,
                    style: homePageGridHeading,
                  ),
                  gapH5,
                  Text(
                    widget.homePageModel.age.toString(),
                    style: homePageGridValue,
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "name".tr,
                    style: homePageGridHeading,
                  ),
                  gapH5,
                  Text(
                    widget.homePageModel.nameOfHorse ?? "",
                    style: homePageGridValue,
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "height".tr,
                    style: homePageGridHeading,
                  ),
                  gapH5,
                  Text(
                    widget.homePageModel.height.toString(),
                    style: homePageGridValue,
                  ),
                ],
              ),
            ],
          ),
          gapH10,
          ReUsableText(
              text: widget.homePageModel.price.toString(),
              textStyle: homePageGridPrice),
          Text(
            "allegiance case".tr,
            style: onyx814,
          ),
          Container(
            width: 124,
            padding: padA10,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: widget.homePageModel.isPaid == '1'
                    ? cPrimaryColor
                    : cRomanSilverColor,
                borderRadius: BorderRadius.circular(6)),
            child: Text(
              widget.homePageModel.isDelivered == '1'
                  ? "delivered successfully".tr
                  : "awaiting delivery".tr,
              style: onyx810,
            ),
          ),
          gapH10,
          widget.homePageModel.isDelivered == '1'
              ? OutlinedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    shadowColor: cPrimaryColor,
                    foregroundColor: cPrimaryColor,
                    side: const BorderSide(color: cBlackColor),
                    fixedSize: const Size(133, 24),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 0.0,
                  ),
                  child: FittedBox(
                    child: Text("bill".tr, style: black512),
                  ),
                )
              : const SizedBox.shrink(),
          widget.homePageModel.isPaid == '1'
              ? const SizedBox.shrink()
              : OutlinedButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) => MyOrderAddAmountDialog(
                            orderNo:
                                widget.homePageModel.horseNumber.toString(),
                            currentbalance:
                                widget.homePageModel.accountBalance.toString(),
                            paid: widget.homePageModel.price.toString(),
                            userid: widget.homePageModel.userId,
                            horseid: widget.homePageModel.horseId,
                            salerid: widget.homePageModel.sellerId));
                  },
                  style: ElevatedButton.styleFrom(
                    shadowColor: cPrimaryColor,
                    foregroundColor: cPrimaryColor,
                    side: const BorderSide(color: cBlackColor),
                    fixedSize: Size(context.width * 1, 30),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 0.0,
                  ),
                  child: FittedBox(
                    child: Text("pay now".tr, style: black512),
                  ),
                ),
        ],
      ),
    );
  }
}

class MyOrderAddAmountDialog extends StatefulWidget {
  final String orderNo;
  var currentbalance;
  var paid;
  var userid;
  var horseid;
  var salerid;

  MyOrderAddAmountDialog({
    required this.orderNo,
    required this.currentbalance,
    required this.paid,
    required this.userid,
    required this.horseid,
    required this.salerid,
    Key? key,
  }) : super(key: key);

  @override
  State<MyOrderAddAmountDialog> createState() => _MyOrderAddAmountDialogState();
}

class _MyOrderAddAmountDialogState extends State<MyOrderAddAmountDialog> {
  var totalpay = '';
  @override
  void initState() {
    totalpaid();
    super.initState();
  }

  totalpaid() {
    totalpay = (int.parse(widget.paid) + 500).toString();
    setState(() {});
  }

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
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "pay for order no".tr,
                    style: onyx911,
                  ),
                  Text(
                    " # ${widget.orderNo}".tr,
                    style: onyx911,
                  ),
                ],
              ),
              gapH20,
              Row(
                children: [
                  Expanded(
                    child: AmountAdditionBoxComponent(
                        text: "${widget.paid}".tr,
                        headerText: "the amount of allegiance",
                        color: cWhiteColor),
                  ),
                  Expanded(
                    child: AmountAdditionBoxComponent(
                        text: "${widget.currentbalance}".tr,
                        headerText: "current balance",
                        color: Colors.grey),
                  ),
                ],
              ),
              gapH20,
              SizedBox(
                height: 44,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                          height: 40,
                          width: 200,
                          padding: padA10,
                          decoration: BoxDecoration(
                              color: cPrimaryColor24Opacity,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10))),
                          child: ReUsableText(
                            text: "$totalpay",
                            textStyle: textStyle913,
                          )),
                    ),
                    Align(
                        alignment: Alignment.topCenter,
                        child: Text(
                          "to be paid now".tr,
                          style: homePageGridHeading,
                        )),
                  ],
                ),
              ),
              gapH35,
              ReusablePaymentActionWidget(
                visaMasterCardPaymentFunction: () {
                  Navigator.pop(context);
                  Get.to(() => FatoorahCustom(
                        userid: widget.userid,
                        horseid: widget.horseid,
                        sellerid: widget.salerid,
                        totalprice: totalpay,
                        role: 'payment',
                      ));
                },
                madaPaymentFunction: () {
                  Navigator.pop(context);
                  Get.to(() => FatoorahCustom(
                        userid: widget.userid,
                        horseid: widget.horseid,
                        sellerid: widget.salerid,
                        totalprice: totalpay,
                        role: 'payment',
                      ));
                },
                applePaymentFunction: () {},
                width: context.width * 0.5,
                userid: widget.userid,
                horseid: widget.horseid,
                sellerid: widget.salerid,
                totalprice: totalpay,
                role: 'payment',
              ),
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
