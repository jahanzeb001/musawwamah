import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:obaiah_mobile_app/screens/user/settings/my_sold_horses/model/get_my_sales_response.dart';
import 'package:obaiah_mobile_app/utils/constants/app_urls.dart';

import '../../../../../reusable_widgets/reusable_text.dart';
import '../../../../../utils/colors/colors.dart';
import '../../../../../utils/spacing/gaps.dart';
import '../../../../../utils/spacing/padding.dart';
import '../../../../../utils/text_styles/textstyles.dart';

class MySoldHorsesListViewInfoCard extends StatelessWidget {
  final Datum homePageModel;

  const MySoldHorsesListViewInfoCard({Key? key, required this.homePageModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padA15,
      width: context.width * 1,
      decoration: BoxDecoration(
        color: cWhiteColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
              child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                homePageModel.fullname ?? "",
                style: primary717,
              ),
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
                        homePageModel.type.toString(),
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
                ],
              ),
              Text(
                "price".tr,
                style: romanSilver408,
              ),
              ReUsableText(
                  text: homePageModel.totalPrice.toString(),
                  textStyle: homePagePrice),
              homePageModel.isPaid == '1'
                  ? Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        OutlinedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            shadowColor: cPrimaryColor,
                            foregroundColor: cPrimaryColor,
                            side: const BorderSide(color: cBlackColor),
                            fixedSize: const Size(133, 24),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            elevation: 0.0,
                          ),
                          child: FittedBox(
                            child: Text("bill".tr, style: black512),
                          ),
                        ),
                        gapH2,
                        OutlinedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            shadowColor: cPrimaryColor,
                            foregroundColor: cPrimaryColor,
                            side: const BorderSide(color: cBlackColor),
                            fixedSize: const Size(133, 24),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            elevation: 0.0,
                          ),
                          child: FittedBox(
                            child: Text("transfer receipt".tr, style: black512),
                          ),
                        ),
                      ],
                    )
                  : const SizedBox.shrink()
            ],
          )),
          gapW15,
          Expanded(
              child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                homePageModel.nameOfHorse ?? "".tr,
                style: onyx718,
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
                    )
                    // Image.network(
                    //     "${AppUrls.ImagebaseUrl}${homePageModel.horseFrontView ?? ""}",
                    //     fit: BoxFit.fill),
                    ),
              ),
              Text(
                "allegiance case".tr,
                style: onyx814,
              ),
              Container(
                padding: padA10,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: homePageModel.isPaid == '1'
                        ? cGreenAccentTwoColor
                        : cRomanSilverColor,
                    borderRadius: BorderRadius.circular(6)),
                child: FittedBox(
                  child: Text(
                    homePageModel.isDelivered == '1'
                        ? "the amount has been transferred to your bank account"
                            .tr
                        : "waiting for the transfer of horse delivery".tr,
                    style: onyx810,
                  ),
                ),
              ),
            ],
          )),
        ],
      ),
    );
  }
}

/*===============================Grid View Components==========================================*/
class MySoldHorsesGridViewInfoCard extends StatelessWidget {
  final Datum homePageModel;

  MySoldHorsesGridViewInfoCard({
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
            homePageModel.fullname ?? "",
            style: primary717,
          ),
          Text(
            homePageModel.nameOfHorse ?? "".tr,
            style: onyx718,
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
                  )
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
              text: homePageModel.totalPrice.toString(),
              textStyle: homePageGridPrice),
          Text(
            "allegiance case".tr,
            style: onyx814,
          ),
          Container(
            padding: padA10,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: homePageModel.isPaid == '1'
                    ? cGreenAccentTwoColor
                    : cRomanSilverColor,
                borderRadius: BorderRadius.circular(6)),
            child: FittedBox(
              child: Text(
                homePageModel.isDelivered == '0'
                    ? "the amount has been transferred to your bank account".tr
                    : "waiting for the transfer of horse delivery".tr,
                style: onyx810,
              ),
            ),
          ),
          gapH10,
          homePageModel.isPaid == '1'
              ? Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    OutlinedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        shadowColor: cPrimaryColor,
                        foregroundColor: cPrimaryColor,
                        side: const BorderSide(color: cBlackColor),
                        fixedSize: const Size(133, 24),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        elevation: 0.0,
                      ),
                      child: FittedBox(
                        child: Text("bill".tr, style: black512),
                      ),
                    ),
                    gapH2,
                    OutlinedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        shadowColor: cPrimaryColor,
                        foregroundColor: cPrimaryColor,
                        side: const BorderSide(color: cBlackColor),
                        fixedSize: const Size(133, 24),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        elevation: 0.0,
                      ),
                      child: FittedBox(
                        child: Text("transfer receipt".tr, style: black512),
                      ),
                    ),
                  ],
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
