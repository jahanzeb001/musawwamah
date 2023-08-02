import 'dart:async';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:obaiah_mobile_app/generated/assets.dart';
import 'package:obaiah_mobile_app/reusable_widgets/reusable_appbar.dart';
import 'package:obaiah_mobile_app/reusable_widgets/reusable_button.dart';
import 'package:obaiah_mobile_app/utils/colors/colors.dart';
import 'package:obaiah_mobile_app/utils/constants/app_urls.dart';
import 'package:obaiah_mobile_app/utils/constants/custom_error.dart';
import 'package:obaiah_mobile_app/utils/constants/no_data_message.dart';
import 'package:obaiah_mobile_app/utils/spacing/gaps.dart';
import 'package:obaiah_mobile_app/utils/spacing/padding.dart';
import 'package:obaiah_mobile_app/utils/text_styles/textstyles.dart';

import '../../../../../Calendar/calendar_client.dart';
import '../../../../../reusable_widgets/reusable_alertDialog.dart';
import '../../../settings/wallet_portfolio/controller/wallet_portfolio_controller.dart';
import '../components/auction_components.dart';
import '../controller/auction_controller.dart';
import 'package:intl/intl.dart' as intl;

class AuctionListingScreenView extends StatefulWidget {
  int? horseId;
  List<String>? images;
  String? remainingTime;

  AuctionListingScreenView(
      {Key? key, this.horseId, this.images, this.remainingTime})
      : super(key: key);

  @override
  State<AuctionListingScreenView> createState() =>
      _AuctionListingScreenViewState();
}

class _AuctionListingScreenViewState extends State<AuctionListingScreenView> {
  final auctionListingController = Get.find<AuctionController>();
  final walletPortfolioController = Get.put(WalletPortfolioController());
  Timer? _timer;
  Duration? _remainingTime;

  //Duration? formattedTime;

  @override
  void initState() {
    walletPortfolioController.getUserId();
    auctionListingController.getUserData();
    walletPortfolioController.getMyWallet(walletPortfolioController.userId!);
    auctionListingController.loading2.value = true;
    auctionListingController.addBiddingHorse(widget.horseId!);
    _remainingTime = _parseRemainingTime(widget.remainingTime);

    // initializeDateFormatting("ar_SA", "en_PK").then((_) {
    //   // DateTime currentTime = DateTime.now().toUtc().add(Duration(hours: 3)); // Adjust for Saudi Arabia time zone
    //   DateTime target = DateTime.now().toUtc().add(Duration(hours: 3));
    //   print(target);
    //  setState(() {
    //    _remainingTime = target
    //        .difference(DateTime.now())
    //        .toString()
    //        .split('.')[0] as Duration?;
    //  });
    //  print(_remainingTime);
    //   //String formattedTime = DateFormat('HH:mm:ss', 'en_PK').format(currentTime);
    // });
    _startTimer();
    super.initState();
  }

