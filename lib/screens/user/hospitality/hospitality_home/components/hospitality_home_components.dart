import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:obaiah_mobile_app/screens/user/hospitality/hospitality_home/models/hospitality_model.dart';

import '../../../../../models/home_model.dart';
import '../../../../../utils/colors/colors.dart';
import '../../../../../utils/constants/app_urls.dart';
import '../../../../../utils/constants/constants.dart';
import '../../../../../utils/spacing/gaps.dart';
import '../../../../../utils/spacing/padding.dart';
import '../../../../../utils/text_styles/textstyles.dart';

class HospitalityGridViewInfoCard extends StatefulWidget {
  final List<Datum>? homePageModel;
  final index;

  const HospitalityGridViewInfoCard(
      {Key? key, required this.homePageModel, required this.index})
      : super(key: key);

  @override
  State<HospitalityGridViewInfoCard> createState() =>
      _HospitalityGridViewInfoCardState();
}

class _HospitalityGridViewInfoCardState
    extends State<HospitalityGridViewInfoCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padA15,
      decoration: BoxDecoration(
        color: cWhiteColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.location_pin,
                color: cPrimaryColor,
                size: 13,
              ),
              gapW4,
              Text(
                '${widget.homePageModel![widget.index].hospitalityRegion!.name}'
                    .tr,
                style: black510,
              ),
            ],
          ),
          gapH2,
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
                child: Image.network(
                    '${AppUrls.ImagebaseUrl}${widget.homePageModel![widget.index].featuredImage}',
                    fit: BoxFit.cover),
              ),
            ),
          ),
          gapH10,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: FittedBox(
              child: Directionality(
                textDirection: TextDirection.ltr,
                child: RatingBar(
                    initialRating: 3,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
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
          ),
          gapH10,
          Text(
            '${widget.homePageModel![widget.index].trainer!.fullname}',
            style: onyx814,
          ),
          gapH10,
          RichText(
            text: TextSpan(
              style: primary810,
              children: <TextSpan>[
                TextSpan(
                  text: "${widget.homePageModel![widget.index].price} ",
                ),
                TextSpan(
                  text: "riyal".tr,
                ),
                TextSpan(text: ' / '.tr),
                TextSpan(text: 'for the month'.tr),
              ],
            ),
          ),
          OutlinedButton(
            onPressed: () {
              Navigator.pushNamed(context, hospitalityListingScreen,
                  arguments: {
                    "id": widget.homePageModel![widget.index].id,
                    "ownername":
                        widget.homePageModel![widget.index].trainer!.fullname
                  });

              // Navigator.pushNamed(context, hospitalityListingScreen,
              //     arguments: {"homePageModel": widget.homePageModel});
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
