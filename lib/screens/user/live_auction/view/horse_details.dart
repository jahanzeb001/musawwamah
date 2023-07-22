import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:obaiah_mobile_app/models/home_model.dart';
import '../../../../generated/assets.dart';
import '../../../../utils/colors/colors.dart';
import '../../../../utils/spacing/gaps.dart';
import '../../../../utils/spacing/padding.dart';
import '../../../../utils/text_styles/textstyles.dart';
import '../controller/live_auction_controller.dart';

class HorseDetailsScreen extends StatelessWidget {
  final HomeModel homeModel;

  const HorseDetailsScreen({Key? key, required this.homeModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final liveAuctionController = Get.find<LiveAuctionController>();
    return Scaffold(
        appBar: AppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "horse details".tr,
                ),
                const Text(": "),
                Text(homeModel.name),
              ],
            ),
            titleTextStyle: onyx520,
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back_rounded,
                color: cBlackColor,
                size: 25,
              ),
            )),
        body: Container(
          padding: padA10,
          child: SingleChildScrollView(
            child: Column(
              children: [
                //Component 1
                Container(
                  padding: padA10,
                  height: 355,
                  width: context.width * 1,
                  decoration: BoxDecoration(
                      color: cWhiteColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text(
                                  "bidding for a horse".tr,
                                  style: silver510,
                                ),
                                Text(
                                  homeModel.owner.tr,
                                  style: const TextStyle(
                                      fontFamily: "Tajawal",
                                      color: cRomanSilverColor,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  "highest bid".tr,
                                  style: silver510,
                                ),
                                Text("not you".tr, style: red810),
                              ],
                            ),
                          ],
                        ),
                      ),
                      ClipPath(
                        clipper: const ShapeBorderClipper(
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)))),
                        child: Container(
                          height: 290,
                          width: context.width * 1,
                          decoration: BoxDecoration(
                            border: Border(
                              right: BorderSide(
                                  width: 6.0,
                                  color: Colors.black.withOpacity(0.1)),
                              bottom: BorderSide(
                                  width: 6.0,
                                  color: Colors.black.withOpacity(0.1)),
                            ),
                          ),
                          child: Image.asset(
                              Assets.liveAuctionImagesLiveAuctionImage,
                              fit: BoxFit.cover),
                        ),
                      )
                    ],
                  ),
                ),
                gapH20,
                //Component 3
                SizedBox(
                  height: 289,
                  width: context.width * 1,
                  child: Stack(children: [
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 5),
                        height: 280,
                        width: context.width * 1,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Expanded(
                                    child: Text(
                                      "type".tr,
                                      style: auctionHeadingTextStyle,
                                    ),
                                  ),
                                  gapH5,
                                  Expanded(
                                    child: Text(
                                      homeModel.type,
                                      style: auctionValueTextStyle,
                                    ),
                                  ),
                                  gapH25,
                                  Expanded(
                                    child: Text(
                                      "color".tr,
                                      style: auctionHeadingTextStyle,
                                    ),
                                  ),
                                  gapH5,
                                  Expanded(
                                    child: Text(homeModel.color,
                                        style: auctionValueTextStyle),
                                  ),
                                  gapH25,
                                  //Repeat
                                  Expanded(
                                    child: Text(
                                      "name of the father".tr,
                                      style: auctionHeadingTextStyle,
                                    ),
                                  ),
                                  gapH5,
                                  Expanded(
                                    child: Text(
                                      homeModel.fatherName,
                                      style: auctionValueTextStyle,
                                    ),
                                  ),
                                  gapH25,
                                  Expanded(
                                    child: Text(
                                      "mother name".tr,
                                      style: auctionHeadingTextStyle,
                                    ),
                                  ),
                                  gapH5,
                                  Expanded(
                                    child: Text(homeModel.motherName,
                                        style: auctionValueTextStyle),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Expanded(
                                    child: Text(
                                      "name".tr,
                                      style: auctionHeadingTextStyle,
                                    ),
                                  ),
                                  gapH5,
                                  Expanded(
                                    child: Text(
                                      homeModel.name,
                                      style: auctionValueTextStyle,
                                    ),
                                  ),
                                  gapH25,
                                  Expanded(
                                    child: Text(
                                      "height".tr,
                                      style: auctionHeadingTextStyle,
                                    ),
                                  ),
                                  gapH5,
                                  Expanded(
                                    child: Text(homeModel.height,
                                        style: auctionValueTextStyle),
                                  ),
                                  gapH25,
                                  Expanded(
                                    child: Text(
                                      "weight".tr,
                                      style: auctionHeadingTextStyle,
                                    ),
                                  ),
                                  gapH5,
                                  Expanded(
                                    child: Text(
                                      homeModel.weight,
                                      style: auctionValueTextStyle,
                                    ),
                                  ),
                                  gapH25,
                                  Expanded(
                                    child: Text(
                                      "originality".tr,
                                      style: auctionHeadingTextStyle,
                                    ),
                                  ),
                                  gapH5,
                                  Expanded(
                                    child: Text(homeModel.originality,
                                        style: auctionValueTextStyle),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Expanded(
                                    child: Text(
                                      "age".tr,
                                      style: auctionHeadingTextStyle,
                                    ),
                                  ),
                                  gapH5,
                                  Expanded(
                                    child: Text(
                                      homeModel.age,
                                      style: auctionValueTextStyle,
                                    ),
                                  ),
                                  gapH25,
                                  Expanded(
                                    child: Text(
                                      "safety".tr,
                                      style: auctionHeadingTextStyle,
                                    ),
                                  ),
                                  gapH5,
                                  Expanded(
                                    child: Text(homeModel.safety,
                                        style: auctionValueTextStyle),
                                  ),
                                  gapH25,
                                  Expanded(
                                    child: Text(
                                      "site".tr,
                                      style: auctionHeadingTextStyle,
                                    ),
                                  ),
                                  gapH5,
                                  Expanded(
                                    child: Text(
                                      homeModel.site,
                                      style: auctionValueTextStyle,
                                    ),
                                  ),
                                  gapH25,
                                  Expanded(
                                    child: Text(
                                      "did he complete his vaccinations?".tr,
                                      style: auctionHeadingTextStyle,
                                    ),
                                  ),
                                  gapH5,
                                  Expanded(
                                    child: Text(
                                        homeModel.isVaccinated == 1
                                            ? 'yes'
                                            : 'no',
                                        style: auctionValueTextStyle),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                        alignment: Alignment.topRight,
                        child: Row(
                          children: [
                            gapW20,
                            Text(
                              "horse details".tr,
                              style: auctionMediumPrimaryTextStyle,
                            ),
                          ],
                        )),
                  ]),
                ),
                gapH20,
                //Component 4
                SizedBox(
                  height: 289,
                  width: context.width * 1,
                  child: Stack(children: [
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        padding: padA20,
                        height: 280,
                        width: context.width * 1,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: Text(
                          "Lorem Ipsum is a virtual model that is placed in the designs to be presented to the client to visualize the method of placing texts in the designs, whether they are printed designs. Brochure or flyer, for example. or website templates. Upon the client's initial approval of the design, this text is removed from the design and the final texts are placed"
                              .tr,
                          textAlign: TextAlign.justify,
                          style: auctionDescriptionTextStyle,
                        ),
                      ),
                    ),
                    Align(
                        alignment: Alignment.topRight,
                        child: Row(
                          children: [
                            gapW20,
                            Text(
                              "additional description".tr,
                              style: auctionMediumPrimaryTextStyle,
                            ),
                          ],
                        )),
                  ]),
                ),
                gapH20,
                //Component 4

                gapH20,
                //Component 5
                SizedBox(
                  height: 159,
                  width: context.width * 1,
                  child: Stack(children: [
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        padding: padA20,
                        height: 150,
                        width: context.width * 1,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 2,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(
                                          Assets.auctionImagesVerified),
                                      gapW5,
                                      Text(
                                        "documented".tr,
                                        style: auctionMediumPrimaryTextStyle,
                                      ),
                                    ],
                                  ),
                                  gapH5,
                                  const Text(
                                    "مربط النايفة",
                                    style: auctionMediumOnyxTextStyle,
                                  ),
                                  Text(homeModel.owner,
                                      style: auctionDescriptionTextStyle),
                                ],
                              ),
                            ),
                            Expanded(
                                flex: 3,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              "sales".tr,
                                              style:
                                                  auctionDescriptionTextStyle,
                                            ),
                                            gapH5,
                                            RichText(
                                              text: TextSpan(
                                                style:
                                                    auctionDescriptionBoldTextStyle,
                                                children: <TextSpan>[
                                                  TextSpan(
                                                    text: homeModel.sales,
                                                  ),
                                                  TextSpan(
                                                    text: " ",
                                                  ),
                                                  TextSpan(text: 'horses'.tr),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              "ratings".tr,
                                              style:
                                                  auctionDescriptionTextStyle,
                                            ),
                                            gapH5,
                                            RichText(
                                              text: TextSpan(
                                                style:
                                                    auctionDescriptionBoldTextStyle,
                                                children: <TextSpan>[
                                                  TextSpan(
                                                    text: homeModel.rating
                                                        .toString(),
                                                  ),
                                                  TextSpan(
                                                    text: " ",
                                                  ),
                                                  TextSpan(text: 'rating'.tr),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Directionality(
                                      textDirection: TextDirection.ltr,
                                      child: RatingBar(
                                          initialRating: 3,
                                          direction: Axis.horizontal,
                                          allowHalfRating: true,
                                          itemCount: 4,
                                          onRatingUpdate: (rating) {
                                            log(rating.toString());
                                          },
                                          itemSize: 45,
                                          ratingWidget: RatingWidget(
                                            full: const Icon(
                                              Icons.star_sharp,
                                              color: cPrimaryColor,
                                            ),
                                            half: const Icon(
                                              Icons.star_half_sharp,
                                              color: cPrimaryColor,
                                            ),
                                            empty: const Icon(
                                              Icons.star_border_sharp,
                                              color: cPrimaryColor,
                                            ),
                                          )),
                                    ),
                                  ],
                                ))
                          ],
                        ),
                      ),
                    ),
                    Align(
                        alignment: Alignment.topRight,
                        child: Row(
                          children: [
                            gapW20,
                            Text(
                              "the seller".tr,
                              style: auctionMediumPrimaryTextStyle,
                            ),
                          ],
                        )),
                  ]),
                ),
              ],
            ),
          ),
        ));
  }
}
