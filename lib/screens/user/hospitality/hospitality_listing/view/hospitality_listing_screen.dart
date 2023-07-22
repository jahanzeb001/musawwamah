import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:obaiah_mobile_app/models/home_model.dart';
import 'package:obaiah_mobile_app/utils/spacing/padding.dart';

import '../../../../../Payments/fatoorah_Custom.dart';
import '../../../../../reusable_widgets/reusable_appbar.dart';
import '../../../../../reusable_widgets/reusable_text.dart';
import '../../../../../utils/colors/colors.dart';
import '../../../../../utils/constants/app_urls.dart';
import '../../../../../utils/constants/custom_error.dart';
import '../../../../../utils/constants/no_data_message.dart';
import '../../../../../utils/spacing/gaps.dart';
import '../../../../../utils/text_styles/textstyles.dart';
import '../../../home/regular_listing/components/regular_listing_components.dart';
import '../../../home/regular_listing/view/regular_listing_screen.dart';
import '../components/hospitality_listing_components.dart';
import '../controller/hospitality_listing_controller.dart';

class HospitalityListingScreen extends StatefulWidget {
  final id;
  final ownername;

  const HospitalityListingScreen(
      {Key? key, required this.id, required this.ownername})
      : super(key: key);

  @override
  State<HospitalityListingScreen> createState() =>
      _HospitalityListingScreenState();
}

