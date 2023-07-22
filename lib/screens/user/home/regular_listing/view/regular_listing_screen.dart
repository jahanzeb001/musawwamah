// ignore_for_file: must_be_immutable

import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:obaiah_mobile_app/reusable_widgets/reusable_text.dart';
import 'package:obaiah_mobile_app/utils/constants/constants.dart';
import 'package:obaiah_mobile_app/utils/constants/custom_error.dart';
import 'package:obaiah_mobile_app/utils/constants/no_data_message.dart';

import '../../../../../generated/assets.dart';
import '../../../../../reusable_widgets/reusable_appbar.dart';
import '../../../../../utils/colors/colors.dart';
import '../../../../../utils/constants/app_urls.dart';
import '../../../../../utils/spacing/gaps.dart';
import '../../../../../utils/spacing/padding.dart';
import '../../../../../utils/text_styles/textstyles.dart';
import '../../../../../reusable_widgets/reusable_alertDialog.dart';
import '../components/regular_listing_components.dart';
import '../controller/listing_controller.dart';

class RegularListingScreen extends StatefulWidget {
  //final HomeModel homePageModel;
  int? horseId;
  String? horseName;

  RegularListingScreen({Key? key, this.horseId, this.horseName})
      : super(key: key);

  @override
  State<RegularListingScreen> createState() => _RegularListingScreenState();
}

class _RegularListingScreenState extends State<RegularListingScreen> {
  final regularListingController = Get.find<RegularListingController>();

  @override
  void initState() {
    loadData();
    // TODO: implement initState
    super.initState();
  }

  loadData() async {
    regularListingController.loadingHorseDetails.value = true;
    await Future.delayed(Duration(seconds: 1));
    regularListingController.getHorseDetails(widget.horseId ?? 0);
  }

