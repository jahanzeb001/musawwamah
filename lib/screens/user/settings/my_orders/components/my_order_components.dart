import 'dart:developer';

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
import '../../../../../Payments/thanku_controller.dart';
import '../../../../../reusable_widgets/reusable_payment_action.dart';
import '../../../../../utils/text_styles/textstyles.dart';
import '../../../home/checkout/controller/checkout_controller.dart';
import '../../../home/checkout/receipts/purchase_receipts.dart';
import '../../../live_auction/controller/add_rating.dart';
import '../../wallet_portfolio/components/wallet_portfoio_components.dart';
import '../view/rating_screen.dart';

class MyOrderListViewInfoCard extends StatefulWidget {
  final Datum homePageModel;

  MyOrderListViewInfoCard({Key? key, required this.homePageModel})
      : super(key: key);

  @override
  State<MyOrderListViewInfoCard> createState() =>
      _MyOrderListViewInfoCardState();
}

class _MyOrderListViewInfoCardState extends State<MyOrderListViewInfoCard> {
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
                widget.homePageModel.nameOfHorse ?? "",
                style: primary717,
              ),
              const Spacer(
                flex: 2,
              ),
              Text(
                widget.homePageModel.horseNumber ?? "".tr,
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
                        widget.homePageModel.type ?? "",
                        style: homePageValue,
                      ),
                      gapH10,
                      Text(
                        "color".tr,
                        style: homePageHeading,
                      ),
                      gapH5,
                      Text(
                        widget.homePageModel.color ?? "",
                        style: homePageValue,
                      ),
                      gapH10,
                      Text(
                        "age".tr,
                        style: homePageHeading,
                      ),
                      gapH5,
                      Text(
                        widget.homePageModel.age.toString(),
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
                        widget.homePageModel.originality ?? "",
                        style: homePageValue,
                      ),
                      gapH10,
                      Text(
                        "height".tr,
                        style: homePageHeading,
                      ),
                      gapH5,
                      Text(
                        widget.homePageModel.height.toString(),
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
                          "${AppUrls.ImagebaseUrl}${widget.homePageModel.horseFrontView ?? ""}",
                          fit: BoxFit.cover),
                ),
              )),
            ],
          ),
          widget.homePageModel.isReviewed == '0' ? Text('') : gapH5,
          Row(
            crossAxisAlignment: widget.homePageModel.isReviewed == '1'
                ? CrossAxisAlignment.end
                : CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "price".tr,
                      style: romanSilver408,
                    ),
                    ReUsableText(
                        text: widget.homePageModel.totalPrice.toString(),
                        textStyle: homePagePrice),
                    widget.homePageModel.isDelivered == '1'
                        ? Column(
                            children: [
                              OutlinedButton(
                                onPressed: () {
                                  Get.to(() => PurchaserReceipts(
                                        aliganceno:
                                            '${widget.homePageModel.horseNumber}',
                                        purchasername:
                                            '${widget.homePageModel.sellername}',
                                        address:
                                            '${widget.homePageModel.pickupAddress}',
                                        sellername:
                                            '${widget.homePageModel.sellername}',
                                        customerphone:
                                            '${widget.homePageModel.mobileNumber}',
                                        horsepprice:
                                            '${widget.homePageModel.price}',
                                        dileverycharges: '10',
                                        total:
                                            '${widget.homePageModel.totalPrice}',
                                      ));
                                },
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
                              ),
                              widget.homePageModel.isReviewed == '1'
                                  ? Container()
                                  : OutlinedButton(
                                      onPressed: () {
                                        var sellername =
                                            widget.homePageModel.sellername ??
                                                "";

                                        var deliveryname = widget.homePageModel
                                                .deliveryboyname ??
                                            "";
                                        var sellerid =
                                            widget.homePageModel.sellerId ?? "";
                                        var horseid =
                                            widget.homePageModel.horseId ?? "";
                                        var imgurl =
                                            widget.homePageModel.profileImage;
                                        showRatingDialog(
                                            context,
                                            sellerid,
                                            horseid,
                                            sellername,
                                            deliveryname,
                                            imgurl);
                                      },
                                      style: ElevatedButton.styleFrom(
                                        shadowColor: cPrimaryColor,
                                        foregroundColor: cPrimaryColor,
                                        side: const BorderSide(
                                            color: cBlackColor),
                                        fixedSize: const Size(133, 24),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        elevation: 0.0,
                                      ),
                                      child: FittedBox(
                                        child:
                                            Text("Review".tr, style: black512),
                                      ),
                                    ),
                            ],
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
                            color: widget.homePageModel.isPaid == '1'
                                ? cPrimaryColor
                                : cRomanSilverColor,
                            borderRadius: BorderRadius.circular(6)),
                        child: FittedBox(
                          child: Text(
                            widget.homePageModel.isDelivered == '1'
                                ? "delivered successfully".tr
                                : "awaiting delivery".tr,
                            style: onyx810,
                          ),
                        ),
                      ),
                    ),
                    widget.homePageModel.isDelivered == '1'
                        ? gapH7
                        : const SizedBox.shrink()
                  ],
                ),
              )
            ],
          ),
          widget.homePageModel.isPaid == '1'
              ? const SizedBox.shrink()
              : OutlinedButton(
                  onPressed: () {
                    var aligance = widget.homePageModel.horseNumber;
                    var name = widget.homePageModel.nameOfHorse;
                    var totalprice = widget.homePageModel.totalPrice.toString();
                    var location = widget.homePageModel.city;
                    var imgurl = widget.homePageModel.horseFrontView;
                    setthanku(aligance, name, totalprice, location, imgurl);
                    showDialog(
                        context: context,
                        builder: (context) => MyOrderAddAmountDialog(
                              orderNo:
                                  widget.homePageModel.horseNumber.toString(),
                              currentbalance: widget
                                  .homePageModel.accountBalance
                                  .toString(),
                              paid: widget.homePageModel.totalPrice.toString(),
                              userid: widget.homePageModel.userId,
                              horseid: widget.homePageModel.horseId,
                              salerid: widget.homePageModel.sellerId,
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

  ThankuScreenController userThankuController =
      Get.find<ThankuScreenController>();

  void setthanku(aligance, name, totalprice, location, imgurl) {
    userThankuController.setThankuData(
        aligance, name, totalprice, location, imgurl);
    log('aligance ${userThankuController.aliganceno}');
  }

  showRatingDialog(BuildContext context, sellerid, horseid, sellername,
      deliveryboyname, dimgurl) {
    TextEditingController seller = TextEditingController();
    TextEditingController dilaverboy = TextEditingController();
    double rating1 = 0.0;
    double rating2 = 0.0;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            // title: Text('Obeiah App'),

            content: Container(
          padding: EdgeInsets.all(5),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Expanded(
                        flex: 2,
                        child: Text('$sellername',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold))),
                    Expanded(
                      flex: 3,
                      child: Image.asset(
                        'assets/images/auction_images/person_image.png',
                        width: 100,
                        height: 100,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 10.0),
                RatingBar.builder(
                  initialRating: rating1,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemSize: 40.0,
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: cPrimaryColor,
                  ),
                  onRatingUpdate: (newRating) {
                    setState(() {
                      rating1 = newRating;
                    });
                  },
                ),
                SizedBox(height: 10.0),
                //Text('Rating 1: $rating1'),
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: cWhiteColor),
                  child: TextField(
                    controller: seller,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: cPrimaryColor,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: cPrimaryColor,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      hintText: "Write Text...",
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Row(
                  children: [
                    Expanded(
                        flex: 2,
                        child: Text('$deliveryboyname',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold))),
                    Expanded(
                        flex: 3,
                        child: Image.network(
                          "${AppUrls.ImagebaseUrl}${dimgurl}",
                          fit: BoxFit.cover,
                          height: 100,
                          width: 100,
                        ))
                  ],
                ),
                RatingBar.builder(
                  initialRating: rating2,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemSize: 40.0,
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: cPrimaryColor,
                  ),
                  onRatingUpdate: (newRating) {
                    setState(() {
                      rating2 = newRating;
                    });
                  },
                ),
                SizedBox(height: 10.0),
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: cWhiteColor),
                  child: TextField(
                    controller: dilaverboy,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: cPrimaryColor,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: cPrimaryColor,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      hintText: "Write Text...",
                    ),
                  ),
                ),
                SizedBox(height: 15.0),
                SizedBox(
                  height: 50,
                  child: OutlinedButton(
                    onPressed: () {
                      log("${rating1} --${rating2}--${seller.text}} ");

                      AddRattingRecord.addrating(
                          userId: int.tryParse(sellerid),
                          horseid: int.tryParse(horseid),
                          sellerating: rating1,
                          deliverrating: rating2,
                          sellercomment: seller.text,
                          deleveryboycomment: dilaverboy.text,
                          context: context);
                    },
                    style: ElevatedButton.styleFrom(
                      shadowColor: cPrimaryColor,
                      foregroundColor: cPrimaryColor,
                      fixedSize: const Size(200, 35),
                      side: const BorderSide(color: cBlackColor),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 0.0,
                    ),
                    child: FittedBox(
                      child: Text('submit', style: homePageGridValue),
                    ),
                  ),
                ),
                //Text('Rating 2: $rating2'),
              ],
            ),
          ),
        ));
      },
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
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
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
              ? Column(
                  children: [
                    OutlinedButton(
                      onPressed: () {
                        Get.to(() => PurchaserReceipts(
                              aliganceno: '${widget.homePageModel.horseNumber}',
                              purchasername:
                                  '${widget.homePageModel.sellername}',
                              address: '${widget.homePageModel.pickupAddress}',
                              sellername: '${widget.homePageModel.sellername}',
                              customerphone:
                                  '${widget.homePageModel.mobileNumber}',
                              horsepprice: '${widget.homePageModel.price}',
                              dileverycharges: '10',
                              total: '${widget.homePageModel.totalPrice}',
                            ));
                      },
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
                    ),
                    widget.homePageModel.isReviewed == '1'
                        ? Container()
                        : OutlinedButton(
                            onPressed: () {
                              var sellername =
                                  widget.homePageModel.sellername ?? "";

                              var deliveryname =
                                  widget.homePageModel.deliveryboyname ?? "";
                              var sellerid =
                                  widget.homePageModel.sellerId ?? "";
                              var horseid = widget.homePageModel.horseId ?? "";
                              var imgurl = widget.homePageModel.profileImage;
                              showRatingDialog(context, sellerid, horseid,
                                  sellername, deliveryname, imgurl);
                            },
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
                              child: Text("Review".tr, style: black512),
                            ),
                          ),
                  ],
                )
              : const SizedBox.shrink(),
          widget.homePageModel.isPaid == '1'
              ? const SizedBox.shrink()
              : OutlinedButton(
                  onPressed: () {
                    var aligance = widget.homePageModel.horseNumber;
                    var name = widget.homePageModel.nameOfHorse;
                    var totalprice = widget.homePageModel.totalPrice.toString();
                    var location = widget.homePageModel.city;
                    var imgurl = widget.homePageModel.horseFrontView;
                    setthanku(aligance, name, totalprice, location, imgurl);
                    showDialog(
                        context: context,
                        builder: (context) => MyOrderAddAmountDialog(
                            orderNo:
                                widget.homePageModel.horseNumber.toString(),
                            currentbalance:
                                widget.homePageModel.accountBalance.toString(),
                            paid: widget.homePageModel.totalPrice.toString(),
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

  ThankuScreenController userThankuController =
      Get.find<ThankuScreenController>();
  void setthanku(aligance, name, totalprice, location, imgurl) {
    userThankuController.setThankuData(
        aligance, name, totalprice, location, imgurl);
    log('aligance ${userThankuController.aliganceno}');
  }

  showRatingDialog(BuildContext context, sellerid, horseid, sellername,
      deliveryboyname, dimgurl) {
    TextEditingController seller = TextEditingController();
    TextEditingController dilaverboy = TextEditingController();
    double rating1 = 0.0;
    double rating2 = 0.0;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            // title: Text('Obeiah App'),

            content: Container(
          padding: EdgeInsets.all(5),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Expanded(
                        flex: 2,
                        child: Text('$sellername',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold))),
                    Expanded(
                      flex: 3,
                      child: Image.asset(
                        'assets/images/auction_images/person_image.png',
                        width: 100,
                        height: 100,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 10.0),
                RatingBar.builder(
                  initialRating: rating1,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemSize: 40.0,
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: cPrimaryColor,
                  ),
                  onRatingUpdate: (newRating) {
                    setState(() {
                      rating1 = newRating;
                    });
                  },
                ),
                SizedBox(height: 10.0),
                //Text('Rating 1: $rating1'),
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: cWhiteColor),
                  child: TextField(
                    controller: seller,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: cPrimaryColor,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: cPrimaryColor,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      hintText: "Write Text...",
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Row(
                  children: [
                    Expanded(
                        flex: 2,
                        child: Text('$deliveryboyname',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold))),
                    Expanded(
                        flex: 3,
                        child: Image.network(
                          "${AppUrls.ImagebaseUrl}${dimgurl}",
                          fit: BoxFit.cover,
                          height: 100,
                          width: 100,
                        ))
                  ],
                ),
                RatingBar.builder(
                  initialRating: rating2,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemSize: 40.0,
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: cPrimaryColor,
                  ),
                  onRatingUpdate: (newRating) {
                    setState(() {
                      rating2 = newRating;
                    });
                  },
                ),
                SizedBox(height: 10.0),
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: cWhiteColor),
                  child: TextField(
                    controller: dilaverboy,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: cPrimaryColor,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: cPrimaryColor,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      hintText: "Write Text...",
                    ),
                  ),
                ),
                SizedBox(height: 15.0),
                SizedBox(
                  height: 50,
                  child: OutlinedButton(
                    onPressed: () {
                      log("${rating1} --${rating2}--${seller.text}} ");

                      AddRattingRecord.addrating(
                          userId: int.tryParse(sellerid),
                          horseid: int.tryParse(horseid),
                          sellerating: rating1,
                          deliverrating: rating2,
                          sellercomment: seller.text,
                          deleveryboycomment: dilaverboy.text,
                          context: context);
                    },
                    style: ElevatedButton.styleFrom(
                      shadowColor: cPrimaryColor,
                      foregroundColor: cPrimaryColor,
                      fixedSize: const Size(200, 35),
                      side: const BorderSide(color: cBlackColor),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 0.0,
                    ),
                    child: FittedBox(
                      child: Text('submit', style: homePageGridValue),
                    ),
                  ),
                ),
                //Text('Rating 2: $rating2'),
              ],
            ),
          ),
        ));
      },
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
                            text: "${widget.paid}",
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
                        userid: int.parse('${widget.userid}'),
                        horseid: widget.horseid,
                        sellerid: widget.salerid,
                        totalprice: totalpay,
                        role: 'payment',
                      ));
                },
                madaPaymentFunction: () {
                  Navigator.pop(context);
                  Get.to(() => FatoorahCustom(
                        userid: int.parse('${widget.userid}'),
                        horseid: widget.horseid,
                        sellerid: widget.salerid,
                        totalprice: totalpay,
                        role: 'payment',
                      ));
                },
                applePaymentFunction: () {},
                width: context.width * 0.5,
                userid: int.parse('${widget.userid}'),
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

