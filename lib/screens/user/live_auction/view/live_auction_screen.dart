import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:obaiah_mobile_app/screens/user/live_auction/view/rating.dart';
import '../../../../generated/assets.dart';
import '../../../../reusable_widgets/reusable_alertDialog.dart';
import '../../../../reusable_widgets/reusable_appbar.dart';
import '../../../../reusable_widgets/reusable_text.dart';
import '../../../../utils/colors/colors.dart';
import '../../../../utils/constants/lists.dart';
import '../../../../utils/spacing/gaps.dart';
import '../../../../utils/spacing/padding.dart';
import '../../../../utils/text_styles/textstyles.dart';
import '../components/live_auction_components.dart';

class LiveAuctionScreen extends StatefulWidget {
  LiveAuctionScreen({Key? key}) : super(key: key);

  @override
  State<LiveAuctionScreen> createState() => _LiveAuctionScreenState();
}

class _LiveAuctionScreenState extends State<LiveAuctionScreen> {
  int userId = 0;
  @override
  void initState() {
    loadData();
    super.initState();
  }

  loadData() async {
    var uid = getUserId();
    print("*****************************$uid");
    setState(() {
      userId = uid;
    });
    await Future.delayed(Duration(seconds: 1));
  }

  int getUserId() {
    final box = GetStorage();
    return box.read('userId');
  }

