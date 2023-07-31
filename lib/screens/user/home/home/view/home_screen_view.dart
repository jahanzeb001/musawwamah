import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:obaiah_mobile_app/screens/user/add_new_horse/controller/add_new_horse_controller.dart';
import 'package:obaiah_mobile_app/screens/user/auth/authentication/view/login.dart';
import 'package:obaiah_mobile_app/utils/constants/app_urls.dart';
import 'package:obaiah_mobile_app/utils/constants/custom_error.dart';
import 'package:obaiah_mobile_app/utils/constants/no_data_message.dart';
import 'package:obaiah_mobile_app/utils/get_storage/get_storage_controller.dart';
import 'package:obaiah_mobile_app/utils/spacing/gaps.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../../../reusable_widgets/reusable_bottom_appbar.dart';
import '../../../../../reusable_widgets/reusable_search_sorting_component.dart';
import '../../../../../utils/colors/colors.dart';
import '../../../../../utils/constants/constants.dart';
import '../../../settings/wallet_portfolio/controller/wallet_portfolio_controller.dart';
import '../components/home_screen_components.dart';
import '../controller/home_screen_controller.dart';

class HomeScreenView extends StatefulWidget {
  const HomeScreenView({Key? key}) : super(key: key);

  @override
  State<HomeScreenView> createState() => _HomeScreenViewState();
}

class _HomeScreenViewState extends State<HomeScreenView> {
  final homeScreenController = Get.find<HomeScreenController>();
  final getStorageController = Get.find<GetStorageController>();
  final addNewHorseController = Get.find<AddNewHorseController>();
  final walletPortfolioController = Get.put(WalletPortfolioController());

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final List sliderimages = ['banner', 'banner_2'];
  final List<String> letters = [
    "",
    "",
  ];
  bool _isPlaying = false;
  var _sliderKey = GlobalKey();
  @override
  initState() {
    super.initState();

    Future.delayed(Duration.zero, () {
      if (firebaseAuth.currentUser == null) {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return LoginScreen();
          },
        ));
      }
      log('login count = ${getStorageController.box.read("logincount")}');
      if (getStorageController.box.read("logincount") == '0' ||
          getStorageController.box.read("logincount") == null) {
        showDialog(
            context: context,
            builder: (context) => HomePageAlertDialog(
                  fullNameController: homeScreenController.fullNameController,
                  cityNameController: homeScreenController.cityNameController,
                  regionNameController:
                      homeScreenController.regionNameController,
                ));
      }