  @override
  Widget build(BuildContext context) {
    print("************************${widget.horseId}");

    return Scaffold(
        appBar: ReusableAppBar(
            onPressFunction: () {
              Navigator.pop(context);
            },
            titleText: widget.horseName ?? "",
            textStyle: const TextStyle(
                fontFamily: "Tajawal",
                color: cPrimaryColor,
                fontSize: 20,
                fontWeight: FontWeight.w900)),
        body: Obx(
          () => regularListingController.loadingHorseDetails.value
              ? Center(
                  child: CircularProgressIndicator(
                  color: cPrimaryColor,
                ))
              : regularListingController.errorLoadingHorseDetails.value != ""
                  ? Center(
                      child: Custom_Error(
                          onpressed: () {
                            regularListingController
                                .getHorseDetails(widget.horseId ?? 0);
                          },
                          error: regularListingController
                              .errorLoadingHorseDetails.value),
                    )
                  : regularListingController.horseDetailsModel.data == null
                      ? Center(
                          child: Center(
                              child: NoDataMessage(
                          message: "No Data Found",
                        )))
                      : Container(
                          padding: padA10,
                          child: Stack(
                            children: [
                              SingleChildScrollView(
                                child: Column(
                                  children: [
                                    //Component 1
                                    Container(
                                      padding: padA10,
                                      width: context.width * 1,
                                      decoration: BoxDecoration(
                                          color: cWhiteColor,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: SizedBox(
                                        height: 290,
                                        width: context.width * 1,
                                        child: Stack(
                                          children: [
                                            CarouselSlider.builder(
                                                controller:
                                                    regularListingController
                                                        .sliderController,
                                                unlimitedMode: true,
                                                slideBuilder: (index) {
                                                  return ClipPath(
                                                    clipper: const ShapeBorderClipper(
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius.all(
                                                                    Radius.circular(
                                                                        10)))),
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        border: Border(
                                                          right: BorderSide(
                                                              width: 6.0,
                                                              color: Colors
                                                                  .black
                                                                  .withOpacity(
                                                                      0.1)),
                                                          bottom: BorderSide(
                                                              width: 6.0,
                                                              color: Colors
                                                                  .black
                                                                  .withOpacity(
                                                                      0.1)),
                                                        ),
                                                      ),
                                                      child:
                                                          // CachedNetworkImage(
                                                          //   imageUrl:
                                                          //       "${AppUrls.ImagebaseUrl}${regularListingController.images[index].toString()}",
                                                          //   imageBuilder: (context,
                                                          //           imageProvider) =>
                                                          //       Container(
                                                          //     decoration:
                                                          //         BoxDecoration(
                                                          //       image:
                                                          //           DecorationImage(
                                                          //         //image size fill
                                                          //         image:
                                                          //             imageProvider,
                                                          //         fit: BoxFit.cover,
                                                          //       ),
                                                          //     ),
                                                          //   ),
                                                          //   placeholder:
                                                          //       (context, url) =>
                                                          //           Container(
                                                          //     alignment:
                                                          //         Alignment.center,
                                                          //     child:
                                                          //         CircularProgressIndicator(
                                                          //       color:
                                                          //           cPrimaryColor,
                                                          //     ), // you can add pre loader iamge as well to show loading.
                                                          //   ), //show progress  while loading image
                                                          //   errorWidget: (context,
                                                          //           url, error) =>
                                                          //       Container(
                                                          //     alignment:
                                                          //         Alignment.center,
                                                          //     child:
                                                          //         CircularProgressIndicator(
                                                          //       color:
                                                          //           cPrimaryColor,
                                                          //     ), // you can add pre loader iamge as well to show loading.
                                                          //   ), //s
                                                          //   //show no iamge availalbe image on error laoding
                                                          // ),

                                                          Image.network(
                                                              regularListingController
                                                                  .images[index]
                                                                  .toString(),
                                                              fit:
                                                                  BoxFit.cover),
                                                    ),
                                                  );
                                                },
                                                slideTransform:
                                                    const CubeTransform(),
                                                itemCount:
                                                    regularListingController
                                                        .images.length),
                                            Align(
                                              alignment: Alignment.bottomCenter,
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: const [
                                                      ImageSliderComponent(),
                                                      gapW5,
                                                      ImageSliderComponent(),
                                                      gapW5,
                                                      ImageSliderComponent(),
                                                    ],
                                                  ),
                                                  gapH15,
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    gapH10,
//Component 2

                                    SizedBox(
                                      height: 164,
                                      width: context.width * 1,
                                      child: Stack(children: [
                                        Align(
                                          alignment: Alignment.bottomCenter,
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 20, horizontal: 5),
                                            height: 155,
                                            width: context.width * 1,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: Colors.white,
                                            ),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Expanded(
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Expanded(
                                                        child: Text(
                                                          "type".tr,
                                                          style:
                                                              auctionHeadingTextStyle,
                                                        ),
                                                      ),
                                                      gapH5,
                                                      Expanded(
                                                        child: Text(
                                                          regularListingController
                                                                  .horseDetailsModel
                                                                  .data!
                                                                  .type ??
                                                              "",
                                                          style:
                                                              auctionValueTextStyle,
                                                        ),
                                                      ),
                                                      gapH25,
                                                      Expanded(
                                                        child: Text(
                                                          "color".tr,
                                                          style:
                                                              auctionHeadingTextStyle,
                                                        ),
                                                      ),
                                                      gapH5,
                                                      Expanded(
                                                        child: Text(
                                                            regularListingController
                                                                    .horseDetailsModel
                                                                    .data!
                                                                    .color ??
                                                                "",
                                                            style:
                                                                auctionValueTextStyle),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Expanded(
                                                        child: Text(
                                                          "name".tr,
                                                          style:
                                                              auctionHeadingTextStyle,
                                                        ),
                                                      ),
                                                      gapH5,
                                                      Expanded(
                                                        child: Text(
                                                          regularListingController
                                                                  .horseDetailsModel
                                                                  .data!
                                                                  .nameOfHorse ??
                                                              "",
                                                          style:
                                                              auctionValueTextStyle,
                                                        ),
                                                      ),
                                                      gapH25,
                                                      Expanded(
                                                        child: Text(
                                                          "height".tr,
                                                          style:
                                                              auctionHeadingTextStyle,
                                                        ),
                                                      ),
                                                      gapH5,
                                                      Expanded(
                                                        child: Text(
                                                            regularListingController
                                                                .horseDetailsModel
                                                                .data!
                                                                .height
                                                                .toString(),
                                                            style:
                                                                auctionValueTextStyle),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Expanded(
                                                        child: Text(
                                                          "age".tr,
                                                          style:
                                                              auctionHeadingTextStyle,
                                                        ),
                                                      ),
                                                      gapH5,
                                                      Expanded(
                                                        child: Text(
                                                          regularListingController
                                                              .horseDetailsModel
                                                              .data!
                                                              .age
                                                              .toString(),
                                                          style:
                                                              auctionValueTextStyle,
                                                        ),
                                                      ),
                                                      gapH25,
                                                      Expanded(
                                                        child: Text(
                                                          "safety".tr,
                                                          style:
                                                              auctionHeadingTextStyle,
                                                        ),
                                                      ),
                                                      gapH5,
                                                      Expanded(
                                                        child: Text(
                                                            regularListingController
                                                                    .horseDetailsModel
                                                                    .data!
                                                                    .casuality ??
                                                                "",
                                                            style:
                                                                auctionValueTextStyle),
                                                      ),
                                                    ],
                                                  ),
                                                )
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
                                                  "summary".tr,
                                                  style:
                                                      auctionMediumPrimaryTextStyle,
                                                ),
                                              ],
                                            )),
                                      ]),
                                    ),
                                    gapH20,
//Component 3
                                    SizedBox(
                                      height: 94,
                                      width: context.width * 1,
                                      child: Stack(children: [
                                        Align(
                                          alignment: Alignment.bottomCenter,
                                          child: Container(
                                            padding: padA20,
                                            height: 85,
                                            width: context.width * 1,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: Colors.white,
                                            ),
                                            child: ReUsableText(
                                                text: regularListingController
                                                        .horseDetailsModel
                                                        .data!
                                                        .totalPrice ??
                                                    "",
                                                textStyle: textStyle732Onyx),
                                          ),
                                        ),
                                        Align(
                                            alignment: Alignment.topRight,
                                            child: Row(
                                              children: [
                                                gapW20,
                                                Text(
                                                  "price".tr,
                                                  style:
                                                      auctionMediumPrimaryTextStyle,
                                                ),
                                              ],
                                            )),
                                      ]),
                                    ),
                                    gapH20,
//Component 4
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              ClipPath(
                                                clipper: const ShapeBorderClipper(
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    10)))),
                                                child: SizedBox(
                                                  // child: Container(
                                                  //   decoration: const BoxDecoration(
                                                  //     border: Border(
                                                  //       right: BorderSide(
                                                  //           width: 2.0, color: cPrimaryColor),
                                                  //       bottom: BorderSide(
                                                  //           width: 2.0, color: cPrimaryColor),
                                                  //     ),
                                                  //   ),
                                                  child: Image.asset(
                                                      Assets
                                                          .auctionImagesPersonImage,
                                                      fit: BoxFit.cover),
                                                ),
                                              ),
                                              Text(
                                                regularListingController
                                                        .horseDetailsModel
                                                        .data!
                                                        .user!
                                                        .fullname ??
                                                    "",
                                                style:
                                                    auctionDescriptionPrimaryTextStyle,
                                              ),
                                              Text(
                                                regularListingController
                                                        .horseDetailsModel
                                                        .data!
                                                        .type ??
                                                    "",
                                                style:
                                                    auctionDescriptionTextStyle,
                                              ),
                                            ],
                                          ),
                                        ),
                                        gapW10,
                                        Expanded(
                                          flex: 2,
                                          child: InkWell(
                                            onTap: () {
                                              showDialog(
                                                  context: context,
                                                  builder: (context) =>
                                                      const ShowDescriptionDialog(
                                                        titleText:
                                                            "expert opinion",
                                                        descriptionText:
                                                            "Lorem Ipsum is a virtual model that is placed in the designs to be presented to the client to visualize the method of placing texts in the designs, whether they are printed designs. Brochure or flyer, for example. or website templates. Upon the client's initial approval of the design, this text is removed from the design and the final texts are placed",
                                                      ));
                                            },
                                            child: SizedBox(
                                              height: context.isPortrait
                                                  ? 150
                                                  : 100,
                                              child: Stack(children: [
                                                Align(
                                                  alignment:
                                                      Alignment.bottomCenter,
                                                  child: Container(
                                                    padding: padA20,
                                                    height: context.isPortrait
                                                        ? 141
                                                        : 91,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      color: Colors.white,
                                                    ),
                                                    child: Text(
                                                      "Lorem Ipsum is a virtual model that is placed in the designs to be presented to the client to visualize the method of placing texts in the designs, whether they are printed designs. Brochure or flyer, for example. or website templates. Upon the client's initial approval of the design, this text is removed from the design and the final texts are placed"
                                                          .tr,
                                                      maxLines:
                                                          context.isPortrait
                                                              ? 8
                                                              : 5,
                                                      softWrap: true,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign:
                                                          TextAlign.justify,
                                                      style:
                                                          auctionDescriptionTextStyle,
                                                    ),
                                                  ),
                                                ),
                                                Align(
                                                    alignment:
                                                        Alignment.topRight,
                                                    child: Row(
                                                      children: [
                                                        gapW20,
                                                        Text(
                                                          "expert opinion".tr,
                                                          style:
                                                              auctionMediumPrimaryTextStyle,
                                                        ),
                                                      ],
                                                    )),
                                              ]),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    gapH20,
//Component 5
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
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: Colors.white,
                                            ),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Expanded(
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Expanded(
                                                        child: Text(
                                                          "type".tr,
                                                          style:
                                                              auctionHeadingTextStyle,
                                                        ),
                                                      ),
                                                      gapH5,
                                                      Expanded(
                                                        child: Text(
                                                          regularListingController
                                                                  .horseDetailsModel
                                                                  .data!
                                                                  .type ??
                                                              "",
                                                          style:
                                                              auctionValueTextStyle,
                                                        ),
                                                      ),
                                                      gapH25,
                                                      Expanded(
                                                        child: Text(
                                                          "color".tr,
                                                          style:
                                                              auctionHeadingTextStyle,
                                                        ),
                                                      ),
                                                      gapH5,
                                                      Expanded(
                                                        child: Text(
                                                            regularListingController
                                                                    .horseDetailsModel
                                                                    .data!
                                                                    .color ??
                                                                "",
                                                            style:
                                                                auctionValueTextStyle),
                                                      ),
                                                      gapH25,
//Repeat
                                                      Expanded(
                                                        child: Text(
                                                          "name of the father"
                                                              .tr,
                                                          style:
                                                              auctionHeadingTextStyle,
                                                        ),
                                                      ),
                                                      gapH5,
                                                      Expanded(
                                                        child: Text(
                                                          regularListingController
                                                                  .horseDetailsModel
                                                                  .data!
                                                                  .fathersName ??
                                                              "",
                                                          style:
                                                              auctionValueTextStyle,
                                                        ),
                                                      ),
                                                      gapH25,
                                                      Expanded(
                                                        child: Text(
                                                          "mother name".tr,
                                                          style:
                                                              auctionHeadingTextStyle,
                                                        ),
                                                      ),
                                                      gapH5,
                                                      Expanded(
                                                        child: Text(
                                                            regularListingController
                                                                    .horseDetailsModel
                                                                    .data!
                                                                    .mothersName ??
                                                                "",
                                                            style:
                                                                auctionValueTextStyle),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Expanded(
                                                        child: Text(
                                                          "name".tr,
                                                          style:
                                                              auctionHeadingTextStyle,
                                                        ),
                                                      ),
                                                      gapH5,
                                                      Expanded(
                                                        child: Text(
                                                          regularListingController
                                                                  .horseDetailsModel
                                                                  .data!
                                                                  .nameOfHorse ??
                                                              "",
                                                          style:
                                                              auctionValueTextStyle,
                                                        ),
                                                      ),
                                                      gapH25,
                                                      Expanded(
                                                        child: Text(
                                                          "height".tr,
                                                          style:
                                                              auctionHeadingTextStyle,
                                                        ),
                                                      ),
                                                      gapH5,
                                                      Expanded(
                                                        child: Text(
                                                            regularListingController
                                                                .horseDetailsModel
                                                                .data!
                                                                .height
                                                                .toString(),
                                                            style:
                                                                auctionValueTextStyle),
                                                      ),
                                                      gapH25,
                                                      Expanded(
                                                        child: Text(
                                                          "weight".tr,
                                                          style:
                                                              auctionHeadingTextStyle,
                                                        ),
                                                      ),
                                                      gapH5,
                                                      Expanded(
                                                        child: Text(
                                                          regularListingController
                                                              .horseDetailsModel
                                                              .data!
                                                              .isSold
                                                              .toString(),
                                                          style:
                                                              auctionValueTextStyle,
                                                        ),
                                                      ),
                                                      gapH25,
                                                      Expanded(
                                                        child: Text(
                                                          "originality".tr,
                                                          style:
                                                              auctionHeadingTextStyle,
                                                        ),
                                                      ),
                                                      gapH5,
                                                      Expanded(
                                                        child: Text(
                                                            regularListingController
                                                                    .horseDetailsModel
                                                                    .data!
                                                                    .originality ??
                                                                "",
                                                            style:
                                                                auctionValueTextStyle),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Expanded(
                                                        child: Text(
                                                          "age".tr,
                                                          style:
                                                              auctionHeadingTextStyle,
                                                        ),
                                                      ),
                                                      gapH5,
                                                      Expanded(
                                                        child: Text(
                                                          regularListingController
                                                              .horseDetailsModel
                                                              .data!
                                                              .age
                                                              .toString(),
                                                          style:
                                                              auctionValueTextStyle,
                                                        ),
                                                      ),
                                                      gapH25,
                                                      Expanded(
                                                        child: Text(
                                                          "safety".tr,
                                                          style:
                                                              auctionHeadingTextStyle,
                                                        ),
                                                      ),
                                                      gapH5,
                                                      Expanded(
                                                        child: Text(
                                                            regularListingController
                                                                    .horseDetailsModel
                                                                    .data!
                                                                    .casuality ??
                                                                "",
                                                            style:
                                                                auctionValueTextStyle),
                                                      ),
                                                      gapH25,
                                                      Expanded(
                                                        child: Text(
                                                          "site".tr,
                                                          style:
                                                              auctionHeadingTextStyle,
                                                        ),
                                                      ),
                                                      gapH5,
                                                      Expanded(
                                                        child: Text(
                                                          regularListingController
                                                                  .horseDetailsModel
                                                                  .data!
                                                                  .city ??
                                                              "",
                                                          style:
                                                              auctionValueTextStyle,
                                                        ),
                                                      ),
                                                      gapH25,
                                                      Expanded(
                                                        child: Text(
                                                          "did he complete his vaccinations?"
                                                              .tr,
                                                          style:
                                                              auctionHeadingTextStyle,
                                                        ),
                                                      ),
                                                      gapH5,
                                                      Expanded(
                                                        child: Text(
                                                            regularListingController
                                                                        .horseDetailsModel
                                                                        .data!
                                                                        .isVaccinated ==
                                                                    1
                                                                ? "no"
                                                                : "yes",
                                                            style:
                                                                auctionValueTextStyle),
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
                                                  style:
                                                      auctionMediumPrimaryTextStyle,
                                                ),
                                              ],
                                            )),
                                      ]),
                                    ),
                                    gapH20,
