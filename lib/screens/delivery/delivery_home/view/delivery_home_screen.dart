import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:obaiah_mobile_app/utils/constants/app_urls.dart';
import 'package:obaiah_mobile_app/utils/constants/constants.dart';
import 'package:obaiah_mobile_app/utils/constants/custom_error.dart';
import 'package:obaiah_mobile_app/utils/constants/no_data_message.dart';
import 'package:obaiah_mobile_app/utils/spacing/padding.dart';
import 'package:obaiah_mobile_app/utils/text_styles/textstyles.dart';

import '../../../../generated/assets.dart';
import '../../../../utils/colors/colors.dart';
import '../../../../utils/spacing/gaps.dart';
import '../components/delivery_home_components.dart';
import '../controller/delivery_home_controller.dart';

class DeliveryHomeScreen extends StatelessWidget {
  const DeliveryHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deliveryHomeController = Get.find<DeliveryHomeController>();

    return Scaffold(
        body: SafeArea(
      child: Obx(
        () => deliveryHomeController.loading.value
            ? Center(
                child: CircularProgressIndicator(
                color: cPrimaryColor,
              ))
            : deliveryHomeController.error.value != ""
                ? Center(
                    child: Custom_Error(
                        onpressed: () {
                          deliveryHomeController
                              .deliveryAccount(deliveryHomeController.userId!);
                        },
                        error: deliveryHomeController.error.value),
                  )
                : deliveryHomeController.deliveryAccountModel.data == null
                    ? Center(child: NoDataMessage(message: "No Data Found"))
                    : Container(
                        padding: padA10,
                        height: context.height * 1,
                        width: context.width * 1,
                        child: SingleChildScrollView(
                          child: Column(children: [
                            //Component 1
                            Container(
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
                                    child: SizedBox(
                                      child: Stack(
                                        children: [
                                          ClipPath(
                                            clipper: const ShapeBorderClipper(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                10)))),
                                            child: Container(
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                color: cWhiteColor,
                                                border: Border.all(
                                                    color: cWhiteColor,
                                                    width: 10),
                                              ),
                                              child: CachedNetworkImage(
                                                imageUrl:
                                                    "${AppUrls.ImagebaseUrl}${deliveryHomeController.deliveryAccountModel.data!.deliveryAccount!.idPhotoFront}}",
                                                imageBuilder:
                                                    (context, imageProvider) =>
                                                        Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    image: DecorationImage(
                                                      //image size fill
                                                      image: imageProvider,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                                placeholder: (context, url) =>
                                                    Container(
                                                  alignment: Alignment.center,
                                                  child:
                                                      CircularProgressIndicator(
                                                    color: cPrimaryColor,
                                                  ), // you can add pre loader iamge as well to show loading.
                                                ), //show progress  while loading image
                                                errorWidget: (context, url,
                                                        error) =>
                                                    Image.asset(
                                                        "assets/images/auction_images/person_image.png"),
                                                //show no iamge availalbe image on error laoding
                                              ),

                                              // Image.network(
                                              //   "${AppUrls.ImagebaseUrl}${deliveryHomeController.deliveryAccountModel.data!.deliveryAccount!.idPhotoFront}",
                                              //   fit: BoxFit.cover,
                                              // ),
                                            ),
                                          ),
                                          Align(
                                            alignment: Alignment.topLeft,
                                            child: SvgPicture.asset(
                                              Assets.auctionImagesVerified,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                      flex: 3,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            deliveryHomeController
                                                    .deliveryAccountModel
                                                    .data!
                                                    .deliveryAccount!
                                                    .fullname ??
                                                "",
                                            style: black718,
                                          ),
                                          FittedBox(
                                            child: Directionality(
                                              textDirection: TextDirection.ltr,
                                              child: RatingBar(
                                                  initialRating: 3,
                                                  direction: Axis.horizontal,
                                                  allowHalfRating: true,
                                                  itemCount: 5,
                                                  itemSize: 25,
                                                  ignoreGestures: true,
                                                  onRatingUpdate: (rating) {
                                                    log(rating.toString());
                                                  },
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
                                          ),
                                        ],
                                      ))
                                ],
                              ),
                            ),
                            gapH40,
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Expanded(
                                  child: DeliveryHomeOptionWidget(
                                    onTapFunction: () {
                                      Navigator.pushNamed(
                                          context, deliveryAccountScreen);
                                    },
                                    assetName:
                                        Assets.profileImagesAccountPerson,
                                    text: "my account and my data",
                                  ),
                                ),
                                gapW30,
                                Expanded(
                                  child: DeliveryHomeOptionWidget(
                                    onTapFunction: () {
                                      // SessionController().deliverAccountId =
                                      //     deliveryHomeController
                                      //         .deliveryAccountModel
                                      //         .data!
                                      //         .deliveryAccount!
                                      //         .id;
                                      Navigator.pushNamed(
                                          context, myDeliveryScreen);
                                    },
                                    assetName: Assets
                                        .deliveryImagesDeliveryConnectionsIcon,
                                    text: "my connections",
                                  ),
                                ),
                              ],
                            ),
                            gapH30,
                            DeliveryHomeBalanceReceipt(
                                headerText: "waiting for transfer:",
                                valueText: deliveryHomeController
                                        .deliveryAccountModel
                                        .data!
                                        .deliveryAccount!
                                        .accountBalance ??
                                    "0",
                                deliveryId: deliveryHomeController
                                    .deliveryAccountModel
                                    .data!
                                    .deliveryAccount!
                                    .id!,
                                assetName: Assets.profileImagesMyWallet,
                                containerText: "my wallet"),
                            gapH30,
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Expanded(
                                  child: DeliveryHomeOptionWidget(
                                    onTapFunction: () {},
                                    assetName: Assets.profileImagesHelp,
                                    text: "help",
                                  ),
                                ),
                                gapW30,
                                Expanded(
                                  child: DeliveryHomeOptionWidget(
                                    onTapFunction: () {
                                      Navigator.pushNamed(
                                          context, settingPreferencesScreen);
                                    },
                                    assetName: Assets.profileImagesSettings,
                                    text: "settings",
                                  ),
                                ),
                              ],
                            ),
                            gapH30,
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: context.width * 0.25),
                              child: DeliveryHomeOptionWidget(
                                onTapFunction: () {
                                  Navigator.pop(context);
                                },
                                assetName:
                                    Assets.deliveryImagesDeliveryReturnIcon,
                                text: "back to the application",
                              ),
                            ),
                          ]),
                        ),
                      ),
      ),
    ));
  }
}
