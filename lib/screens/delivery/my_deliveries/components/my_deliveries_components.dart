import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:obaiah_mobile_app/screens/user/home/regular_listing/controller/listing_controller.dart';
import 'package:obaiah_mobile_app/utils/constants/app_urls.dart';

import '../../../../reusable_widgets/reusable_button.dart';
import '../../../../reusable_widgets/reusable_text.dart';
import '../../../../utils/colors/colors.dart';
import '../../../../utils/constants/constants.dart';
import '../../../../utils/spacing/gaps.dart';
import '../../../../utils/spacing/padding.dart';
import '../../../../utils/text_styles/textstyles.dart';
import '../models/my_deliver_model.dart';
import 'package:obaiah_mobile_app/screens/delivery/my_deliveries/controller/my_deliveries_controller.dart';

class MyDeliveriesListViewInfoCard extends StatefulWidget {
  final Datum homePageModel;
  int? deliveryPersonId = 0;

  int? index;

  bool loading;

  bool loading1;

  MyDeliveriesListViewInfoCard(
      {Key? key,
      required this.homePageModel,
      this.deliveryPersonId,
      this.index,
      this.loading = false,
      this.loading1 = false})
      : super(key: key);

  @override
  State<MyDeliveriesListViewInfoCard> createState() =>
      _MyDeliveriesListViewInfoCardState();
}

class _MyDeliveriesListViewInfoCardState
    extends State<MyDeliveriesListViewInfoCard> {
  final regularListingController = Get.find<RegularListingController>();

  void initState() {
    regularListingController
        .getHorseDetails(int.parse(widget.homePageModel.horseId!));
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final myDeliveryController = Get.find<MyDeliveriesController>();
    log('${widget.homePageModel.horse!.purchase!.purchaser!.mobileNumber}');
    log('${widget.homePageModel.horse!.seller!.mobileNumber}');
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "allegiance no".tr,
                      style: onyx718,
                    ),
                    Text(
                      "# ${widget.homePageModel.horse!.horseId}",
                      // " 51450049".tr,
                      style: onyx718,
                    ),
                  ],
                ),
                Container(
                  padding: padA10,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: widget.homePageModel.status == "Pending"
                          ? cRomanSilverColor
                          : cPrimaryColor,
                      borderRadius: BorderRadius.circular(6)),
                  child: FittedBox(
                    child: Text(
                      widget.homePageModel.status == "Pending"
                          ? "waiting for your approval".tr
                          : "waiting for delivery".tr,
                      style: onyx810,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                  child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "receiving city".tr,
                    style: homePageHeading,
                  ),
                  gapH5,
                  Text(
                    widget.homePageModel.horse!.type ?? "",
                    style: homePageValue,
                  ),
                  gapH10,
                  Text(
                    "delivery point".tr,
                    style: homePageHeading,
                  ),
                  gapH5,
                  Text(
                    widget.homePageModel.horse!.color ?? "",
                    style: homePageValue,
                  ),
                  gapH10,
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "price".tr,
                        style: romanSilver408,
                      ),
                      ReUsableText(
                          text: widget.homePageModel.horse!.price.toString(),
                          textStyle: homePagePrice),
                    ],
                  ),
                ],
              )),
              gapW5,
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
                  child: CachedNetworkImage(
                    imageUrl:
                        "${AppUrls.ImagebaseUrl}${widget.homePageModel.horse!.horseFrontView}",
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          //image size fill
                          image: imageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    placeholder: (context, url) => Container(
                      alignment: Alignment.center,
                      child: CircularProgressIndicator(
                        color: cPrimaryColor,
                      ), // you can add pre loader iamge as well to show loading.
                    ), //show progress  while loading image
                    // errorWidget: (context, url, error) => Image.asset(
                    //     "assets/images/home_images/horse_image_large.jpg"),
                    //show no iamge availalbe image on error laoding
                  ),

                  // Image.network(
                  //     "${AppUrls.ImagebaseUrl}${widget.homePageModel.horse!.horseFrontView}",
                  //     fit: BoxFit.cover),
                ),
              )),
            ],
          ),
          gapH20,
          widget.homePageModel.status == "Pending"
              ? Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    gapW20,
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {
                          myDeliveryController.acceptConnection(
                              // SessionController().deliverAccountId!,
                              myDeliveryController.deliveryAccountId!,
                              // int.parse(homePageModel.deliveryPersonId!),
                              int.parse(widget.homePageModel.horseId!),
                              widget.index!);
                        },
                        style: ElevatedButton.styleFrom(
                          shadowColor: cPrimaryColor,
                          foregroundColor: cPrimaryColor,
                          side: const BorderSide(color: cBlackColor),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          elevation: 0.0,
                        ),
                        child: FittedBox(
                          child:

                              // loading
                              //     ? SizedBox(
                              //         height: 25,
                              //         width: 25,
                              //         child: Center(
                              //             child: CircularProgressIndicator(
                              //           color: cPrimaryColor,
                              //         )))
                              //     :

                              Text("accept".tr, style: black512),
                        ),
                      ),
                    ),
                    gapW10,
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {
                          myDeliveryController.rejectConnection(
                              // int.parse(homePageModel.deliveryPersonId!),
                              myDeliveryController.deliveryAccountId!,
                              int.parse(widget.homePageModel.horseId!),
                              widget.index!);
                        },
                        style: ElevatedButton.styleFrom(
                          shadowColor: cPrimaryColor,
                          foregroundColor: cPrimaryColor,
                          side: const BorderSide(color: cBlackColor),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          elevation: 0.0,
                        ),
                        child: FittedBox(
                          child: Text("reject".tr, style: black512),
                        ),
                      ),
                    ),
                    gapW20,
                  ],
                )
              : Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    PrimaryColorButton(
                      stringText: "confirm pickup",
                      onPressFunction: () {
                        log('${myDeliveryController.deliveryAccountId!}');
                        var deliveryPersonId =
                            myDeliveryController.deliveryAccountId!;
                        var horseid = int.parse(widget.homePageModel.horseId!);
                        var index = widget.index!;
                        var sellermobileNumber =
                            widget.homePageModel.horse!.seller!.mobileNumber;

                        log('$sellermobileNumber');
                        //log('$purchasermobileNumber');

                        Navigator.pushNamed(
                            context, deliveryConfirmPickupScreen,
                            arguments: {
                              "homeModel":
                                  regularListingController.horseDetailsModel,
                              "horseId": int.parse(
                                widget.homePageModel.horseId!,
                              ),
                              "sellerPhone": sellermobileNumber,
                            });
                      },
                      textStyle: white512,
                      height: 25,
                      width: context.width * 0.35,
                      radius: 8,
                    ),
                    OutlinedButton(
                      onPressed: () {
                        var purchasermobileNumber = widget.homePageModel.horse!
                            .purchase!.purchaser!.mobileNumber;
                        Navigator.pushNamed(
                            context, deliveryConfirmDropOffScreen,
                            arguments: {
                              "homeModel":
                                  regularListingController.horseDetailsModel,
                              "horseId":
                                  int.parse(widget.homePageModel.horseId!),
                              "purchaserNumber": purchasermobileNumber
                            });
                      },
                      style: ElevatedButton.styleFrom(
                        shadowColor: cPrimaryColor,
                        foregroundColor: cPrimaryColor,
                        side: const BorderSide(color: cBlackColor),
                        fixedSize: Size(context.width * 0.35, 25),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        elevation: 0.0,
                      ),
                      child: FittedBox(
                        child:
                            Text("delivery confirmation".tr, style: black512),
                      ),
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}