  // Duration? _timeParsing(String s){
  //   initializeDateFormatting("ar_SA", "en_PK").then((_) {
  //     // DateTime currentTime = DateTime.now().toUtc().add(Duration(hours: 3)); // Adjust for Saudi Arabia time zone
  //     DateTime target = DateTime.now().toUtc().add(Duration(hours: 3));
  //     print(target);
  //     _remainingTime = target
  //         .difference(DateTime.now())
  //         .toString()
  //         .split('.')[0] as Duration?;
  //     //String formattedTime = DateFormat('HH:mm:ss', 'en_PK').format(currentTime);
  //   });
  //   return _remainingTime;
  // }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingTime!.inSeconds <= 0) {
          _remainingTime = _remainingTime! - Duration(seconds: 1);
        } else {
          _timer!.cancel();
        }
      });
    });
  }

  var startTime;
  var endTime;
  var startdate;
  var servicetitle;

  // Duration _parseRemainingTime(String remainingTimeString) {
  //   final parts = remainingTimeString.split(':');
  //   final hours = int.parse(parts[0]);
  //   final minutes = int.parse(parts[1]);
  //   final seconds = int.parse(parts[2]);
  //   return Duration(hours: hours, minutes: minutes, seconds: seconds);
  // }

  Duration _parseRemainingTime(String? remainingTimeString) {
    if (remainingTimeString!.isEmpty) {
      throw ArgumentError('Invalid remainingTimeString: $remainingTimeString');
    }

    final parts = remainingTimeString.split(':');

    if (parts.length != 3) {
      throw ArgumentError(
          'Invalid remainingTimeString format: $remainingTimeString');
    }

    try {
      final hours = int.parse(parts[0]);
      final minutes = int.parse(parts[1]);
      final seconds = int.parse(parts[2]);
      return Duration(hours: hours, minutes: minutes, seconds: seconds);
    } catch (e) {
      throw FormatException(
          'Invalid number format in remainingTimeString: $remainingTimeString');
    }
  }

  String _formatTime(Duration duration) {
    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(60);
    final seconds = duration.inSeconds.remainder(60);
    return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    var data = auctionListingController.addBidingHorseModel.data;
    // String inputDate = auctionListingController
    //     .addBidingHorseModel.autioninfo!.auctionDate
    //     .toString();
    // DateTime dateTime = DateTime.parse(inputDate);
    // String formattedDate = DateFormat('yyyy-MM-dd').format(dateTime);
    return Scaffold(
        appBar: ReusableAppBar(
          onPressFunction: () {},
          titleText: "bid the best",
          textStyle: onyx520,
        ),
        body: Obx(() => auctionListingController.loading2.value
            ? Center(
                child: CircularProgressIndicator(
                color: cPrimaryColor,
              ))
            : auctionListingController.error2.value != ""
                ? Center(
                    child: Custom_Error(
                        onpressed: () {
                          auctionListingController
                              .addBiddingHorse(widget.horseId!);
                        },
                        error: auctionListingController.error2.value),
                  )
                : auctionListingController.addBidingHorseModel.data == null
                    ? Center(child: NoDataMessage(message: "No Data Found"))
                    : Container(
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
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            children: [
                                              Text(
                                                "highest bid".tr,
                                                style: const TextStyle(
                                                    fontFamily: "Tajawal",
                                                    color: cRomanSilverColor,
                                                    fontSize: 10,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                              auctionListingController
                                                          .addBidingHorseModel
                                                          .highestbid!
                                                          .amount ==
                                                      ""
                                                  ? Text(
                                                      "No Bid Yet",
                                                      style: const TextStyle(
                                                          fontFamily: "Tajawal",
                                                          color:
                                                              cRomanSilverColor,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize: 10),
                                                    )
                                                  : Text(
                                                      auctionListingController
                                                          .addBidingHorseModel
                                                          .highestbid!
                                                          .amount
                                                          .toString(),
                                                      style: const TextStyle(
                                                          fontFamily: "Tajawal",
                                                          color:
                                                              cRomanSilverColor,
                                                          fontSize: 10,
                                                          fontWeight:
                                                              FontWeight.w700),
                                                    ),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              Text(
                                                "the remaining time".tr,
                                                style: const TextStyle(
                                                    fontFamily: "Tajawal",
                                                    color: cRomanSilverColor,
                                                    fontSize: 10,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Text(
                                                    // "$formattedTime",
                                                    _formatTime(
                                                        _remainingTime!),
                                                    style: const TextStyle(
                                                        fontFamily: "Tajawal",
                                                        color:
                                                            cRomanSilverColor,
                                                        fontSize: 10,
                                                        fontWeight:
                                                            FontWeight.w900),
                                                  ),
                                                  Text(
                                                    "hour".tr,
                                                    style: const TextStyle(
                                                        fontFamily: "Tajawal",
                                                        color:
                                                            cRomanSilverColor,
                                                        fontSize: 10,
                                                        fontWeight:
                                                            FontWeight.w900),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    gapH10,
                                    SizedBox(
                                      height: 290,
                                      width: context.width * 1,
                                      child: Stack(
                                        children: [
                                          CarouselSlider.builder(
                                              controller:
                                                  auctionListingController
                                                      .sliderController,
                                              unlimitedMode: true,
                                              slideBuilder: (index) {
                                                return ClipPath(
                                                  clipper: const ShapeBorderClipper(
                                                      shape: RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          20)))),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      border: Border(
                                                        right: BorderSide(
                                                            width: 10.0,
                                                            color: Colors.black
                                                                .withOpacity(
                                                                    0.1)),
                                                        bottom: BorderSide(
                                                            width: 10.0,
                                                            color: Colors.black
                                                                .withOpacity(
                                                                    0.1)),
                                                      ),
                                                    ),
                                                    child: Image.network(
                                                        widget.images![index],
                                                        fit: BoxFit.cover),
                                                  ),
                                                );
                                              },
                                              slideTransform:
                                                  const CubeTransform(),
                                              itemCount: widget.images!.length),
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
                                    )
                                  ],
                                ),
                              ),
                              gapH10,
                              //   //Component 2
                              // Obx(() {
                              //   return CupertinoSwitch(
                              //     value: auctionListingController
                              //         .isAuctionComingSoon.value,
                              //     onChanged: (value) {
                              //       auctionListingController
                              //           .toggleAuctionForFuture(
                              //               toggleValue: value);
                              //     },
                              //     thumbColor: auctionListingController
                              //             .isAuctionComingSoon.value
                              //         ? cWhiteColor
                              //         : cBlackColor,
                              //     activeColor: cPrimaryColor,
                              //     trackColor: cWhiteColor,
                              //   );
                              // }),
                              Obx(
                                () => auctionListingController
                                        .isAuctionComingSoon.value
                                    ? Container(
                                        padding: padA10,
                                        width: context.width * 1,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: cGhostWhiteColor),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            gapH10,
                                            Container(
                                              color: cGhostWhiteColor,
                                              height: 70,
                                              child: Stack(children: [
                                                Align(
                                                  alignment:
                                                      Alignment.bottomCenter,
                                                  child: Container(
                                                    alignment: Alignment.center,
                                                    width: context.width * 1,
                                                    height: 65,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      color: Colors.white,
                                                    ),
                                                    child: Text(
                                                      auctionListingController
                                                          .auctionDate,
                                                      style: onyx928,
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
                                                          "auction starts after:"
                                                              .tr,
                                                          style:
                                                              auctionSmallTextStyle,
                                                        ),
                                                      ],
                                                    )),
                                              ]),
                                            ),
                                            gapH25,
                                            Container(
                                              color: cGhostWhiteColor,
                                              height: 70,
                                              child: Stack(children: [
                                                Align(
                                                  alignment:
                                                      Alignment.bottomCenter,
                                                  child: Container(
                                                    alignment: Alignment.center,
                                                    height: 65,
                                                    width: context.width * 1,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      color: Colors.white,
                                                    ),
                                                    child: Text(
                                                      // "$formattedTime",
                                                      _formatTime(
                                                          _remainingTime!),
                                                      style: onyx928,
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
                                                          "the remaining time"
                                                              .tr,
                                                          style:
                                                              auctionSmallTextStyle,
                                                        ),
                                                      ],
                                                    )),
                                              ]),
                                            ),
                                            gapH25,
                                            ElevatedButton(
                                              onPressed: () {
                                                var start = startTime;
                                                var end = endTime;
                                                var adate = startdate;
                                                var title = servicetitle;

                                                DateTime sdate =
                                                    intl.DateFormat.jm()
                                                        .parse(start);
                                                DateTime edate =
                                                    intl.DateFormat.jm()
                                                        .parse(end);
                                                final dateFormat =
                                                    intl.DateFormat.yMd()
                                                        .parse(adate);
                                                var actualdate =
                                                    intl.DateFormat("yyyyddMM")
                                                        .format(dateFormat);
                                                var actualstime =
                                                    intl.DateFormat("HH:mmss")
                                                        .format(sdate);
                                                var actual1 = actualstime
                                                    .toString()
                                                    .replaceAll(':', '');
                                                var actualetime =
                                                    intl.DateFormat("HH:mmss")
                                                        .format(edate);
                                                var actual2 = actualetime
                                                    .toString()
                                                    .replaceAll(':', '');
                                                var conformsdate =
                                                    '${actualdate}T${actual1}0ZUTC+05:00';
                                                var conformedate =
                                                    '${actualdate}T${actual2}0ZUTC+05:00';

                                                print(
                                                    '${actualdate}T${actualstime}0ZUTC+03:00');
                                                print(
                                                    '${actualdate}T${actualetime}0ZUTC+03:00');
                                                CalendarClient().insert(
                                                  title,
                                                  conformsdate,
                                                  conformedate,
                                                );
                                                // Get.snackbar(
                                                //     "notification".tr,
                                                //     "you will be notified about this auction"
                                                //         .tr);
                                              },
                                              style: ElevatedButton.styleFrom(
                                                  fixedSize: Size(
                                                      context.width * 1, 55),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                  ),
                                                  elevation: 0.0,
                                                  backgroundColor:
                                                      cPrimaryColor),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  FittedBox(
                                                    child: Text(
                                                        "reminds me of an auction"
                                                            .tr,
                                                        style:
                                                            auctionMediumOnyxTextStyle),
                                                  ),
                                                  gapW5,
                                                  const Icon(
                                                    Icons
                                                        .notifications_active_rounded,
                                                    color: cOnyxColor,
                                                    size: 20,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    : Container(
                                        padding: padA10,
                                        width: context.width * 1,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: cGhostWhiteColor),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            gapH10,
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: Container(
                                                    color: cGhostWhiteColor,
                                                    height: 70,
                                                    child: Stack(children: [
                                                      Align(
                                                        alignment: Alignment
                                                            .bottomCenter,
                                                        child: Container(
                                                          height: 65,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                            color: Colors.white,
                                                          ),
                                                          child: auctionListingController
                                                                      .addBidingHorseModel
                                                                      .highestbid!
                                                                      .amount ==
                                                                  ""
                                                              ? Padding(
                                                                  padding: const EdgeInsets
                                                                          .only(
                                                                      left: 30,
                                                                      right:
                                                                          30),
                                                                  child: Center(
                                                                    child: Text(
                                                                      "No Bid Yet",
                                                                      style: const TextStyle(
                                                                          fontFamily:
                                                                              "Tajawal",
                                                                          color:
                                                                              cRomanSilverColor,
                                                                          fontWeight: FontWeight
                                                                              .w400,
                                                                          fontSize:
                                                                              10),
                                                                    ),
                                                                  ),
                                                                )
                                                              : Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Text(
                                                                      auctionListingController
                                                                          .addBidingHorseModel
                                                                          .highestbid!
                                                                          .amount
                                                                          .toString(),
                                                                      style:
                                                                          auctionLargeTextStyle,
                                                                    ),
                                                                    gapW5,
                                                                    Text(
                                                                      "riyal"
                                                                          .tr,
                                                                      style:
                                                                          auctionLargeTextStyle,
                                                                    ),
                                                                  ],
                                                                ),
                                                        ),
                                                      ),
                                                      Align(
                                                          alignment: Alignment
                                                              .topRight,
                                                          child: Row(
                                                            children: [
                                                              gapW20,
                                                              Text(
                                                                "highest bid"
                                                                    .tr,
                                                                style:
                                                                    auctionSmallTextStyle,
                                                              ),
                                                            ],
                                                          )),
                                                    ]),
                                                  ),
                                                ),
                                                gapW10,
                                                Expanded(
                                                  child: Container(
                                                    color: cGhostWhiteColor,
                                                    height: 70,
                                                    child: Stack(children: [
                                                      Align(
                                                        alignment: Alignment
                                                            .bottomCenter,
                                                        child: Container(
                                                          height: 65,
                                                          width:
                                                              context.width * 1,
                                                          alignment:
                                                              Alignment.center,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                            color: Colors.white,
                                                          ),
                                                          child: Text(
                                                            // "$formattedTime",
                                                            _formatTime(
                                                                _remainingTime!),
                                                            style:
                                                                auctionLargeTextStyle,
                                                          ),
                                                        ),
                                                      ),
                                                      Align(
                                                          alignment: Alignment
                                                              .topRight,
                                                          child: Row(
                                                            children: [
                                                              gapW20,
                                                              Text(
                                                                "the remaining time"
                                                                    .tr,
                                                                style:
                                                                    auctionSmallTextStyle,
                                                              ),
                                                            ],
                                                          )),
                                                    ]),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            gapH10,
                                            OutlinedButton(
                                              onPressed: () {
                                                var userbalance = int.parse(
                                                  walletPortfolioController
                                                      .myWalletModel
                                                      .accountBalance
                                                      .toString(),
                                                );
                                                log(userbalance.toString());

                                                userbalance > 500
                                                    ? showDialog(
                                                        context: context,
                                                        builder: (context) {
                                                          return AlertDialog(
                                                            scrollable: true,
                                                            backgroundColor:
                                                                cScaffoldBackground,
                                                            contentPadding:
                                                                const EdgeInsets
                                                                        .symmetric(
                                                                    vertical:
                                                                        10,
                                                                    horizontal:
                                                                        10),
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                            ),
                                                            content: Container(
                                                              width: 330,
                                                              decoration:
                                                                  const BoxDecoration(
                                                                      color:
                                                                          cScaffoldBackground),
                                                              child: Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .center,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceEvenly,
                                                                children: <
                                                                    Widget>[
                                                                  Container(
                                                                    height: 70,
                                                                    padding:
                                                                        padA10,
                                                                    decoration: const BoxDecoration(
                                                                        color:
                                                                            cWhiteColor,
                                                                        borderRadius:
                                                                            BorderRadius.all(Radius.circular(10))),
                                                                    child:
                                                                        TextField(
                                                                      keyboardType:
                                                                          TextInputType
                                                                              .number,
                                                                      controller:
                                                                          auctionListingController
                                                                              .addInsuranceController,
                                                                      decoration:
                                                                          InputDecoration(
                                                                        filled:
                                                                            true,
                                                                        fillColor:
                                                                            Colors.white,
                                                                        border:
                                                                            OutlineInputBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(10.0),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  gapH20,
                                                                  ReusableOutlineUnfixedButton(
                                                                    width: 200,
                                                                    height: 50,
                                                                    stringText:
                                                                        "add amount",
                                                                    radius: 10,
                                                                    onPressFunction:
                                                                        () {
                                                                      Navigator.pop(
                                                                          context);
                                                                      var hhid = int.parse(widget
                                                                          .horseId
                                                                          .toString());
                                                                      var uid = int.parse(auctionListingController
                                                                          .addBidingHorseModel
                                                                          .data!
                                                                          .userId
                                                                          .toString());
                                                                      var amount = int.parse(auctionListingController
                                                                          .addInsuranceController
                                                                          .text);

                                                                      auctionListingController.addBid(
                                                                          hhid,
                                                                          uid,
                                                                          amount,
                                                                          context);
                                                                    },
                                                                  ),
                                                                  gapH20,
                                                                  ElevatedButton(
                                                                      onPressed:
                                                                          () {
                                                                        Navigator.pop(
                                                                            context);
                                                                      },
                                                                      style: ElevatedButton.styleFrom(
                                                                          backgroundColor:
                                                                              cRomanSilverColor,
                                                                          shape:
                                                                              const StadiumBorder()),
                                                                      child:
                                                                          Text(
                                                                        "cancel"
                                                                            .tr,
                                                                        style:
                                                                            auctionDescriptionBoldTextStyle,
                                                                      ))
                                                                ],
                                                              ),
                                                            ),
                                                          );
                                                        })
                                                    : showDialog(
                                                        context: context,
                                                        builder: (BuildContext
                                                            context) {
                                                          return InsuranceConfirmationDialog(
                                                            onPressFunction:
                                                                () {
                                                              showDialog(
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (BuildContext
                                                                          context) {
                                                                    return BidAdditionDialog(
                                                                      onPressFunction:
                                                                          () {
                                                                        auctionListingController.addInsurance(
                                                                            auctionListingController.userId ??
                                                                                0,
                                                                            int.parse(auctionListingController.addInsuranceController.text));
                                                                        showDialog(
                                                                            context:
                                                                                context,
                                                                            builder:
                                                                                (BuildContext context) {
                                                                              return BidAmountPaymentDialog(
                                                                                onPressFunction: () {},
                                                                              );
                                                                            });
                                                                      },
                                                                    );
                                                                  });
                                                            },
                                                          );
                                                        });
                                              },
                                              style: ElevatedButton.styleFrom(
                                                shadowColor: cPrimaryColor,
                                                foregroundColor: cPrimaryColor,
                                                fixedSize: const Size(200, 35),
                                                side: const BorderSide(
                                                    color: cBlackColor),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                elevation: 0.0,
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  const Icon(
                                                    Icons.add,
                                                    color: cBlackColor,
                                                    size: 20,
                                                  ),
                                                  gapW5,
                                                  Text("add bid".tr,
                                                      style:
                                                          auctionMediumOnyxTextStyle),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                              ),

                              gapH10,
                              //Component 3
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
                                        borderRadius: BorderRadius.circular(10),
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
                                              mainAxisSize: MainAxisSize.min,
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
                                                    auctionListingController
                                                            .addBidingHorseModel
                                                            .data
                                                            ?.type ??
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
                                                      auctionListingController
                                                              .addBidingHorseModel
                                                              .data
                                                              ?.color ??
                                                          "",
                                                      style:
                                                          auctionValueTextStyle),
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
                                                    style:
                                                        auctionHeadingTextStyle,
                                                  ),
                                                ),
                                                gapH5,
                                                Expanded(
                                                  child: Text(
                                                    auctionListingController
                                                            .addBidingHorseModel
                                                            .data
                                                            ?.nameOfHorse ??
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
                                                      auctionListingController
                                                              .addBidingHorseModel
                                                              .data
                                                              ?.height ??
                                                          0.toString(),
                                                      style:
                                                          auctionValueTextStyle),
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
                                                    style:
                                                        auctionHeadingTextStyle,
                                                  ),
                                                ),
                                                gapH5,
                                                Expanded(
                                                  child: Text(
                                                    auctionListingController
                                                            .addBidingHorseModel
                                                            .data
                                                            ?.age ??
                                                        "",
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
                                                      auctionListingController
                                                              .addBidingHorseModel
                                                              .data
                                                              ?.casuality ??
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
                              //Component 4
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.center,
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
                                            // decoration: const BoxDecoration(
                                            //   border: Border(
                                            //     right: BorderSide(
                                            //         width: 2.0, color: cPrimaryColor),
                                            //     bottom: BorderSide(
                                            //         width: 2.0, color: cPrimaryColor),
                                            //   ),
                                            // ),
                                            child: Image.network(
                                                "${AppUrls.ImagebaseUrl}${auctionListingController.addBidingHorseModel.opinion!.userpicture}",
                                                fit: BoxFit.cover),
                                          ),
                                        ),
                                        gapH10,
                                        Text(
                                          auctionListingController
                                                  .addBidingHorseModel
                                                  .opinion!
                                                  .userId ??
                                              "",
                                          style:
                                              auctionDescriptionPrimaryTextStyle,
                                        ),

                                        // Text(
                                        //   auctionListingController
                                        //           .addBidingHorseModel
                                        //           .data
                                        //           ?.type ??
                                        //       "",
                                        //   style: auctionDescriptionTextStyle,
                                        // ),
                                      ],
                                    ),
                                  ),
                                  gapW10,
                                  Expanded(
                                    flex: 2,
                                    child: SizedBox(
                                      height: context.isPortrait ? 150 : 100,
                                      child: InkWell(
                                        onTap: () {
                                          showDialog(
                                              context: context,
                                              builder: (context) =>
                                                  ShowDescriptionDialog(
                                                    titleText: "expert opinion",
                                                    descriptionText:
                                                        auctionListingController
                                                                .addBidingHorseModel
                                                                .opinion!
                                                                .description ??
                                                            "",
                                                  ));
                                        },
                                        child: Stack(children: [
                                          Align(
                                            alignment: Alignment.bottomCenter,
                                            child: Container(
                                              padding: padA20,
                                              height:
                                                  context.isPortrait ? 141 : 91,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: Colors.white,
                                              ),
                                              child: Text(
                                                auctionListingController
                                                        .addBidingHorseModel
                                                        .opinion!
                                                        .description ??
                                                    "",
                                                maxLines:
                                                    context.isPortrait ? 8 : 5,
                                                softWrap: true,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.justify,
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
                                        borderRadius: BorderRadius.circular(10),
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
                                              mainAxisSize: MainAxisSize.min,
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
                                                    auctionListingController
                                                            .addBidingHorseModel
                                                            .data
                                                            ?.type ??
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
                                                      auctionListingController
                                                              .addBidingHorseModel
                                                              .data
                                                              ?.color ??
                                                          "",
                                                      style:
                                                          auctionValueTextStyle),
                                                ),
                                                gapH25,
                                                //Repeat
                                                Expanded(
                                                  child: Text(
                                                    "name of the father".tr,
                                                    style:
                                                        auctionHeadingTextStyle,
                                                  ),
                                                ),
                                                gapH5,
                                                Expanded(
                                                  child: Text(
                                                    auctionListingController
                                                            .addBidingHorseModel
                                                            .data
                                                            ?.fathersName ??
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
                                                      auctionListingController
                                                              .addBidingHorseModel
                                                              .data
                                                              ?.mothersName ??
                                                          "",
                                                      style:
                                                          auctionValueTextStyle),
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
                                                    style:
                                                        auctionHeadingTextStyle,
                                                  ),
                                                ),
                                                gapH5,
                                                Expanded(
                                                  child: Text(
                                                    auctionListingController
                                                            .addBidingHorseModel
                                                            .data
                                                            ?.nameOfHorse ??
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
                                                      auctionListingController
                                                              .addBidingHorseModel
                                                              .data
                                                              ?.height ??
                                                          "",
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
                                                    auctionListingController
                                                        .addBidingHorseModel
                                                        .data!
                                                        .weight
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
                                                      auctionListingController
                                                              .addBidingHorseModel
                                                              .data
                                                              ?.originality ??
                                                          "",
                                                      style:
                                                          auctionValueTextStyle),
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
                                                    style:
                                                        auctionHeadingTextStyle,
                                                  ),
                                                ),
                                                gapH5,
                                                Expanded(
                                                  child: Text(
                                                    auctionListingController
                                                            .addBidingHorseModel
                                                            .data
                                                            ?.age ??
                                                        "",
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
                                                      auctionListingController
                                                              .addBidingHorseModel
                                                              .data
                                                              ?.casuality ??
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
                                                    auctionListingController
                                                            .addBidingHorseModel
                                                            .data
                                                            ?.city ??
                                                        "",
                                                    style:
                                                        auctionValueTextStyle,
                                                  ),
                                                ),
                                                gapH25,
                                                Expanded(
                                                  child: Text(
                                                    "Did he complete his vaccinations?"
                                                        .tr,
                                                    style:
                                                        auctionHeadingTextStyle,
                                                  ),
                                                ),
                                                gapH5,
                                                Expanded(
                                                  child: Text(
                                                      auctionListingController
                                                                  .addBidingHorseModel
                                                                  .data
                                                                  ?.isVaccinated ==
                                                              '1'
                                                          ? "yes"
                                                          : "no",
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
                                            titleText: "additional description",
                                            descriptionText:
                                                auctionListingController
                                                        .addBidingHorseModel
                                                        .data
                                                        ?.additionalDescription ??
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
                                        height: context.isPortrait ? 131 : 91,
                                        width: context.width * 1,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.white,
                                        ),
                                        child: Text(
                                          auctionListingController
                                                  .addBidingHorseModel
                                                  .data
                                                  ?.additionalDescription ??
                                              "",
                                          maxLines: context.isPortrait ? 8 : 5,
                                          softWrap: true,
                                          overflow: TextOverflow.ellipsis,
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
                                        borderRadius: BorderRadius.circular(10),
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
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
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
                                                    auctionListingController
                                                            .addBidingHorseModel
                                                            .data
                                                            ?.user!
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
                                                    CrossAxisAlignment.center,
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
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
                                                              children: <
                                                                  TextSpan>[
                                                                TextSpan(
                                                                  text: auctionListingController
                                                                      .addBidingHorseModel
                                                                      .sales
                                                                      .toString(),
                                                                ),
                                                                TextSpan(
                                                                  text: " ",
                                                                ),
                                                                TextSpan(
                                                                    text:
                                                                        'horses'
                                                                            .tr),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
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
                                                              children: <
                                                                  TextSpan>[
                                                                TextSpan(
                                                                  text: auctionListingController
                                                                      .addBidingHorseModel
                                                                      .ratting
                                                                      .toString(),
                                                                ),
                                                                TextSpan(
                                                                  text: " ",
                                                                ),
                                                                TextSpan(
                                                                    text:
                                                                        'rating'
                                                                            .tr),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                  RatingBar(
                                                      initialRating: 3,
                                                      direction:
                                                          Axis.horizontal,
                                                      allowHalfRating: true,
                                                      itemCount: 4,
                                                      onRatingUpdate: (rating) {
                                                        log(rating.toString());
                                                      },
                                                      itemSize: 45,
                                                      ratingWidget:
                                                          RatingWidget(
                                                        full: const Icon(
                                                          Icons.star_sharp,
                                                          color: cPrimaryColor,
                                                        ),
                                                        half: const Icon(
                                                          Icons.star_half_sharp,
                                                          color: cPrimaryColor,
                                                        ),
                                                        empty: const Icon(
                                                          Icons
                                                              .star_border_sharp,
                                                          color: cPrimaryColor,
                                                        ),
                                                      )),
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
                            ],
                          ),
                        ),
                      )));
  }
}
