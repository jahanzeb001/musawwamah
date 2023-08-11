import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:obaiah_mobile_app/screens/user/settings/my_horses_stable/model/my_horse_stable_model.dart';

import '../../../../generated/assets.dart';
import '../../../../models/home_model.dart';
import '../../../../reusable_widgets/reusable_alertDialog.dart';
import '../../../../utils/colors/colors.dart';
import '../../../../utils/constants/app_urls.dart';
import '../../../../utils/constants/constants.dart';
import '../../../../utils/spacing/gaps.dart';
import '../../../../utils/spacing/padding.dart';
import '../../../../utils/text_styles/textstyles.dart';

class SelectContainerComponent extends StatelessWidget {
  final bool isChecked;
  final String text;
  final Function()? onTapFunction;

  const SelectContainerComponent(
      {Key? key,
      required this.isChecked,
      required this.text,
      required this.onTapFunction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapFunction,
      child: Container(
        height: 45,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: isChecked ? cPrimaryColor : cWhiteColor,
            borderRadius: BorderRadius.circular(10)),
        child: Text(
          text.tr,
          style: black712,
        ),
      ),
    );
  }
}

class ProfileGridViewInfoCard extends StatelessWidget {
  final Datum homePageModel;

  const ProfileGridViewInfoCard({Key? key, required this.homePageModel})
      : super(key: key);

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
                      "${AppUrls.ImagebaseUrl}${homePageModel.horse!.horseFrontView}",
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
                    homePageModel.horse!.age.toString(),
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
                    homePageModel.horse!.nameOfHorse.toString(),
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
                    homePageModel.horse!.region.toString(),
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
                homePageModel.horse!.totalPrice.toString(),
                style: homePageGridPrice,
              ),
              Text(
                "riyal".tr,
                style: homePageGridPrice,
              ),
            ],
          ),
          OutlinedButton(
            onPressed: () {
              Navigator.pushNamed(context, listingScreen, arguments: {
                "horseId": int.parse(homePageModel.horseId!),
                "nameOfHorse": homePageModel.horse!.nameOfHorse,
              });
              // Navigator.pushNamed(context, listingScreen,
              //     arguments: {"homePageModel": homePageModel});
            },
            style: ElevatedButton.styleFrom(
              shadowColor: cPrimaryColor,
              foregroundColor: cPrimaryColor,
              side: const BorderSide(color: cBlackColor),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7),
              ),
              elevation: 0.0,
            ),
            child: Text("fill in the details".tr,
                style: const TextStyle(
                    fontFamily: "Tajawal",
                    fontWeight: FontWeight.w500,
                    fontSize: 10,
                    color: cBlackColor)),
          ),
        ],
      ),
    );
  }
}

class ProfileRatingComponent extends StatelessWidget {
  final homeModel;

  const ProfileRatingComponent({Key? key, required this.homeModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 155,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: padA20,
              height: 141,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: ClipPath(
                      clipper: const ShapeBorderClipper(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)))),
                      child: Container(
                        decoration: const BoxDecoration(
                          border: Border(
                            right: BorderSide(width: 2.0, color: cPrimaryColor),
                            bottom:
                                BorderSide(width: 2.0, color: cPrimaryColor),
                          ),
                        ),
                        child: CachedNetworkImage(
                          imageUrl:
                              "${AppUrls.ImagebaseUrl}${homeModel.user.profileImage}",
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

                        // Image.asset(Assets.auctionImagesPersonImage,
                        //     fit: BoxFit.cover),
                      ),
                    ),
                  ),
                  gapW10,
                  Expanded(
                    flex: 2,
                    child: InkWell(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) => ShowDescriptionDialog(
                                  titleText: "${homeModel.user.fullname}",
                                  descriptionText: "${homeModel.review}",
                                ));
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            homeModel.user.fullname,
                            style: black911,
                          ),
                          gapH5,
                          Text(
                            "${homeModel.review}".tr,
                            maxLines: 4,
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.justify,
                            style: black511,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Directionality(
              textDirection: TextDirection.ltr,
              child: RatingBar(
                  initialRating: double.parse(homeModel.ratting),
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  ignoreGestures: true,
                  onRatingUpdate: (rating) {
                    log(rating.toString());
                  },
                  itemSize: 30,
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
      ),
    );
  }
}