//Component 6
                                    InkWell(
                                      onTap: () {
                                        showDialog(
                                            context: context,
                                            builder: (context) =>
                                                ShowDescriptionDialog(
                                                  titleText:
                                                      "additional description",
                                                  descriptionText:
                                                      regularListingController
                                                              .horseDetailsModel
                                                              .data!
                                                              .additionalDescription ??
                                                          "",
                                                ));
                                      },
                                      child: SizedBox(
                                        height: context.isPortrait ? 140 : 100,
                                        width: context.width * 1,
                                        child: Stack(children: [
                                          Align(
                                            alignment: Alignment.bottomCenter,
                                            child: Container(
                                              padding: padA20,
                                              height:
                                                  context.isPortrait ? 131 : 91,
                                              width: context.width * 1,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: Colors.white,
                                              ),
                                              child: Text(
                                                regularListingController
                                                        .horseDetailsModel
                                                        .data!
                                                        .additionalDescription ??
                                                    "".tr,
                                                textAlign: TextAlign.justify,
                                                maxLines:
                                                    context.isPortrait ? 8 : 5,
                                                softWrap: true,
                                                overflow: TextOverflow.ellipsis,
                                                style:
                                                    auctionDescriptionTextStyle,
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
                                                    style:
                                                        auctionMediumPrimaryTextStyle,
                                                  ),
                                                ],
                                              )),
                                        ]),
                                      ),
                                    ),
                                    gapH20,

