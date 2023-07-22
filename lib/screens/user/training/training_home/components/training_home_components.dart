import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:obaiah_mobile_app/screens/user/training/training_home/models/traning_model.dart';
import '../../../../../models/home_model.dart';
import '../../../../../utils/colors/colors.dart';
import '../../../../../utils/constants/app_urls.dart';
import '../../../../../utils/constants/constants.dart';
import '../../../../../utils/spacing/gaps.dart';
import '../../../../../utils/spacing/padding.dart';
import '../../../../../utils/text_styles/textstyles.dart';

class TrainingGridViewInfoCard extends StatefulWidget {
  final List<Datum>? homePageModel;
  final index;

  const TrainingGridViewInfoCard(
      {Key? key, required this.homePageModel, required this.index})
      : super(key: key);

  @override
  State<TrainingGridViewInfoCard> createState() =>
      _TrainingGridViewInfoCardState();
}

class _TrainingGridViewInfoCardState extends State<TrainingGridViewInfoCard> {
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
        mainAxisSize: MainAxisSize.min,
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
                '${widget.homePageModel![widget.index].region!.name}'.tr,
                style: black510,
              ),
            ],
          ),
          gapH2,
          Expanded(
            flex: 2,
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
                    '${AppUrls.ImagebaseUrl}${widget.homePageModel![widget.index].image}',
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
            '${widget.homePageModel![widget.index].user!.fullname}'.tr,
            style: onyx814,
          ),
          gapH10,
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: widget.homePageModel![widget.index].region!
                              .services!.length <=
                          1
                      ? 1
                      : 2,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 4.0,
                      mainAxisSpacing: 4.0),
                  itemBuilder: (BuildContext context, int index) {
                    return AttributesComponent(
                        attributeName:
                            '${widget.homePageModel![widget.index].region!.services![index].name}',
                        attributeValue: widget.homePageModel![widget.index]
                                    .region!.services![index].pivot!.enabled ==
                                "1"
                            ? true
                            : false);
                  },
                ),
              ),
            ],
          ),
          // Row(
          //   crossAxisAlignment: CrossAxisAlignment.center,
          //   mainAxisSize: MainAxisSize.min,
          //   children: [
          //     Expanded(
          //       flex: 2,
          //       child: AttributesComponent(
          //           attributeName: "horseback riding", attributeValue: true),
          //     ),
          //     Expanded(
          //       flex: 2,
          //       child: AttributesComponent(
          //         attributeName: "jump obstacles",
          //         attributeValue: false,
          //       ),
          //     ),
          //     Expanded(
          //       flex: 2,
          //       child: AttributesComponent(
          //         attributeName: "jump obstacles",
          //         attributeValue: false,
          //       ),
          //     ),
          //     Expanded(
          //       flex: 2,
          //       child: AttributesComponent(
          //         attributeName: "jump obstacles",
          //         attributeValue: false,
          //       ),
          //     ),
          //   ],
          // ),
          gapH10,
          OutlinedButton(
            onPressed: () {
              Navigator.pushNamed(context, trainingListingScreen,
                  arguments: {"id": widget.homePageModel![widget.index].id});
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
            child: Text("fill in the details".tr, style: black510),
          ),
        ],
      ),
    );
  }
}

class AttributesComponent extends StatelessWidget {
  final String attributeName;
  final bool attributeValue;

  const AttributesComponent(
      {Key? key, required this.attributeName, required this.attributeValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          attributeValue ? Icons.check_rounded : Icons.circle_rounded,
          color: attributeValue ? cPrimaryColor : cRomanSilverColor,
          size: 15,
        ),
        gapH4,
        Text(
          attributeName,
          style: black808,
        )
      ],
    );
  }
}
