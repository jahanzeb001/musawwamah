import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:obaiah_mobile_app/models/home_model.dart';

import '../../../../../reusable_widgets/reusable_appbar.dart';
import '../../../../../utils/colors/colors.dart';
import '../../../../../utils/constants/app_urls.dart';
import '../../../../../utils/constants/custom_error.dart';
import '../../../../../utils/constants/no_data_message.dart';
import '../../../../../utils/spacing/gaps.dart';
import '../../../../../utils/spacing/padding.dart';
import '../../../../../utils/text_styles/textstyles.dart';
import '../../../home/auction_listing/components/auction_components.dart';
import '../components/training_listing_components.dart';
import '../controller/training_listing_controller.dart';

class TrainingListingScreen extends StatefulWidget {
  final int id;

  const TrainingListingScreen({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  State<TrainingListingScreen> createState() => _TrainingListingScreenState();
}

class _TrainingListingScreenState extends State<TrainingListingScreen> {
  TrainingListingController trainingListingController =
      Get.put(TrainingListingController());
  TextEditingController numberofShareController = TextEditingController();
  CarouselSliderController sliderController = CarouselSliderController();
  List sliderimg = [];
  var horseRidingsTime;
  var horseRidingeTime;
  var horseRidingDays;
  var jumpObjesticsTime;
  var jumpObjesticeTime;
  var jumpObjesticDays;

  @override
  void initState() {
    trainingListingController.getMyTraningListing(widget.id);
    super.initState();
  }

  setTimeDays() {
    // log('${widget.hoeseridingstime}');
    // horseRidingsTime = DateFormat('hh:mm:ss a')
    //     .format(DateFormat("HH:mm:ss").parse(widget.hoeseridingstime));
    // log('${horseRidingsTime}');
    // horseRidingeTime = DateFormat('hh:mm:ss a')
    //     .format(DateFormat("HH:mm:ss").parse(widget.hoeseridingetime));
    // horseRidingDays = widget.horseridingdays.replaceAll(',', '-');
    // jumpObjesticDays = widget.jumpdays.replaceAll(',', '-');
    // jumpObjesticsTime = DateFormat('hh:mm:ss a')
    //     .format(DateFormat("HH:mm:ss").parse(widget.jumpstime));
    // jumpObjesticeTime = DateFormat('hh:mm:ss a')
    //     .format(DateFormat("HH:mm:ss").parse(widget.jumpetime));
  }

  @override
  Widget build(BuildContext context) {
    final trainingListingController = Get.find<TrainingListingController>();
    return Scaffold(
      appBar: ReusableAppBar(
          titleText: widget.id.toString(),
          textStyle: primary820,
          onPressFunction: () {
            Navigator.pop(context);
          }),
      body: Obx(
        () => trainingListingController.loading.value
            ? Center(
                child: CircularProgressIndicator(
                color: cPrimaryColor,
              ))
            : trainingListingController.error.value != ""
                ? Center(
                    child: Custom_Error(
                        onpressed: () {
                          trainingListingController
                              .getMyTraningListing(widget.id);
                        },
                        error: trainingListingController.error.value),
                  )
                : trainingListingController
                            .myTraningListingModel.data?.length ==
                        0
                    ? Center(
                        child: NoDataMessage(
                        message: "No Data Found",
                      ))
                    : Container(
                        padding: padA15,
                        height: context.height * 1,
                        width: context.width * 1,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              //Component 1
                              Container(
                                padding: padA10,
                                width: context.width * 1,
                                decoration: BoxDecoration(
                                    color: cWhiteColor,
                                    borderRadius: BorderRadius.circular(10)),
                                child: SizedBox(
                                  height: 290,
                                  width: context.width * 1,
                                  child: Stack(
                                    children: [
                                      CarouselSlider.builder(
                                          controller: sliderController,
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
                                                        color: Colors.black
                                                            .withOpacity(0.1)),
                                                    bottom: BorderSide(
                                                        width: 6.0,
                                                        color: Colors.black
                                                            .withOpacity(0.1)),
                                                  ),
                                                ),
                                                child: Image.network(
                                                    '${AppUrls.ImagebaseUrl}${trainingListingController.myTraningListingModel.data![0].trainingImages![index].imagePath}',
                                                    fit: BoxFit.cover),
                                              ),
                                            );
                                          },
                                          slideTransform: const CubeTransform(),
                                          itemCount: 3),
                                      Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
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
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.white,
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text('', style: onyx717),
                                          Text(
                                            '',
                                            style: onyx717,
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
                                            "site".tr,
                                            style: primary716,
                                          ),
                                        ],
                                      )),
                                ]),
                              ),
                              gapH20,
                              //Component 3
                              SizedBox(
                                height: 179,
                                width: context.width * 1,
                                child: Stack(children: [
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Container(
                                      padding: padA20,
                                      height: 170,
                                      width: context.width * 1,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.white,
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text("horseback riding".tr,
                                                  style: onyx717),
                                              Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Text(
                                                    '',
                                                    // "الاثنين - الثلاثاء - الاربعاء",
                                                    style: onyx711,
                                                  ),
                                                  gapH7,
                                                  Text(
                                                    '',
                                                    // "${widget.hoeseridingtime}م - 8:00م",
                                                    style: onyx711,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          gapH25,
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                "jump obstacles".tr,
                                                style: onyx717,
                                              ),
                                              Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Text(
                                                    '',
                                                    // "الأحد - الثلاثاء - الأربعاء",
                                                    style: onyx711,
                                                  ),
                                                  gapH7,
                                                  Text(
                                                    '',
                                                    // "${widget.jumptime}م - 5:30م",
                                                    style: onyx711,
                                                  ),
                                                ],
                                              )
                                            ],
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
                                            "training times:".tr,
                                            style: primary716,
                                          ),
                                        ],
                                      )),
                                ]),
                              ),
                              gapH20,
                              //Component 4

                              Row(
                                children: [
                                  gapW20,
                                  Text(
                                    "horseback riding".tr,
                                    style: primary716,
                                  ),
                                ],
                              ),
                              Flex(
                                direction: Axis.vertical,
                                children: [
                                  Container(
                                    padding: padA10,
                                    width: context.width * 1,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: cCulturedWhiteColor,
                                    ),
                                    child: Column(
                                      children: [
                                        TrainingListingComponent(
                                          numberOfShares: "12",
                                          price: "100",
                                          onPressFunction: () {},
                                        ),
                                        gapH10,
                                        TrainingListingComponent(
                                          numberOfShares: "12",
                                          price: "100",
                                          onPressFunction: () {},
                                        ),
                                        gapH10,
                                        TrainingListingComponent(
                                          numberOfShares: "100",
                                          price: "12",
                                          onPressFunction: () {},
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              gapH20,
                              //Component 5
                              Row(
                                children: [
                                  gapW20,
                                  Text(
                                    "jump obstacles".tr,
                                    style: primary716,
                                  ),
                                ],
                              ),
                              Flex(
                                direction: Axis.vertical,
                                children: [
                                  Container(
                                    padding: padA10,
                                    width: context.width * 1,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: cCulturedWhiteColor,
                                    ),
                                    child: Column(
                                      children: [
                                        TrainingListingComponent(
                                          numberOfShares: "12",
                                          price: "12",
                                          onPressFunction: () {},
                                        ),
                                        gapH10,
                                        TrainingListingComponent(
                                          numberOfShares: "12",
                                          price: "100",
                                          onPressFunction: () {},
                                        ),
                                        gapH10,
                                        TrainingListingComponent(
                                          numberOfShares: "12",
                                          price: "100",
                                          onPressFunction: () {},
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              gapH20,
                              gapH20,
                            ],
                          ),
                        ),
                      ),
      ),
    );
  }
}