//Component 7
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
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: Colors.white,
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Expanded(
                                                  flex: 2,
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          SvgPicture.asset(Assets
                                                              .auctionImagesVerified),
                                                          gapW5,
                                                          Text(
                                                            "documented".tr,
                                                            style:
                                                                auctionMediumPrimaryTextStyle,
                                                          ),
                                                        ],
                                                      ),
                                                      gapH5,
                                                      const Text(
                                                        "مربط النايفة",
                                                        style:
                                                            auctionMediumOnyxTextStyle,
                                                      ),
                                                      Text(
                                                          regularListingController
                                                                  .horseDetailsModel
                                                                  .data!
                                                                  .user!
                                                                  .fullname ??
                                                              "",
                                                          style:
                                                              auctionDescriptionTextStyle),
                                                    ],
                                                  ),
                                                ),
                                                Expanded(
                                                    flex: 3,
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                          children: [
                                                            Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              children: [
                                                                Text(
                                                                  "sales".tr,
                                                                  style:
                                                                      auctionDescriptionTextStyle,
                                                                ),
                                                                gapH5,
                                                                RichText(
                                                                  text:
                                                                      TextSpan(
                                                                    style:
                                                                        auctionDescriptionBoldTextStyle,
                                                                    children: <
                                                                        TextSpan>[
                                                                      TextSpan(
                                                                        text: regularListingController
                                                                            .horseDetailsModel
                                                                            .sales
                                                                            .toString(),
                                                                      ),
                                                                      TextSpan(
                                                                        text:
                                                                            " ",
                                                                      ),
                                                                      TextSpan(
                                                                          text:
                                                                              'horses'.tr),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              children: [
                                                                Text(
                                                                  "ratings".tr,
                                                                  style:
                                                                      auctionDescriptionTextStyle,
                                                                ),
                                                                gapH5,
                                                                RichText(
                                                                  text:
                                                                      TextSpan(
                                                                    style:
                                                                        auctionDescriptionBoldTextStyle,
                                                                    children: <
                                                                        TextSpan>[
                                                                      TextSpan(
                                                                        text: regularListingController
                                                                            .horseDetailsModel
                                                                            .ratting
                                                                            .toString(),
                                                                      ),
                                                                      TextSpan(
                                                                        text:
                                                                            " ",
                                                                      ),
                                                                      TextSpan(
                                                                          text:
                                                                              'rating'.tr),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                        Directionality(
                                                          textDirection:
                                                              TextDirection.ltr,
                                                          child: RatingBar(
                                                              initialRating: 3,
                                                              direction: Axis
                                                                  .horizontal,
                                                              allowHalfRating:
                                                                  true,
                                                              itemCount: 4,
                                                              onRatingUpdate:
                                                                  (rating) {
                                                                log(rating
                                                                    .toString());
                                                              },
                                                              itemSize: 45,
                                                              ratingWidget:
                                                                  RatingWidget(
                                                                full:
                                                                    const Icon(
                                                                  Icons
                                                                      .star_sharp,
                                                                  color:
                                                                      cPrimaryColor,
                                                                ),
                                                                half:
                                                                    const Icon(
                                                                  Icons
                                                                      .star_half_sharp,
                                                                  color:
                                                                      cPrimaryColor,
                                                                ),
                                                                empty:
                                                                    const Icon(
                                                                  Icons
                                                                      .star_border_sharp,
                                                                  color:
                                                                      cPrimaryColor,
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
                                                  style:
                                                      auctionMediumPrimaryTextStyle,
                                                ),
                                              ],
                                            )),
                                      ]),
                                    ),
                                    gapH80
                                  ],
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            flex: 2,
                                            child: ElevatedButton(
                                              onPressed: () {
                                                Navigator.pushNamed(
                                                    context, checkoutScreen,
                                                    arguments: {
                                                      "homePageModel":
                                                          regularListingController
                                                              .horseDetailsModel
                                                    });
                                              },
                                              style: ElevatedButton.styleFrom(
                                                  shape:
                                                      const RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      topLeft: Radius.zero,
                                                      bottomLeft: Radius.zero,
                                                      topRight:
                                                          Radius.circular(7),
                                                      bottomRight:
                                                          Radius.circular(7),
                                                    ),
                                                  ),
                                                  backgroundColor:
                                                      cPrimaryColor,
                                                  fixedSize: Size(
                                                      context.width * 1, 45)),
                                              child: Text("buy".tr),
                                            ),
                                          ),
                                          gapW2,
                                          Expanded(
                                            child: ElevatedButton(
                                              onPressed: () {
                                                regularListingController.addToFav(
                                                    regularListingController
                                                            .horseDetailsModel
                                                            .data!
                                                            .id ??
                                                        0,
                                                    regularListingController
                                                        .userId);
                                                ;
                                              },
                                              style: ElevatedButton.styleFrom(
                                                  shape:
                                                      const RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(7),
                                                      bottomLeft:
                                                          Radius.circular(7),
                                                      topRight: Radius.zero,
                                                      bottomRight: Radius.zero,
                                                    ),
                                                  ),
                                                  backgroundColor:
                                                      cRomanSilverColor,
                                                  fixedSize: Size(
                                                      context.width * 1, 45)),
                                              child: regularListingController
                                                      .loading2.value
                                                  ? Center(
                                                      child: SizedBox(
                                                        height: 25,
                                                        width: 25,
                                                        child:
                                                            CircularProgressIndicator(
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    )
                                                  : Text("favourites".tr),
                                            ),
                                          )
                                        ],
                                      ),
                                      context.isPortrait ? gapH20 : gapH10
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
        ));
  }
}

List<String> images = [
  Assets.homeImagesAdvertisingHorseRectangular,
  Assets.homeImagesAdvertisingHorseRectangular,
  Assets.homeImagesAdvertisingHorseRectangular,
];