// class RatingDialog extends StatefulWidget {
//   const RatingDialog({super.key});

//   @override
//   State<RatingDialog> createState() => _RatingDialogState();
// }

// class _RatingDialogState extends State<RatingDialog> {
//   TextEditingController seller = TextEditingController();
//   TextEditingController dilaverboy = TextEditingController();
//   double rating1 = 0.0;
//   double rating2 = 0.0;
//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//         // title: Text('Obeiah App'),

//         content: Container(
//       padding: EdgeInsets.all(5),
//       child: SingleChildScrollView(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Row(
//               children: [
//                 // $sellername
//                 Expanded(
//                     flex: 2,
//                     child: Text('Ahmed',
//                         style: TextStyle(
//                             fontSize: 20, fontWeight: FontWeight.bold))),
//                 Expanded(
//                   flex: 3,
//                   child: Image.asset(
//                     'assets/images/auction_images/person_image.png',
//                     width: 100,
//                     height: 100,
//                   ),
//                 )
//               ],
//             ),
//             SizedBox(height: 10.0),
//             RatingBar.builder(
//               initialRating: rating1,
//               minRating: 0,
//               direction: Axis.horizontal,
//               allowHalfRating: true,
//               itemCount: 5,
//               itemSize: 40.0,
//               itemBuilder: (context, _) => Icon(
//                 Icons.star,
//                 color: Colors.amber,
//               ),
//               onRatingUpdate: (newRating) {
//                 // setState(() {
//                 //   rating1 = newRating;
//                 // });
//               },
//             ),
//             SizedBox(height: 10.0),
//             //Text('Rating 1: $rating1'),
//             Container(
//               padding: EdgeInsets.all(5),
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10), color: cWhiteColor),
//               child: TextField(
//                 controller: seller,
//                 decoration: InputDecoration(
//                   enabledBorder: OutlineInputBorder(
//                     borderSide: BorderSide(
//                       color: cPrimaryColor,
//                     ),
//                     borderRadius: BorderRadius.circular(10.0),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderSide: BorderSide(
//                       color: cPrimaryColor,
//                     ),
//                     borderRadius: BorderRadius.circular(10.0),
//                   ),
//                   hintText: "Write Text...",
//                 ),
//               ),
//             ),
//             SizedBox(height: 20.0),
//             Row(
//               children: [
//                 // $deliveryboyname
//                 Expanded(
//                     flex: 2,
//                     child: Text('delevery',
//                         style: TextStyle(
//                             fontSize: 20, fontWeight: FontWeight.bold))),
//                 Expanded(
//                   flex: 3,
//                   child: Image.asset(
//                     'assets/images/auction_images/person_image.png',
//                     width: 100,
//                     height: 100,
//                   ),
//                 )
//               ],
//             ),
//             RatingBar.builder(
//               initialRating: rating2,
//               minRating: 0,
//               direction: Axis.horizontal,
//               allowHalfRating: true,
//               itemCount: 5,
//               itemSize: 40.0,
//               itemBuilder: (context, _) => Icon(
//                 Icons.star,
//                 color: Colors.amber,
//               ),
//               onRatingUpdate: (newRating) {
//                 // setState(() {
//                 //   rating2 = newRating;
//                 // });
//               },
//             ),
//             SizedBox(height: 10.0),
//             Container(
//               padding: EdgeInsets.all(5),
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10), color: cWhiteColor),
//               child: TextField(
//                 controller: dilaverboy,
//                 decoration: InputDecoration(
//                   enabledBorder: OutlineInputBorder(
//                     borderSide: BorderSide(
//                       color: cPrimaryColor,
//                     ),
//                     borderRadius: BorderRadius.circular(10.0),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderSide: BorderSide(
//                       color: cPrimaryColor,
//                     ),
//                     borderRadius: BorderRadius.circular(10.0),
//                   ),
//                   hintText: "Write Text...",
//                 ),
//               ),
//             ),
//             SizedBox(height: 15.0),
//             SizedBox(
//               height: 50,
//               child: OutlinedButton(
//                 onPressed: () {
//                   print("${rating1} --${rating2}--${seller.text}} ");
//                   // int.tryParse(sellerid)
//                   // int.tryParse(horseid)
//                   AddRattingRecord.addrating(
//                       userId: 1,
//                       horseid: 4,
//                       sellerating: rating1,
//                       deliverrating: rating2,
//                       sellercomment: seller.text,
//                       deleveryboycomment: dilaverboy.text,
//                       context: context);
//                   // deliverycomment: dilaverboy.text
//                 },
//                 style: ElevatedButton.styleFrom(
//                   shadowColor: cPrimaryColor,
//                   foregroundColor: cPrimaryColor,
//                   fixedSize: const Size(200, 35),
//                   side: const BorderSide(color: cBlackColor),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   elevation: 0.0,
//                 ),
//                 child: FittedBox(
//                   child: Text('submit', style: homePageGridValue),
//                 ),
//               ),
//             ),
//             //Text('Rating 2: $rating2'),
//           ],
//         ),
//       ),
//     ));
//   }
// }
