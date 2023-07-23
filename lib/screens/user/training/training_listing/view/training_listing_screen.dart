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
  final ownername;

  const TrainingListingScreen(
      {Key? key, required this.id, required this.ownername})
      : super(key: key);

  @override
  State<TrainingListingScreen> createState() => _TrainingListingScreenState();
}

class _TrainingListingScreenState extends State<TrainingListingScreen> {
  TrainingListingController trainingListingController =
      Get.put(TrainingListingController());

  TextEditingController hoesebackController = TextEditingController();
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
    hoesebackController.text = '1';
    numberofShareController.text = '1';
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
          titleText: widget.ownername.toString(),
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
                : trainingListingController.myTraningListingModel.data == null
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
                                                    '${AppUrls.ImagebaseUrl}${trainingListingController.myTraningListingModel.data!.trainingImages![index].imagePath}',
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
                                          Text('${widget.ownername}',
                                              style: onyx717),
                                          Text(
                                            '${trainingListingController.myTraningListingModel.data!.region!.name}',
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
                                width: context.width * 1,
                                child: Stack(children: [
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Container(
                                      padding: padA20,
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
                                          ListView.builder(
                                            shrinkWrap: true,
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            itemCount: trainingListingController
                                                .myTraningListingModel
                                                .data!
                                                .region!
                                                .services!
                                                .length,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    "${trainingListingController.myTraningListingModel.data!.region!.services![index].name}"
                                                        .tr,
                                                    style: onyx717,
                                                  ),
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Text(
                                                        '${trainingListingController.myTraningListingModel.data!.region!.services![index].pivot!.days}',
                                                        // "الأحد - الثلاثاء - الأربعاء",
                                                        style: onyx711,
                                                      ),
                                                      gapH7,
                                                      Text(
                                                        '${trainingListingController.myTraningListingModel.data!.region!.services![index].pivot!.startTime}م - ${trainingListingController.myTraningListingModel.data!.region!.services![1].pivot!.endTime}م ',
                                                        // "${widget.jumptime}م - 5:30م",
                                                        style: onyx711,
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              );
                                            },
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
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            IntrinsicWidth(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    "number of shares".tr,
                                                    style: primary709,
                                                  ),
                                                  Container(
                                                    height: 50,
                                                    padding: padA5,
                                                    alignment: Alignment.center,
                                                    decoration: BoxDecoration(
                                                        color: cWhiteColor,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5)),
                                                    child: TextFormField(
                                                      keyboardType:
                                                          TextInputType.number,
                                                      cursorColor:
                                                          cPrimaryColor,
                                                      textAlign:
                                                          TextAlign.center,
                                                      decoration:
                                                          InputDecoration(
                                                        border:
                                                            InputBorder.none,
                                                      ),
                                                      controller:
                                                          hoesebackController,
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
                                                    TextSpan(
                                                        text:
                                                            '${trainingListingController.myTraningListingModel.data!.region!.services![0].pivot!.price}',
                                                        style: black732),
                                                    const TextSpan(text: " "),
                                                    TextSpan(
                                                        text: "riyal".tr,
                                                        style: primary712),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Flexible(
                                                child: ElevatedButton(
                                                    onPressed: () {
                                                      int month = int.parse(
                                                          hoesebackController
                                                              .value.text);
                                                      int price = int.parse(
                                                          '${trainingListingController.myTraningListingModel.data!.region!.services![0].pivot!.price}');
                                                      ;
                                                      var totalPaid =
                                                          month * price;
                                                      int userId = int.parse(
                                                          '${trainingListingController.myTraningListingModel.data!.trainerUserId}');
                                                      int hospitilityId = int.parse(
                                                          '${trainingListingController.myTraningListingModel.data!.region!.services![0].id}');
                                                      if (month == 0) {
                                                        Get.snackbar(
                                                          "notification".tr,
                                                          "no services selected to be purchased"
                                                              .tr,
                                                        );
                                                      } else {
                                                        showDialog(
                                                            context: context,
                                                            builder: (context) =>
                                                                AddAmountDialog(
                                                                  price:
                                                                      totalPaid,
                                                                  userid:
                                                                      userId,
                                                                  hospitilityid:
                                                                      hospitilityId,
                                                                  month: month,
                                                                ));
                                                      }
                                                    },
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      backgroundColor:
                                                          cPrimaryColor,
                                                      fixedSize: Size(
                                                          context.width, 40),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(7),
                                                      ),
                                                      elevation: 0.0,
                                                    ),
                                                    child: FittedBox(
                                                        child: Text(
                                                            "participation".tr,
                                                            style: black714)))),
                                          ],
                                        )
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
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            IntrinsicWidth(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    "number of shares".tr,
                                                    style: primary709,
                                                  ),
                                                  Container(
                                                    height: 50,
                                                    padding: padA5,
                                                    alignment: Alignment.center,
                                                    decoration: BoxDecoration(
                                                        color: cWhiteColor,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5)),
                                                    child: TextFormField(
                                                      keyboardType:
                                                          TextInputType.number,
                                                      cursorColor:
                                                          cPrimaryColor,
                                                      textAlign:
                                                          TextAlign.center,
                                                      decoration:
                                                          InputDecoration(
                                                              border:
                                                                  InputBorder
                                                                      .none),
                                                      controller:
                                                          numberofShareController,
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
                                                    TextSpan(
                                                        text:
                                                            '${trainingListingController.myTraningListingModel.data!.region!.services![1].pivot!.price}',
                                                        style: black732),
                                                    const TextSpan(text: " "),
                                                    TextSpan(
                                                        text: "riyal".tr,
                                                        style: primary712),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Flexible(
                                                child: ElevatedButton(
                                                    onPressed: () {
                                                      int month = int.parse(
                                                          numberofShareController
                                                              .value.text);
                                                      int price = int.parse(
                                                          '${trainingListingController.myTraningListingModel.data!.region!.services![1].pivot!.price}');
                                                      var totalPaid =
                                                          month * price;
                                                      int userId = int.parse(
                                                          '${trainingListingController.myTraningListingModel.data!.id}');
                                                      int hospitilityId = int.parse(
                                                          '${trainingListingController.myTraningListingModel.data!.region!.services![0].id}');
                                                      if (month == 0) {
                                                        Get.snackbar(
                                                          "notification".tr,
                                                          "no services selected to be purchased"
                                                              .tr,
                                                        );
                                                      } else {
                                                        showDialog(
                                                          context: context,
                                                          builder: (context) =>
                                                              AddAmountDialog(
                                                            price: totalPaid,
                                                            userid: userId,
                                                            hospitilityid:
                                                                '$hospitilityId',
                                                            month: month,
                                                          ),
                                                        );
                                                      }
                                                    },
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      backgroundColor:
                                                          cPrimaryColor,
                                                      fixedSize: Size(
                                                          context.width, 40),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(7),
                                                      ),
                                                      elevation: 0.0,
                                                    ),
                                                    child: FittedBox(
                                                        child: Text(
                                                            "participation".tr,
                                                            style: black714)))),
                                          ],
                                        )
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
