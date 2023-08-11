import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:obaiah_mobile_app/screens/user/home/favourites/controller/favourites_controller.dart';
import 'package:obaiah_mobile_app/screens/user/home/favourites/model/get_my_favourite_response.dart';
import 'package:obaiah_mobile_app/utils/colors/colors.dart';
import 'package:obaiah_mobile_app/utils/constants/app_urls.dart';
import 'package:obaiah_mobile_app/utils/spacing/gaps.dart';
import 'package:obaiah_mobile_app/utils/spacing/padding.dart';

import '../../../../../utils/constants/constants.dart';
import '../../../../../utils/text_styles/textstyles.dart';

class FavoritesViewInfoCard extends StatelessWidget {
  final Datum homePageModel;

  int index;

  FavoritesViewInfoCard(
      {Key? key, required this.homePageModel, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final favouritesController = Get.find<FavouritesController>();
    print("+++++++++++++++++++++++++++++++++++++++${homePageModel.city}");
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, listingScreen,
            arguments: {"horseId": homePageModel.id});
      },
      child: Container(
        padding: padA15,
        width: context.width * 1,
        decoration: BoxDecoration(
          color: cWhiteColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "owner".tr,
                    style: const TextStyle(
                        color: cPrimaryColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    " : ${homePageModel.user!.fullname ?? ""}",
                    style: const TextStyle(
                        color: cPrimaryColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
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
                      "name".tr,
                      style: homePageHeading,
                    ),
                    gapH5,
                    Text(
                      homePageModel.nameOfHorse ?? "",
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
                      "site".tr,
                      style: homePageHeading,
                    ),
                    gapH5,
                    Text(
                      homePageModel.city ?? "",
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
                    homePageModel.isSold == '1'
                        ? Text('')
                        : Text(
                            "price".tr,
                            style: romanSilver408,
                          ),
                    homePageModel.isSold == '1'
                        ? Text('')
                        : Row(
                            children: [
                              Text(
                                homePageModel.totalPrice.toString(),
                                style: homePagePrice,
                              ),
                              Text(
                                "riyal".tr,
                                style: homePagePrice,
                              ),
                            ],
                          ),
                  ],
                ),
                const Spacer(),
                SizedBox(
                  width: 155,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      homePageModel.isSold == '1'
                          ? Expanded(
                              child: Container(),
                            )
                          : Expanded(
                              child: OutlinedButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, listingScreen,
                                      arguments: {"horseId": homePageModel.id});
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
                                  child: Text("details".tr,
                                      style: const TextStyle(
                                          fontFamily: "Tajawal",
                                          fontWeight: FontWeight.w600,
                                          fontSize: 10,
                                          color: cBlackColor)),
                                ),
                              ),
                            ),
                      gapW10,
                      Expanded(
                        child: OutlinedButton(
                            onPressed: () {
                              int hid = int.parse(homePageModel.id.toString());
                              favouritesController.deletHorse(
                                  hid, index, favouritesController.userId!);
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
                            child: Obx(
                              () => favouritesController.loading.value
                                  ? SizedBox(
                                      height: 25,
                                      width: 25,
                                      child: Center(
                                        child: CircularProgressIndicator(
                                          color: Colors.black,
                                        ),
                                      ))
                                  : FittedBox(
                                      child: Text("delete".tr,
                                          style: const TextStyle(
                                              fontFamily: "Tajawal",
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12,
                                              color: cBlackColor)),
                                    ),
                            )),
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

class ListViewBlurComponent extends StatelessWidget {
  final Datum homeModel;
  int index;

  ListViewBlurComponent(
      {Key? key, required this.homeModel, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: <Widget>[
        AbsorbPointer(
          absorbing: false,
          child: FavoritesViewInfoCard(homePageModel: homeModel, index: index),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: BackdropFilter(
            filter: ImageFilter.blur(
              tileMode: TileMode.mirror,
              sigmaX: 2,
              sigmaY: 2,
            ),
            child: Container(
              alignment: Alignment.center,
              color: Colors.black.withOpacity(0),
              height: 222,
              child: FittedBox(
                child: Text(
                  "sold".tr,
                  textAlign: TextAlign.center,
                  style: primary852,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

/*===============================Grid View Components==========================================*/
class FavouritesGridViewInfoCard extends StatelessWidget {
  final Datum homePageModel;

  int index;

  FavouritesGridViewInfoCard(
      {Key? key, required this.homePageModel, this.index = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final favouritesController = Get.find<FavouritesController>();
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, listingScreen,
            arguments: {"horseId": homePageModel.id});
      },
      child: Container(
        padding: padA15,
        decoration: BoxDecoration(
          color: cWhiteColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "owner".tr,
                    style: const TextStyle(
                        fontFamily: "Tajawal",
                        color: cRomanSilverColor,
                        fontSize: 10,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    " : ${homePageModel.user!.fullname ?? ""}",
                    style: const TextStyle(
                        fontFamily: "Tajawal",
                        color: cRomanSilverColor,
                        fontSize: 10,
                        fontWeight: FontWeight.w500),
                  ),
                ],
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
                        "${AppUrls.ImagebaseUrl}${homePageModel.horseImageFromLeft}",
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
                  //     "${AppUrls.ImagebaseUrl}${homePageModel.horseImageFromLeft}",
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
                      "site".tr,
                      style: homePageGridHeading,
                    ),
                    gapH5,
                    Text(
                      homePageModel.city ?? "",
                      style: homePageGridValue,
                    ),
                  ],
                ),
              ],
            ),
            gapH10,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  homePageModel.totalPrice.toString(),
                  style: homePageGridPrice,
                ),
                Text(
                  "riyal".tr,
                  style: homePageGridPrice,
                ),
              ],
            ),
            homePageModel.isSold == '1'
                ? Container()
                : OutlinedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, listingScreen,
                          arguments: {"homePageModel": homePageModel});
                    },
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
                    child: Text("details".tr,
                        style: const TextStyle(
                            fontFamily: "Tajawal",
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: cBlackColor)),
                  ),
            OutlinedButton(
                onPressed: () {
                  int hid = int.parse(homePageModel.id.toString());
                  favouritesController.deletHorse(
                      hid, index, favouritesController.userId!);
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
                child: Obx(
                  () => favouritesController.loading.value
                      ? SizedBox(
                          height: 25,
                          width: 25,
                          child: Center(
                            child: CircularProgressIndicator(
                              color: Colors.black,
                            ),
                          ))
                      : Text("delete".tr,
                          style: const TextStyle(
                              fontFamily: "Tajawal",
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              color: cBlackColor)),
                )),
          ],
        ),
      ),
    );
  }
}

class GridViewBlurComponent extends StatelessWidget {
  final Datum homeModel;
  int index;

  GridViewBlurComponent(
      {Key? key, required this.homeModel, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: <Widget>[
        AbsorbPointer(
          absorbing: false,
          child: FavouritesGridViewInfoCard(
              homePageModel: homeModel, index: index),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: BackdropFilter(
            filter: ImageFilter.blur(
              tileMode: TileMode.clamp,
              sigmaX: 2,
              sigmaY: 2,
            ),
            child: Container(
              alignment: Alignment.center,
              color: Colors.black.withOpacity(0),
              height: 240,
              child: Text(
                "sold".tr,
                style: primary852,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
/*

Stack(
      children: <Widget>[
        Opacity(
            opacity: 0.2,
            child: AbsorbPointer(
                absorbing: true,
                child: FavouritesGridViewInfoCard(homePageModel: homeModel))),
        Align(
          alignment: Alignment.center,
          child: Text(
            "sold".tr,
            style: primary852,
          ),
        ),
      ],
    );

 */
