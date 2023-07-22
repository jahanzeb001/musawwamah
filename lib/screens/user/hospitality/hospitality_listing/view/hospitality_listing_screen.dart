import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:obaiah_mobile_app/models/home_model.dart';
import 'package:obaiah_mobile_app/utils/spacing/padding.dart';

import '../../../../../reusable_widgets/reusable_appbar.dart';
import '../../../../../reusable_widgets/reusable_text.dart';
import '../../../../../utils/colors/colors.dart';
import '../../../../../utils/spacing/gaps.dart';
import '../../../../../utils/text_styles/textstyles.dart';
import '../../../home/regular_listing/components/regular_listing_components.dart';
import '../../../home/regular_listing/view/regular_listing_screen.dart';
import '../components/hospitality_listing_components.dart';
import '../controller/hospitality_listing_controller.dart';

class HospitalityListingScreen extends StatelessWidget {
  final HomeModel homeModel;

  const HospitalityListingScreen({Key? key, required this.homeModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final hospitalityListingController =
        Get.find<HospitalityListingController>();
    return Scaffold(
      appBar: ReusableAppBar(
          titleText: homeModel.name,
          textStyle: primary820,
          onPressFunction: () {
            Navigator.pop(context);
          }),
      body: Container(
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
                          controller:
                              hospitalityListingController.sliderController,
                          unlimitedMode: true,
                          slideBuilder: (index) {
                            return ClipPath(
                              clipper: const ShapeBorderClipper(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10)))),
                              child: Container(
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
                                child: Image.asset(homeModel.horseImage,
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
                              mainAxisAlignment: MainAxisAlignment.center,
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
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(homeModel.owner, style: onyx717),
                          Text(
                            homeModel.city.tr,
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
                            style: auctionMediumPrimaryTextStyle,
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
                      height: 155,
                      width: context.width * 1,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Expanded(
                                  child: ServicesComponent(
                                      serviceName: "laundry",
                                      isServiceAvailable:
                                          homeModel.isLaundryServiceAvailable),
                                ),
                                gapH5,
                                Expanded(
                                  child: ServicesComponent(
                                      serviceName: "feed",
                                      isServiceAvailable:
                                          homeModel.isFeedServiceAvailable),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Expanded(
                                  child: ServicesComponent(
                                      serviceName: "cleaning hooves",
                                      isServiceAvailable: homeModel
                                          .isCleaningHoovesServiceAvailable),
                                ),
                                gapH5,
                                Expanded(
                                  child: ServicesComponent(
                                      serviceName: "treatment",
                                      isServiceAvailable: homeModel
                                          .isTreatmentServiceAvailable),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Expanded(
                                  child: ServicesComponent(
                                      serviceName: "exercise",
                                      isServiceAvailable:
                                          homeModel.isExerciseServiceAvailable),
                                ),
                                gapH5,
                                Expanded(
                                  child: ServicesComponent(
                                      serviceName: "daily reports",
                                      isServiceAvailable: homeModel
                                          .isDailyReportsServiceAvailable),
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
                            "services".tr,
                            style: auctionMediumPrimaryTextStyle,
                          ),
                        ],
                      )),
                ]),
              ),
              gapH20,
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
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ReUsableText(
                              text: homeModel.price,
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
                            style: auctionMediumPrimaryTextStyle,
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
                    flex: 1,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        InkWell(
                          onTap: () {
                            hospitalityListingController.incrementMonths();
                          },
                          child: const Icon(Icons.add),
                        ),
                        gapW5,
                        IntrinsicWidth(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
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
                                      borderRadius: BorderRadius.circular(5)),
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
                            hospitalityListingController.decrementMonths();
                          },
                          child: const Icon(Icons.remove),
                        ),
                      ],
                    ),
                  ),
                  gapW10,
                  Expanded(
                      flex: 2,
                      child: ElevatedButton(
                          onPressed: () {
                            if (hospitalityListingController.noOfMonths.value ==
                                0) {
                              Get.snackbar(
                                "notification".tr,
                                "no services selected to be purchased".tr,
                              );
                            } else {
                              Get.snackbar(
                                "notification".tr,
                                "your selected services will be purchased".tr,
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: cPrimaryColor,
                            fixedSize: Size(context.width, 40),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7),
                            ),
                            elevation: 0.0,
                          ),
                          child: Text("purchase".tr, style: black720))),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
