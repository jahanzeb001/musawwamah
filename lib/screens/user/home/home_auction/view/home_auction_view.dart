import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:obaiah_mobile_app/screens/user/home/home_auction/model/get_bidding_horse_response.dart';
import 'package:obaiah_mobile_app/utils/constants/custom_error.dart';
import 'package:obaiah_mobile_app/utils/constants/no_data_message.dart';
import 'package:obaiah_mobile_app/utils/spacing/gaps.dart';
import 'package:obaiah_mobile_app/utils/spacing/padding.dart';
import '../../../../../generated/assets.dart';
import '../../../../../reusable_widgets/reusable_bottom_appbar.dart';
import '../../../../../utils/colors/colors.dart';
import '../../../../../utils/constants/app_urls.dart';
import '../../../../../utils/constants/constants.dart';
import '../../../settings/wallet_portfolio/controller/wallet_portfolio_controller.dart';
import '../components/home_auction_components.dart';
import '../controller/home_auction_controller.dart';
import '../notification/view/home_auction_notification.dart';

class HomeAuctionView extends StatefulWidget {
  HomeAuctionView({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeAuctionView> createState() => _HomeAuctionViewState();
}

class _HomeAuctionViewState extends State<HomeAuctionView> {
  final homeScreenController = Get.find<HomeAuctionController>();
  final walletPortfolioController = Get.find<WalletPortfolioController>();
  List<Datum> searchResults = [];
  var nodatafound = false;
  var userbalance = '';
  @override
  void initState() {
    homeScreenController.getUserData();
    homeScreenController.getBiddingHorse();
    walletPortfolioController.getUserId();

    final box = GetStorage();

    setState(() {
      userbalance = box.read('accbal').toString();
      log(userbalance);
    });
    // TODO: implement initState
    super.initState();
    //walletPortfolioController.getMyWallet(walletPortfolioController.userId!);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        height: context.height * 1,
        width: context.width * 1,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: padA15,
                height:
                    MediaQuery.of(context).orientation == Orientation.portrait
                        ? 90
                        : 120,
                width: context.width * 1,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  color: cPrimaryColor,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "your balance is".tr,
                              style: const TextStyle(
                                  fontFamily: "Tajawal",
                                  color: cOnyxColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12),
                            ),
                            const Text(
                              ":",
                              style: TextStyle(
                                  fontFamily: "Tajawal",
                                  color: cOnyxColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              '$userbalance',
                              style: TextStyle(
                                  fontFamily: "Tajawal",
                                  color: cBlackColor,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 24),
                            ),
                            Text(
                              "riyal".tr,
                              style: const TextStyle(
                                  fontFamily: "Tajawal",
                                  color: cBlackColor,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 24),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Spacer(),
                    InkWell(
                        onTap: () {
                          Get.to(() => HomeAuctionNotification());
                        },
                        child: Container(
                          padding: padA5,
                          color: Colors.transparent,
                          alignment: Alignment.center,
                          height: 30,
                          width: 30,
                          child: SvgPicture.asset(
                            Assets.homeAuctionImagesBell,
                            height: 21,
                            width: 21,
                          ),
                        )),
                    gapW15,
                    InkWell(
                        onTap: () {
                          homeScreenController.toggleSearchField();

                          print(homeScreenController.isSearchFieldShow.value);
                        },
                        child: Container(
                          padding: padA5,
                          alignment: Alignment.center,
                          color: Colors.transparent,
                          height: 30,
                          width: 30,
                          child: SvgPicture.asset(
                            Assets.homeAuctionImagesSearch,
                            height: 21,
                            width: 21,
                          ),
                        )),
                    gapW20,
                  ],
                ),
              ),
              Obx(() => homeScreenController.isSearchFieldShow.value
                  ? gapH20
                  : gapH40),
              Obx(() => homeScreenController.isSearchFieldShow.value
                  ? Container(
                      height: 50,
                      child: TextField(
                        onChanged: (value) {
                          if (value.length == 0) {
                            print(value.length);
                            searchResults = [];
                            setState(() {});
                          } else {
                            print(value.length);
                            search(homeScreenController.getBiddingHorseModel,
                                value);
                            setState(() {});
                          }
                        },
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(top: 10, left: 15),
                          filled: true,
                          fillColor: Colors.grey[300],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(300.0),
                          ),
                          hintText: 'Search Here',
                        ),
                      ),
                    )
                  : SizedBox()),
              Obx(() => homeScreenController.isSearchFieldShow.value
                  ? gapH15
                  : gapH1),
              Align(
                alignment: Alignment.topRight,
                child: Text(
                  "auctions ending soon".tr,
                  style: const TextStyle(
                      fontFamily: "Tajawal",
                      fontWeight: FontWeight.w700,
                      fontSize: 18),
                ),
              ),
              gapH20,
              searchResults.isNotEmpty
                  ? Flexible(
                      child: ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: searchResults.length,
                        separatorBuilder: (BuildContext context, int index) =>
                            gapH15,
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            onTap: () {
                              // Navigator.pushNamed(context, auctionScreen,
                              //     arguments: {"homePageModel": homePageModel});
                            },
                            child: Container(
                              padding: padA15,
                              decoration: BoxDecoration(
                                color: cWhiteColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        "owner".tr,
                                        style: const TextStyle(
                                            fontFamily: "Tajawal",
                                            color: cOnyxColor,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Text(
                                        " : ${searchResults.elementAt(index).user!.fullname}",
                                        style: const TextStyle(
                                            fontFamily: "Tajawal",
                                            color: cOnyxColor,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      const Spacer(),
                                      Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            "the remaining time".tr,
                                            style: const TextStyle(
                                                fontFamily: "Tajawal",
                                                color: cRomanSilverColor,
                                                fontSize: 10,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text(
                                                '${searchResults.elementAt(index).timeLeft}',
                                                style: const TextStyle(
                                                    fontFamily: "Tajawal",
                                                    color: cRomanSilverColor,
                                                    fontSize: 10,
                                                    fontWeight:
                                                        FontWeight.w900),
                                              ),
                                              Text(
                                                "hour".tr,
                                                style: const TextStyle(
                                                    fontFamily: "Tajawal",
                                                    color: cRomanSilverColor,
                                                    fontSize: 10,
                                                    fontWeight:
                                                        FontWeight.w900),
                                              ),
                                            ],
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  gapH10,
                                  Container(
                                    width: context.width,
                                    height: 150,
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(10)),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(10)),
                                      child: CachedNetworkImage(
                                        imageUrl:
                                            "${AppUrls.ImagebaseUrl}${searchResults.elementAt(index).horseFrontView}",
                                        imageBuilder:
                                            (context, imageProvider) =>
                                                Container(
                                          decoration: BoxDecoration(
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
                                          child: CircularProgressIndicator(
                                            color: cPrimaryColor,
                                          ), // you can add pre loader iamge as well to show loading.
                                        ), //show progress  while loading image
                                        errorWidget: (context, url, error) =>
                                            Container(
                                          alignment: Alignment.center,
                                          child: CircularProgressIndicator(
                                            color: cPrimaryColor,
                                          ), // you can add pre loader iamge as well to show loading.
                                        ), //s
                                        //show no iamge availalbe image on error laoding
                                      ),

                                      // Image.network(
                                      //   "${AppUrls.ImagebaseUrl}${homePageModel.horseFrontView}",
                                      //   fit: BoxFit.cover,
                                      // ),
                                    ),
                                  ),
                                  gapH10,
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "highest bid".tr,
                                            style: const TextStyle(
                                                fontFamily: "Tajawal",
                                                color: cRomanSilverColor,
                                                fontWeight: FontWeight.w400,
                                                fontSize: 10),
                                          ),
                                          gapH5,
                                          Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              searchResults
                                                          .elementAt(index)
                                                          .bids!
                                                          .length ==
                                                      0
                                                  ? Text(
                                                      "No Bid Yet",
                                                      style: const TextStyle(
                                                          fontFamily: "Tajawal",
                                                          color:
                                                              cRomanSilverColor,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize: 10),
                                                    )
                                                  // searchResults.elementAt(index).amount.toString()
                                                  : Text(
                                                      searchResults
                                                          .elementAt(index)
                                                          .maxBid
                                                          .toString(),
                                                      style: const TextStyle(
                                                          fontFamily: "Tajawal",
                                                          color: cBlackColor,
                                                          fontWeight:
                                                              FontWeight.w800,
                                                          fontSize: 18),
                                                    ),
                                              searchResults
                                                          .elementAt(index)
                                                          .bids!
                                                          .length ==
                                                      0
                                                  ? Text(
                                                      "",
                                                      style: const TextStyle(
                                                          fontFamily: "Tajawal",
                                                          color:
                                                              cRomanSilverColor,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize: 10),
                                                    )
                                                  : Text(
                                                      "riyal".tr,
                                                      style: const TextStyle(
                                                          fontFamily: "Tajawal",
                                                          color: cBlackColor,
                                                          fontWeight:
                                                              FontWeight.w800,
                                                          fontSize: 18),
                                                    ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      OutlinedButton(
                                        onPressed: () {
                                          Navigator.pushNamed(
                                            context,
                                            auctionScreen,
                                            arguments: {
                                              "horseId": int.parse(
                                                  '${searchResults.elementAt(index).id}'),
                                              "images": [
                                                "${AppUrls.ImagebaseUrl}${searchResults.elementAt(index).horseFrontView}",
                                                "${AppUrls.ImagebaseUrl}${searchResults.elementAt(index).horseBackView}",
                                                "${AppUrls.ImagebaseUrl}${searchResults.elementAt(index).horseImageFromLeft}",
                                                "${AppUrls.ImagebaseUrl}${searchResults.elementAt(index).horseImageFromRight}"
                                              ],
                                              "remainingTime": searchResults
                                                  .elementAt(index)
                                                  .timeLeft,
                                            },
                                          );
                                        },
                                        style: ElevatedButton.styleFrom(
                                          shadowColor: cPrimaryColor,
                                          foregroundColor: cPrimaryColor,
                                          side: const BorderSide(
                                              color: cBlackColor),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                          ),
                                          elevation: 0.0,
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text("add bid".tr,
                                                style: const TextStyle(
                                                    fontFamily: "Tajawal",
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 12,
                                                    color: cBlackColor)),
                                            gapW5,
                                            const Icon(
                                              Icons.add,
                                              color: cBlackColor,
                                              size: 20,
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
                        },
                      ),
                    )
                  : nodatafound == true
                      ? Center(
                          child: Padding(
                          padding: const EdgeInsets.only(top: 150),
                          child: NoDataMessage(
                              message:
                                  "No data matching search an other keyword!"),
                        ))
                      : Obx(
                          () => homeScreenController.loading.value
                              ? Center(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 150),
                                    child: CircularProgressIndicator(
                                      color: cPrimaryColor,
                                    ),
                                  ),
                                )
                              : homeScreenController.error.value != ""
                                  ? Center(
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(top: 150),
                                        child: Custom_Error(
                                            onpressed: () {
                                              homeScreenController
                                                  .getBiddingHorse();
                                            },
                                            error: homeScreenController
                                                .error.value),
                                      ),
                                    )
                                  : homeScreenController.getBiddingHorseModel
                                              .data?.length ==
                                          0
                                      ? Center(
                                          child: Padding(
                                          padding:
                                              const EdgeInsets.only(top: 150),
                                          child: NoDataMessage(
                                              message: "No Data Found"),
                                        ))
                                      : Flexible(
                                          child: ListView.separated(
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            shrinkWrap: true,
                                            itemCount: homeScreenController
                                                .getBiddingHorseModel
                                                .data!
                                                .length,
                                            separatorBuilder:
                                                (BuildContext context,
                                                        int index) =>
                                                    gapH15,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return HomeAuctionInfoCard(
                                                index: index,
                                                homePageModel:
                                                    homeScreenController
                                                        .getBiddingHorseModel
                                                        .data![index],
                                                remineddate:
                                                    homeScreenController
                                                        .getBiddingHorseModel
                                                        .data![index]
                                                        .dateForAution,
                                              );
                                            },
                                          ),
                                        ),
                        ),
            ],
          ),
        ),
      )),
      bottomNavigationBar: const CustomBottomAppBar(selectedIndex: 1),
    );
  }

  ////////////////////search horse

  void search(GetBidingHorseResponse response, String searchKeyword) {
    searchResults = [];
    searchResults = response.data!.where((datum) {
      // Search in the desired properties of the Datum object
      return datum.nameOfHorse
              ?.toLowerCase()
              .contains(searchKeyword.toLowerCase()) ==
          true;
    }).toList();

    if (searchResults.isNotEmpty) {
      // Found matching data
      nodatafound = false;

      for (var datum in searchResults) {
        print('Horse Name: ${datum.nameOfHorse}');
        print('Father\'s Name: ${datum.fathersName}');
        print('Mother\'s Name: ${datum.mothersName}');
        print('-------------------------');
      }
    } else {
      // No matching data found
      nodatafound = true;
      print('No matching data found.');
    }
  }
}