class _HospitalityListingScreenState extends State<HospitalityListingScreen> {
  CarouselSliderController sliderController = CarouselSliderController();
  HospitalityListingController hospitalityListingController =
      Get.put(HospitalityListingController());
  @override
  void initState() {
    hospitalityListingController.getMyHospitalityListing(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final hospitalityListingController =
        Get.find<HospitalityListingController>();
    return Scaffold(
      appBar: ReusableAppBar(
          titleText: widget.ownername,
          textStyle: primary820,
          onPressFunction: () {
            Navigator.pop(context);
          }),
      body: Obx(
        () => hospitalityListingController.loading.value
            ? Center(
                child: CircularProgressIndicator(
                color: cPrimaryColor,
              ))
            : hospitalityListingController.error.value != ""
                ? Center(
                    child: Custom_Error(
                        onpressed: () {
                          hospitalityListingController
                              .getMyHospitalityListing(widget.id);
                        },
                        error: hospitalityListingController.error.value),
                  )
                : hospitalityListingController.myHospitalityListingModel.data ==
                        null
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
                                                    '${AppUrls.ImagebaseUrl}${hospitalityListingController.myHospitalityListingModel.data![0].hospitalityImages![index].imagePath}',
                                                    fit: BoxFit.cover),
                                              ),
                                            );
                                          },
                                          slideTransform: const CubeTransform(),
                                          itemCount: images.length),
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
                                          Text(
                                              '${hospitalityListingController.myHospitalityListingModel.data![0].trainer!.fullname}',
                                              style: onyx717),
                                          Text(
                                            '${hospitalityListingController.myHospitalityListingModel.data![0].hospitalityRegion!.name}'
                                                .tr,
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
                                height: 164,
                                width: context.width * 1,
                                child: Stack(children: [
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 20, horizontal: 5),
                                      width: context.width * 1,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.white,
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Flexible(
                                            child: GridView.builder(
                                              shrinkWrap: true,
                                              physics:
                                                  const NeverScrollableScrollPhysics(),
                                              itemCount:
                                                  hospitalityListingController
                                                      .myHospitalityListingModel
                                                      .data![0]
                                                      .hospitalityRegion!
                                                      .hospitalityServices!
                                                      .length,
                                              gridDelegate:
                                                  SliverGridDelegateWithFixedCrossAxisCount(
                                                      crossAxisCount: 3,
                                                      crossAxisSpacing: 4.0,
                                                      mainAxisSpacing: 4.0),
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                return ServicesComponent(
                                                    serviceName:
                                                        "${hospitalityListingController.myHospitalityListingModel.data![0].hospitalityRegion!.hospitalityServices![index].name}",
                                                    isServiceAvailable:
                                                        hospitalityListingController
                                                                    .myHospitalityListingModel
                                                                    .data![0]
                                                                    .hospitalityRegion!
                                                                    .hospitalityServices![
                                                                        index]
                                                                    .pivot!
                                                                    .enabled ==
                                                                "1"
                                                            ? true
                                                            : false);
                                              },
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
                                            "services".tr,
                                            style:
                                                auctionMediumPrimaryTextStyle,
                                          ),
                                        ],
                                      )),
                                ]),
                              ),

                              gapH5,
                              //Component 4
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
                                            MainAxisAlignment.center,
                                        children: [
                                          ReUsableText(
                                              text:
                                                  '${hospitalityListingController.myHospitalityListingModel.data![0].price}',
                                              textStyle: textStyle732Onyx),
                                          gapW10,
                                          Text(
                                            "for the month".tr,
                                            style: primary716,
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
                                            "price".tr,
                                            style:
                                                auctionMediumPrimaryTextStyle,
                                          ),
                                        ],
                                      )),
                                ]),
                              ),
                              gapH20,
                              //Component 5
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            hospitalityListingController
                                                .incrementMonths();
                                          },
                                          child: const Icon(Icons.add),
                                        ),
                                        gapW5,
                                        IntrinsicWidth(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                "number of months".tr,
                                                style: primary709,
                                              ),
                                              Obx(() {
                                                return Container(
                                                  padding: padA5,
                                                  alignment: Alignment.center,
                                                  decoration: BoxDecoration(
                                                      color: cWhiteColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5)),
                                                  child: Text(
                                                    hospitalityListingController
                                                        .noOfMonths.value
                                                        .toString(),
                                                    style: black732,
                                                  ),
                                                );
                                              })
                                            ],
                                          ),
                                        ),
                                        gapW5,
                                        InkWell(
                                          onTap: () {
                                            hospitalityListingController
                                                .decrementMonths();
                                          },
                                          child: const Icon(Icons.remove),
                                        ),
                                      ],
                                    ),
                                  ),
                                  gapW10,
                                  Expanded(
                                      flex: 3,
                                      child: ElevatedButton(
                                          onPressed: () {
                                            int month =
                                                hospitalityListingController
                                                    .noOfMonths.value;
                                            int price = int.parse(
                                                '${hospitalityListingController.myHospitalityListingModel.data![0].price}');
                                            var totalPaid = month * price;
                                            int userId = int.parse(
                                                '${hospitalityListingController.myHospitalityListingModel.data![0].trainerUserId}');
                                            var hospitilityId =
                                                hospitalityListingController
                                                    .myHospitalityListingModel
                                                    .data![0]
                                                    .regionId;
                                            showDialog(
                                                context: context,
                                                builder: (context) =>
                                                    AddAmountDialog(
                                                      price: totalPaid,
                                                      userid: userId,
                                                      hospitilityid:
                                                          hospitilityId,
                                                      month: month,
                                                    ));
                                            // if (hospitalityListingController
                                            //         .noOfMonths.value ==
                                            //     0) {
                                            //   Get.snackbar(
                                            //     "notification".tr,
                                            //     "no services selected to be purchased"
                                            //         .tr,
                                            //   );
                                            // } else {
                                            //   Get.snackbar(
                                            //     "notification".tr,
                                            //     "your selected services will be purchased"
                                            //         .tr,
                                            //   );
                                            // }
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: cPrimaryColor,
                                            fixedSize: Size(context.width, 40),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(7),
                                            ),
                                            elevation: 0.0,
                                          ),
                                          child: Text("purchase".tr,
                                              style: black720))),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
      ),
    );
  }
}

class AddAmountDialog extends StatelessWidget {
  final price;
  final userid;
  final hospitilityid;
  final month;

