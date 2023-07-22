import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:obaiah_mobile_app/generated/assets.dart';
import 'package:obaiah_mobile_app/reusable_widgets/reusable_text.dart';
import 'package:obaiah_mobile_app/screens/user/add_stable_horse/controller/add_stable_horse_controller.dart';
import 'package:obaiah_mobile_app/screens/user/settings/my_horses_stable/controller/my_horses_stable_controller.dart';
import 'package:obaiah_mobile_app/screens/user/settings/my_horses_stable/model/my_horse_stable_model.dart';
import 'package:obaiah_mobile_app/utils/colors/colors.dart';
import 'package:obaiah_mobile_app/utils/constants/app_urls.dart';
import 'package:obaiah_mobile_app/utils/constants/constants.dart';
import 'package:obaiah_mobile_app/utils/spacing/gaps.dart';
import 'package:obaiah_mobile_app/utils/spacing/padding.dart';

import '../../../../../utils/text_styles/textstyles.dart';

class MyHorsesStableListViewInfoCard extends StatelessWidget {
  final myHorsesStableController2 = Get.find<AddStableHorseController>();
  final myHorsesStableController = Get.find<MyHorsesStableController>();
  final Datum homePageModel;

  MyHorsesStableListViewInfoCard({
    Key? key,
    required this.homePageModel,
  }) : super(key: key);

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
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                homePageModel.nameOfHorse ?? "",
                style: primary717,
              ),
              homePageModel.status != "Pending"
                  ? Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(
                          Assets.auctionImagesVerified,
                          height: 12,
                          width: 12,
                        ),
                        gapW5,
                        Text(
                          "approved".tr,
                          style: primary708,
                        ),
                      ],
                    )
                  : Container(
                      padding: padA5,
                      decoration: BoxDecoration(
                        color: cPrimaryColor,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        "awaiting management approval".tr,
                        style: onyx708,
                      ),
                    ),
            ],
          ),
          gapH10,
          Row(
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
                    homePageModel.type ?? "",
                    style: homePageValue,
                  ),
                  gapH10,
                  Text(
                    "color".tr,
                    style: homePageHeading,
                  ),
                  gapH5,
                  Text(
                    homePageModel.color ?? "",
                    style: homePageValue,
                  ),
                  gapH10,
                  Text(
                    "age".tr,
                    style: homePageHeading,
                  ),
                  gapH5,
                  Text(
                    homePageModel.age.toString(),
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
                    homePageModel.originality ?? "",
                    style: homePageValue,
                  ),
                  gapH10,
                  Text(
                    "height".tr,
                    style: homePageHeading,
                  ),
                  gapH5,
                  Text(
                    homePageModel.height.toString(),
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
              ClipPath(
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
                        "${AppUrls.ImagebaseUrl}${homePageModel.horseFrontView ?? ""}",
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
                  //     "${AppUrls.ImagebaseUrl}${homePageModel.horseFrontView ?? ""}",
                  //     fit: BoxFit.cover),
                ),
              ),
            ],
          ),
          gapH10,
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "price".tr,
                    style: romanSilver408,
                  ),
                  ReUsableText(
                      text: homePageModel.price.toString(),
                      textStyle: homePagePrice)
                ],
              ),
              const Spacer(),
              SizedBox(
                width: 155,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, modifyHorse, arguments: {
                            "image": homePageModel.horseFrontView,
                            "horseId": homePageModel.id,
                            "nameOfHorse": homePageModel.nameOfHorse,
                            "type": homePageModel.type,
                            "fathersName": homePageModel.fathersName,
                            "mothersName": homePageModel.mothersName,
                            "monthOfBirth": homePageModel.monthOfBirth,
                            "yearOfBirth": homePageModel.yearOfBirth,
                            "age": homePageModel.age,
                            "color": homePageModel.color,
                            "casuality": homePageModel.casuality,
                            "originality": homePageModel.originality,
                            "region": homePageModel.region,
                            "city": homePageModel.city,
                            "siteCommision": homePageModel.siteCommision,
                            "expertOpinionPrice": homePageModel.expertOpinion,
                            "totalPrice": homePageModel.totalPrice,
                            "ibanNumber": homePageModel.ibanNumber,
                            "safety": homePageModel.casuality,
                          });
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
                          child: Text("modification".tr, style: black512),
                        ),
                      ),
                    ),
                    gapW10,
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {
                          _showDialogue(context);

                          // myHorsesStableController
                          //     .getStableHorse(myHorsesStableController.uid);
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
                          child: Text("delete".tr, style: black512),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _showDialogue(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("chooseaction".tr),
                gapH25,
                Row(
                  children: [
                    Obx(() => Expanded(
                            child: OutlinedButton(
                          onPressed: () {
                            myHorsesStableController2
                                .deleteStableHorse(homePageModel.id!);
                            Navigator.pop(context);
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
                            child: myHorsesStableController2.loading.value
                                ? SizedBox(
                                    height: 25,
                                    width: 25,
                                    child: CircularProgressIndicator(
                                      color: cBlackColor,
                                    ))
                                : Text("delete".tr, style: black512),
                          ),
                        ))),
                    gapW15,
                    Obx(() => Expanded(
                            child: OutlinedButton(
                          onPressed: () {
                            myHorsesStableController
                                .addToSale(homePageModel.id!);
                            Navigator.pop(context);
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
                            child: myHorsesStableController.loading2.value
                                ? SizedBox(
                                    height: 25,
                                    width: 25,
                                    child: CircularProgressIndicator(
                                      color: cBlackColor,
                                    ))
                                : Text("add to sale".tr, style: black512),
                          ),
                        ))),
                  ],
                )
              ],
            ),
          );
        });
  }
}

