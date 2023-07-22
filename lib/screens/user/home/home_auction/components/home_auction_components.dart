import 'dart:developer';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:obaiah_mobile_app/screens/user/home/home_auction/controller/home_auction_controller.dart';
import 'package:obaiah_mobile_app/utils/constants/app_urls.dart';
import 'package:obaiah_mobile_app/utils/constants/constants.dart';
import '../../../../../utils/colors/colors.dart';
import '../../../../../utils/spacing/gaps.dart';
import '../../../../../utils/spacing/padding.dart';
import 'package:get/get.dart';
import '../model/get_bidding_horse_response.dart';

class HomeAuctionInfoCard extends StatelessWidget {
  final Datum homePageModel;
  int? index = 0;
  var remineddate;

  HomeAuctionInfoCard(
      {Key? key,
      required this.homePageModel,
      this.index,
      required this.remineddate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeScreenController = Get.find<HomeAuctionController>();

    return InkWell(
      onTap: () {
        // Navigator.pushNamed(context, auctionScreen,
        //     arguments: {"homePageModel": homePageModel});
      },
      child: Container(
        padding: padA15,
        decoration: BoxDecoration(
          color: cWhiteColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "owner".tr,
                  style: const TextStyle(
                      fontFamily: "Tajawal",
                      color: cOnyxColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  " : ${homePageModel.user?.fullname ?? ""}",
                  style: const TextStyle(
                      fontFamily: "Tajawal",
                      color: cOnyxColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w500),
                ),
                const Spacer(),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "the remaining time".tr,
                      style: const TextStyle(
                          fontFamily: "Tajawal",
                          color: cRomanSilverColor,
                          fontSize: 10,
                          fontWeight: FontWeight.w500),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          homePageModel.timeLeft ?? "",
                          style: const TextStyle(
                              fontFamily: "Tajawal",
                              color: cRomanSilverColor,
                              fontSize: 10,
                              fontWeight: FontWeight.w900),
                        ),
                        Text(
                          "hour".tr,
                          style: const TextStyle(
                              fontFamily: "Tajawal",
                              color: cRomanSilverColor,
                              fontSize: 10,
                              fontWeight: FontWeight.w900),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
            gapH10,
            Container(
              width: context.width,
              height: 150,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                child: CachedNetworkImage(
                  imageUrl:
                      "${AppUrls.ImagebaseUrl}${homePageModel.horseFrontView}",
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
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
                  errorWidget: (context, url, error) => Container(
                    alignment: Alignment.center,
                    child: CircularProgressIndicator(
                      color: cPrimaryColor,
                    ), // you can add pre loader iamge as well to show loading.
                  ), //s
                  //show no iamge availalbe image on error laoding
                ),

                // Image.network(
                //   "${AppUrls.ImagebaseUrl}${homePageModel.horseFrontView}",
                //   fit: BoxFit.cover,
                // ),
              ),
            ),
            gapH10,
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "highest bid".tr,
                      style: const TextStyle(
                          fontFamily: "Tajawal",
                          color: cRomanSilverColor,
                          fontWeight: FontWeight.w400,
                          fontSize: 10),
                    ),
                    gapH5,
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        homePageModel.bids!.length == 0
                            ? Text(
                                "No Bid Yet",
                                style: const TextStyle(
                                    fontFamily: "Tajawal",
                                    color: cRomanSilverColor,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 10),
                              )
                            : Text(
                                homePageModel.maxBid.toString(),
                                style: const TextStyle(
                                    fontFamily: "Tajawal",
                                    color: cBlackColor,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 18),
                              ),
                        homePageModel.bids!.length == 0
                            ? Text(
                                "",
                                style: const TextStyle(
                                    fontFamily: "Tajawal",
                                    color: cRomanSilverColor,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 10),
                              )
                            : Text(
                                "riyal".tr,
                                style: const TextStyle(
                                    fontFamily: "Tajawal",
                                    color: cBlackColor,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 18),
                              ),
                      ],
                    ),
                  ],
                ),
                OutlinedButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      auctionScreen,
                      arguments: {
                        "horseId": homePageModel.id,
                        "remainingTime": homePageModel.timeLeft,
                        "images": [
                          "${AppUrls.ImagebaseUrl}${homePageModel.horseFrontView}",
                          "${AppUrls.ImagebaseUrl}${homePageModel.horseBackView}",
                          "${AppUrls.ImagebaseUrl}${homePageModel.horseImageFromLeft}",
                          "${AppUrls.ImagebaseUrl}${homePageModel.horseImageFromRight}"
                        ],
                      },
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    shadowColor: cPrimaryColor,
                    foregroundColor: cPrimaryColor,
                    side: const BorderSide(color: cBlackColor),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    elevation: 0.0,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("add bid".tr,
                          style: const TextStyle(
                              fontFamily: "Tajawal",
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              color: cBlackColor)),
                      gapW5,
                      const Icon(
                        Icons.add,
                        color: cBlackColor,
                        size: 20,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