  const AddAmountDialog({
    Key? key,
    required this.price,
    required this.userid,
    required this.hospitilityid,
    required this.month,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              Container(
                padding: padA10,
                margin: EdgeInsets.only(left: 35, right: 35),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        "To Be Paid".tr,
                        style: homePageOnyxGridPrice,
                      ),
                    ),
                    SizedBox(width: 30),
                    Expanded(
                      child: Text(
                        "$price  Rayal".tr,
                        style: homePageOnyxGridPrice,
                      ),
                    )
                  ],
                ),
              ),
              gapH10,
              ReusablePaymentActionWidget(
                  visaMasterCardPaymentFunction: () {
                    Navigator.pop(context);
                  },
                  madaPaymentFunction: () {},
                  applePaymentFunction: () {},
                  width: context.width * 0.5,
                  userid: userid,
                  horseid: hospitilityid,
                  sellerid: '$month',
                  totalprice: '$price',
                  role: 'hospitality'),
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

class ReusablePaymentActionWidget extends StatefulWidget {
  final Function()? visaMasterCardPaymentFunction,
      madaPaymentFunction,
      applePaymentFunction;

  final double width;
  var userid;
  var horseid;
  var sellerid;
  var totalprice;
  var role;

  ReusablePaymentActionWidget({
    Key? key,
    required this.visaMasterCardPaymentFunction,
    required this.madaPaymentFunction,
    required this.applePaymentFunction,
    required this.width,
    required this.userid,
    required this.horseid,
    required this.sellerid,
    required this.totalprice,
    required this.role,
  }) : super(key: key);

  @override
  State<ReusablePaymentActionWidget> createState() =>
      _ReusablePaymentActionWidgetState();
}

class _ReusablePaymentActionWidgetState
    extends State<ReusablePaymentActionWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconsDisplayCardWidget(
              onTapFunction: () {
                Navigator.pop(context);
                //Get.to(() => PaymentScreen());
                Get.to(() => FatoorahCustom(
                      userid: widget.userid,
                      horseid: widget.horseid,
                      sellerid: widget.sellerid,
                      totalprice: widget.totalprice,
                      role: widget.role,
                    ));
              },
              beforeLogoAssetString:
                  'assets/images/payment_images/mada_logo.png',
              afterLogoAssetString:
                  'assets/images/payment_images/mada_text_icon.png',
            ),
            IconsDisplayCardWidget(
              onTapFunction: () {
                Navigator.pop(context);
                //Get.to(() => PaymentScreen());
                Get.to(() => FatoorahCustom(
                      userid: widget.userid,
                      horseid: widget.horseid,
                      sellerid: widget.sellerid,
                      totalprice: widget.totalprice,
                      role: widget.role,
                    ));
                // Get.to(() => PaymentScreen(
                //       Category: 'frommada',
                //       discountvalue: '10',
                //       finalprice: 100,
                //       frommada: true,
                //       isdiscount: true,
                //       saloonId: '12345',
                //       saloonname: 'alibaba',
                //       totalamount: '100',
                //       totaldiscount: '50',
                //     ));
              },
              beforeLogoAssetString:
                  'assets/images/payment_images/visa_icon.png',
              afterLogoAssetString:
                  'assets/images/payment_images/master_card_logo.png',
            ),
          ],
        ),
        gapH15,
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
            Get.to(() => FatoorahCustom(
                  userid: widget.userid,
                  horseid: widget.horseid,
                  sellerid: widget.sellerid,
                  totalprice: widget.totalprice,
                  role: widget.role,
                ));
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: cBlackColor,
              fixedSize: Size(widget.width, 40),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  "assets/images/apple_icon/apple_icon.png",
                  //Assets.appleIconAppleIcon,

                  alignment: Alignment.center,
                ),
                gapW5,
                Text(
                  "Pay",
                  style: TextStyle(
                      fontFamily: "Tajawal",
                      color: cWhiteColor,
                      fontWeight: FontWeight.w800,
                      fontSize: 27),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class IconsDisplayCardWidget extends StatelessWidget {
  final Function()? onTapFunction;
  final String beforeLogoAssetString, afterLogoAssetString;

  const IconsDisplayCardWidget(
      {Key? key,
      required this.onTapFunction,
      required this.beforeLogoAssetString,
      required this.afterLogoAssetString})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapFunction,
      child: Container(
        padding: padA10,
        decoration: BoxDecoration(
            color: cWhiteColor, borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              afterLogoAssetString,
              height: 30,
            ),
            gapW5,
            Image.asset(
              beforeLogoAssetString,
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