/*===============================Grid View Components==========================================*/
class MyHorsesStableGridViewInfoCard extends StatelessWidget {
  final Datum homePageModel;
  final myHorsesStableController2 = Get.find<AddStableHorseController>();
  final myHorsesStableController = Get.find<MyHorsesStableController>();

  MyHorsesStableGridViewInfoCard({
    Key? key,
    required this.homePageModel,
  }) : super(key: key);

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
            homePageModel.nameOfHorse ?? "",
            style: primary717,
          ),
          homePageModel.status != "Pending"
              ? Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(
                      Assets.auctionImagesVerified,
                      height: 12,
                      width: 12,
                    ),
                    gapW5,
                    Text(
                      "approved".tr,
                      style: primary708,
                    ),
                  ],
                )
              : Container(
                  padding: padA5,
                  color: cPrimaryColor,
                  child: Text(
                    "awaiting management approval".tr,
                    style: onyx708,
                  ),
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
                child: CachedNetworkImage(
                  imageUrl:
                      "${AppUrls.ImagebaseUrl}${homePageModel.horseFrontView ?? ""}",
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
                //     "${AppUrls.ImagebaseUrl}${homePageModel.horseFrontView ?? ""}",
                //     fit: BoxFit.cover),
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
                    homePageModel.age.toString(),
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
                    homePageModel.nameOfHorse ?? "",
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
                    homePageModel.height.toString(),
                    style: homePageGridValue,
                  ),
                ],
              ),
            ],
          ),
          gapH10,
          ReUsableText(
              text: homePageModel.price.toString(),
              textStyle: homePageGridPrice),
          OutlinedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              shadowColor: cPrimaryColor,
              foregroundColor: cPrimaryColor,
              side: const BorderSide(color: cBlackColor),
              fixedSize: const Size(100, 35),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              elevation: 0.0,
            ),
            child: Text("modification".tr,
                style: const TextStyle(
                    fontFamily: "Tajawal",
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    color: cBlackColor)),
          ),
          OutlinedButton(
            onPressed: () {
              _showDialogue(context);
              // myHorsesStableController
              //     .getStableHorse(myHorsesStableController.uid);
            },
            style: ElevatedButton.styleFrom(
              shadowColor: cPrimaryColor,
              foregroundColor: cPrimaryColor,
              fixedSize: const Size(100, 35),
              side: const BorderSide(color: cBlackColor),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              elevation: 0.0,
            ),
            child: Text("delete".tr,
                style: const TextStyle(
                    fontFamily: "Tajawal",
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    color: cBlackColor)),
          ),
        ],
      ),
    );
  }

  void _showDialogue(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Choose Action"),
                gapH25,
                Row(
                  children: [
                    Obx(() => Expanded(
                            child: OutlinedButton(
                          onPressed: () {
                            myHorsesStableController2
                                .deleteStableHorse(homePageModel.id!);
                            Navigator.pop(context);
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
                            child: myHorsesStableController2.loading.value
                                ? SizedBox(
                                    height: 25,
                                    width: 25,
                                    child: CircularProgressIndicator(
                                      color: cBlackColor,
                                    ))
                                : Text("delete".tr, style: black512),
                          ),
                        ))),
                    gapW15,
                    Obx(() => Expanded(
                            child: OutlinedButton(
                          onPressed: () {
                            myHorsesStableController
                                .addToSale(homePageModel.id!);
                            Navigator.pop(context);
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
                            child: myHorsesStableController.loading2.value
                                ? SizedBox(
                                    height: 25,
                                    width: 25,
                                    child: CircularProgressIndicator(
                                      color: cBlackColor,
                                    ))
                                : Text("add to sale".tr, style: black512),
                          ),
                        ))),
                  ],
                )
              ],
            ),
          );
        });
  }
}