  double rating1 = 0.0;
  double rating2 = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: ReusableAppBar(
          onPressFunction: () {},
          titleText: "shafei stable auction",
          textStyle: onyx520,
        ),
        body: Container(
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
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text(
                                  "bidding for a horse".tr,
                                  style: silver510,
                                ),
                                Text(
                                  homePageList[0].name.tr,
                                  style: const TextStyle(
                                      fontFamily: "Tajawal",
                                      color: cRomanSilverColor,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  "highest bid".tr,
                                  style: silver510,
                                ),
                                Text("not you".tr, style: red810),
                              ],
                            ),
                          ],
                        ),
                      ),
                      ClipPath(
                        clipper: const ShapeBorderClipper(
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)))),
                        child: Container(
                          height: 290,
                          width: context.width * 1,
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
                          child: Image.asset(
                              Assets.liveAuctionImagesLiveAuctionImage,
                              fit: BoxFit.cover),
                        ),
                      )
                    ],
                  ),
                ),
                gapH10,
                //Component 2
                Container(
                  height: 145,
                  width: context.width * 1,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: cGhostWhiteColor),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
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
                                  alignment: Alignment.bottomCenter,
                                  child: Container(
                                    height: 65,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white,
                                    ),
                                    child: Center(
                                      child: ReUsableText(
                                          text: homePageList[0].price,
                                          textStyle: auctionLargeTextStyle),
                                    ),
                                  ),
                                ),
                                Align(
                                    alignment: Alignment.topRight,
                                    child: Row(
                                      children: [
                                        gapW20,
                                        Text(
                                          "highest bid".tr,
                                          style: auctionSmallTextStyle,
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
                                  alignment: Alignment.bottomCenter,
                                  child: Container(
                                      height: 65,
                                      width: context.width * 1,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.white,
                                      ),
                                      child: Center(
                                        child: Text(homePageList[0].name,
                                            style: auctionLargeTextStyle),
                                      )),
                                ),
                                Align(
                                    alignment: Alignment.topRight,
                                    child: Row(
                                      children: [
                                        gapW20,
                                        Text(
                                          "the auction is on".tr,
                                          style: auctionSmallTextStyle,
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
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return BidAdditionDialogLiveAuction(
                                  onPressFunction: () {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return BidAmountPaymentDialogLiveAuction(
                                            onPressFunction: () {},
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
                          side: const BorderSide(color: cBlackColor),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          elevation: 0.0,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.add,
                              color: cBlackColor,
                              size: 20,
                            ),
                            gapW5,
                            Text("add bid".tr,
                                style: auctionMediumOnyxTextStyle),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                gapH20,
                //Component 3
                Row(
                  children: [
                    gapW20,
                    Text(
                      "list of horses".tr,
                      style: auctionMediumPrimaryTextStyle,
                    ),
                  ],
                ),
                Flex(
                  direction: Axis.vertical,
                  children: [
                    Container(
                      padding: padA10,
                      width: context.width * 1,
                      decoration: BoxDecoration(
                        color: cCulturedWhiteColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 9,
                        separatorBuilder: (BuildContext context, int index) =>
                            gapH10,
                        itemBuilder: (BuildContext context, int index) {
                          return ContainerTileLiveAuction(
                            homeModel: homePageList.elementAt(index),
                            index: index + 1,
                          );
                        },
                      ),
                    ),
                  ],
                ),
                gapH20,

                //Component 4
                SizedBox(
                  height: context.isPortrait ? 359 : 159,
                  width: context.width * 1,
                  child: Stack(children: [
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: InkWell(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (context) => const ShowDescriptionDialog(
                                    titleText: "auction policy:",
                                    descriptionText:
                                        '''Lorem Ipsum Dollar Set Amit, Conciectator Adaiba Yesking Aliyeet, Set Do Ayosmod Tempore. Uncaideduentiot Laboure at Dollar Magna Aliquia. Ut Anime Ad Minim Feinaim, Kiwas Nostride.Elixir Situation YELLAMCO Laboras Nessie Ytellurim Ipsum Dollar Set Amit, CONCectitor Adaiba Yesking Alite, Set Do Ayosmod Tempor.Uncaideduentiot Laboure at Dollar Magna Aliquia. Ut Anime Ad Minim Feinaim, Kiwas Nostride.Elixir Situation YELLAMCO Laboras Nessie Ytellurim Ipsum Dollar Set Amit, CONCectitor Adaiba Yesking Alite, Set Do Ayosmod Tempor.Uncaideduentiot Laboure at Dollar Magna Aliquia. Ut Anime Ad Minim Feinaim, Kiwas Nostride.Elixir Situation Yllameco Laboras Nessi Optionit Laborit It Dollar Magna Aliquia. Ut Anime Ad Minim Feinaim, Kiwas Nostride.''',
                                    isThirdTextChild: true,
                                    bottomText:
                                        "your participation in the auction means that you agree to the above terms",
                                  ));
                        },
                        child: Container(
                          padding: EdgeInsets.only(
                              left: 20, right: 20, top: 20, bottom: 22),
                          height: context.isPortrait ? 350 : 150,
                          width: context.width * 1,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '''Lorem Ipsum Dollar Set Amit, Conciectator Adaiba Yesking Aliyeet, Set Do Ayosmod Tempore. Uncaideduentiot Laboure at Dollar Magna Aliquia. Ut Anime Ad Minim Feinaim, Kiwas Nostride.Elixir Situation YELLAMCO Laboras Nessie Ytellurim Ipsum Dollar Set Amit, CONCectitor Adaiba Yesking Alite, Set Do Ayosmod Tempor.Uncaideduentiot Laboure at Dollar Magna Aliquia. Ut Anime Ad Minim Feinaim, Kiwas Nostride.Elixir Situation YELLAMCO Laboras Nessie Ytellurim Ipsum Dollar Set Amit, CONCectitor Adaiba Yesking Alite, Set Do Ayosmod Tempor.Uncaideduentiot Laboure at Dollar Magna Aliquia. Ut Anime Ad Minim Feinaim, Kiwas Nostride.Elixir Situation Yllameco Laboras Nessi Optionit Laborit It Dollar Magna Aliquia. Ut Anime Ad Minim Feinaim, Kiwas Nostride.'''
                                    .tr,
                                textAlign: TextAlign.justify,
                                maxLines: context.isPortrait ? 16 : 5,
                                softWrap: true,
                                overflow: TextOverflow.ellipsis,
                                style: onyx413,
                              ),
                              const Spacer(),
                              Center(
                                child: Text(
                                  "your participation in the auction means that you agree to the above terms"
                                      .tr,
                                  textAlign: TextAlign.justify,
                                  style: primary714,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Align(
                        alignment: Alignment.topRight,
                        child: Row(
                          children: [
                            gapW20,
                            Text(
                              "auction policy:".tr,
                              style: auctionMediumPrimaryTextStyle,
                            ),
                          ],
                        )),
                  ]),
                ),
                gapH20,
                //Component 5
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
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 2,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(
                                          Assets.auctionImagesVerified),
                                      gapW5,
                                      Text(
                                        "documented".tr,
                                        style: auctionMediumPrimaryTextStyle,
                                      ),
                                    ],
                                  ),
                                  gapH5,
                                  const Text(
                                    "مربط النايفة",
                                    style: auctionMediumOnyxTextStyle,
                                  ),
                                  Text(homePageList[0].owner,
                                      style: auctionDescriptionTextStyle),
                                ],
                              ),
                            ),
                            Expanded(
                                flex: 3,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Column(
                                          mainAxisSize: MainAxisSize.min,
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
                                                children: <TextSpan>[
                                                  TextSpan(
                                                    text: homePageList[0].sales,
                                                  ),
                                                  TextSpan(
                                                    text: " ",
                                                  ),
                                                  TextSpan(text: 'horses'.tr),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.min,
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
                                                children: <TextSpan>[
                                                  TextSpan(
                                                    text:
                                                        homePageList[0].rating,
                                                  ),
                                                  TextSpan(
                                                    text: " ",
                                                  ),
                                                  TextSpan(text: 'rating'.tr),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Directionality(
                                      textDirection: TextDirection.ltr,
                                      child: RatingBar(
                                          initialRating: 3,
                                          direction: Axis.horizontal,
                                          allowHalfRating: true,
                                          itemCount: 4,
                                          onRatingUpdate: (rating) {
                                            log(rating.toString());

                                            Get.to(() => MyWidget());
                                          },
                                          itemSize: 45,
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
                              style: auctionMediumPrimaryTextStyle,
                            ),
                          ],
                        )),
                  ]),
                ),
              ],
            ),
          ),
        ));
  }
}