      // if (getStorageController.box.read("isNewUser") == null) {
      //   getStorageController.box.write("isNewUser", false);
      //   // showDialog(
      //   //     context: context,
      //   //     builder: (context) => HomePageAlertDialog(
      //   //           fullNameController: homeScreenController.fullNameController,
      //   //           cityNameController: homeScreenController.cityNameController,
      //   //           regionNameController:
      //   //               homeScreenController.regionNameController,
      //   //         ));
      // }
    });
    homeScreenController.getApprovedHorses();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
          height: context.height * 1,
          width: context.width * 1,
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Obx(() => addNewHorseController.loadingData.value
                        ? Center(
                            child: Padding(
                            padding: const EdgeInsets.only(top: 15, bottom: 15),
                            child: CircularProgressIndicator(
                              color: cPrimaryColor,
                            ),
                          ))
                        : Container(
                            height: MediaQuery.of(context).orientation ==
                                    Orientation.portrait
                                ? 120
                                : 200,
                            width: context.width * 1,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              // image: DecorationImage(
                              //     image: AssetImage(
                              //         Assets.homeImagesHorseImageLarge),
                              //     fit: BoxFit.cover)
                            ),
                            child: Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: CarouselSlider.builder(
                                      key: _sliderKey,
                                      unlimitedMode: true,
                                      enableAutoSlider: true,
                                      slideBuilder: (index) {
                                        return CachedNetworkImage(
                                          imageUrl:
                                              "${AppUrls.ImagebaseUrl}${addNewHorseController.images[index].toString()}",
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
                                        );
                                        // Container(
                                        //   decoration: BoxDecoration(
                                        //       borderRadius: BorderRadius.all(
                                        //           Radius.circular(10)),
                                        //       image: DecorationImage(
                                        //           image: AssetImage(
                                        //               '${sliderimages![index]}'),
                                        //           fit: BoxFit.cover)),
                                        //   alignment: Alignment.center,
                                        //   child: Text(
                                        //     letters[index],
                                        //     style: TextStyle(
                                        //         fontFamily: "Tajawal",
                                        //         color: cWhiteColor,
                                        //         fontSize: 18,
                                        //         fontWeight: FontWeight.w700),
                                        //   ),
                                        // );
                                      },
                                      slideTransform: CubeTransform(),
                                      itemCount:
                                          addNewHorseController.images.length),
                                ),

                                // CachedNetworkImage(
                                //   imageUrl:
                                //       "${AppUrls.ImagebaseUrl}${addNewHorseController.expertOpinionModel.settings?.banner ?? ""}",
                                //   imageBuilder: (context, imageProvider) =>
                                //       Container(
                                //     decoration: BoxDecoration(
                                //       image: DecorationImage(
                                //         //image size fill
                                //         image: imageProvider,
                                //         fit: BoxFit.cover,
                                //       ),
                                //     ),
                                //   ),
                                //   placeholder: (context, url) => Container(
                                //     alignment: Alignment.center,
                                //     child: CircularProgressIndicator(
                                //       color: cPrimaryColor,
                                //     ), // you can add pre loader iamge as well to show loading.
                                //   ), //show progress  while loading image
                                //   errorWidget: (context, url, error) =>
                                //       Container(
                                //     alignment: Alignment.center,
                                //     child: CircularProgressIndicator(
                                //       color: cPrimaryColor,
                                //     ), // you can add pre loader iamge as well to show loading.
                                //   ), //s
                                //   //show no iamge availalbe image on error laoding
                                // ),

                                // Center(
                                //   child: Text(
                                //     "advertising banner".tr,
                                //     style: const TextStyle(
                                //         fontFamily: "Tajawal",
                                //         color: cWhiteColor,
                                //         fontSize: 18,
                                //         fontWeight: FontWeight.w700),
                                //   ),
                                // ),
                              ],
                            ),
                          )),
                    gapH10,
                    Container(
                      height: 100,
                      padding: EdgeInsets.only(left: 5, right: 5),
                      child: Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, hospitalityHomeScreen);
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  'assets/images/home_images/Hospitality.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, trainingHomeScreen);
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  'assets/images/home_images/Training.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    gapH10,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "the last horses".tr,
                          style: const TextStyle(
                              fontFamily: "Tajawal",
                              fontWeight: FontWeight.w700,
                              fontSize: 18),
                        ),
                        IconButton(
                          onPressed: () {
                            homeScreenController.changeView();
                          },
                          icon: Obx(() => homeScreenController.showInGrid.value
                              ? const Icon(Icons.list)
                              : const Icon(Icons.grid_view_rounded)),
                          color: cBlackColor,
                        ),
                      ],
                    ),
                    Flexible(
                      child: Obx(
                        () => homeScreenController.showInGrid.value
                            ? homeScreenController.loadingApprovedHorse.value
                                ? Center(
                                    child: Padding(
                                    padding: const EdgeInsets.only(top: 150),
                                    child: CircularProgressIndicator(
                                      color: cPrimaryColor,
                                    ),
                                  ))
                                : homeScreenController
                                            .errorGettingApprovedHorses.value !=
                                        ""
                                    ? Center(
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(top: 150),
                                          child: Custom_Error(
                                              onpressed: () {
                                                homeScreenController
                                                    .getApprovedHorses();
                                              },
                                              error: homeScreenController
                                                  .errorGettingApprovedHorses
                                                  .value),
                                        ),
                                      )
                                    : homeScreenController.approvedHorsesModel
                                                .data!.length ==
                                            0
                                        ? Center(
                                            child: Padding(
                                            padding:
                                                const EdgeInsets.only(top: 150),
                                            child: NoDataMessage(
                                                message: "No Data Found"),
                                          ))
                                        : GridView.builder(
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            shrinkWrap: true,
                                            // itemCount: homePageList.length,
                                            itemCount: homeScreenController
                                                .approvedHorsesModel
                                                .data!
                                                .length,
                                            gridDelegate:
                                                const SliverGridDelegateWithFixedCrossAxisCount(
                                                    mainAxisExtent: 300,
                                                    crossAxisCount: 2,
                                                    crossAxisSpacing: 4.0,
                                                    mainAxisSpacing: 4.0),
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return HomePageGridViewInfoCard(
                                                // homePageModel: homePageList
                                                //     .elementAt(index)
                                                homePageModel:
                                                    homeScreenController
                                                        .approvedHorsesModel
                                                        .data,
                                                index: index,
                                              );
                                            },
                                          )
                            : homeScreenController.loadingApprovedHorse.value
                                ? Center(
                                    child: Padding(
                                    padding: const EdgeInsets.only(top: 150),
                                    child: CircularProgressIndicator(
                                      color: cPrimaryColor,
                                    ),
                                  ))
                                : homeScreenController
                                            .errorGettingApprovedHorses.value !=
                                        ""
                                    ? Center(
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(top: 150),
                                          child: Custom_Error(
                                              onpressed: () {
                                                homeScreenController
                                                    .getApprovedHorses();
                                              },
                                              error: homeScreenController
                                                  .errorGettingApprovedHorses
                                                  .value),
                                        ),
                                      )
                                    : homeScreenController.approvedHorsesModel
                                                .data?.length ==
                                            0
                                        ? Center(
                                            child: NoDataMessage(
                                            message: "No Data Found",
                                          ))
                                        : ListView.separated(
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            shrinkWrap: true,
                                            itemCount: homeScreenController
                                                .approvedHorsesModel
                                                .data!
                                                .length,
                                            separatorBuilder:
                                                (BuildContext context,
                                                        int index) =>
                                                    gapH15,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return HomePageListViewInfoCard(
                                                // homePageModel:
                                                //     homePageList.elementAt(index)
                                                homePageModel:
                                                    homeScreenController
                                                        .approvedHorsesModel
                                                        .data,
                                                index: index,
                                              );
                                            },
                                          ),
                      ),
                    ),
                    gapH20,
                    // ReusableOutlineUnfixedButton(
                    //     onPressFunction: () {
                    //       Navigator.pushNamed(context, homeAuctionScreen);
                    //     },
                    //     radius: 10,
                    //     width: 200,
                    //     height: 40,
                    //     stringText: "auction"),
                    gapH100
                  ],
                ),
              ),
              ResultSortingComponent(filterDialogFunction: () {
                homeScreenController.getPropertiseList();

                showDialog(
                    context: context,
                    builder: (context) => FilterDialog(
                          filterCheckBoxValueList:
                              homeScreenController.filterCheckBoxValueList,
                          selectedValueList:
                              homeScreenController.filterValuesList,
                        ));
              }, sortingDialogFunction: () {
                showDialog(
                    context: context,
                    builder: (context) => const SortingDialog());
              }),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const CustomBottomAppBar(selectedIndex: 4),
    );
  }
}
