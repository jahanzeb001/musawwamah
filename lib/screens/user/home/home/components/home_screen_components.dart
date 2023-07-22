// ignore_for_file: must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:obaiah_mobile_app/reusable_widgets/reusable_button.dart';
import 'package:obaiah_mobile_app/reusable_widgets/reusable_dropdown_formfield.dart';
import 'package:obaiah_mobile_app/screens/user/home/home/controller/home_screen_controller.dart';
import 'package:obaiah_mobile_app/screens/user/home/home/models/get_approved_horses_response.dart';
import 'package:obaiah_mobile_app/screens/user/settings/account/controller/account_controller.dart';
import 'package:obaiah_mobile_app/utils/colors/colors.dart';
import 'package:obaiah_mobile_app/utils/constants/app_urls.dart';
import 'package:obaiah_mobile_app/utils/spacing/gaps.dart';
import 'package:obaiah_mobile_app/utils/spacing/padding.dart';

import '../../../../../generated/assets.dart';
import '../../../../../models/filter_class.dart';
import '../../../../../utils/constants/constants.dart';
import '../../../../../utils/get_storage/get_storage_controller.dart';
import '../../../../../utils/text_styles/textstyles.dart';

class HomePageListViewInfoCard extends StatelessWidget {
  //final HomeModel homePageModel;
  final List<Datum>? homePageModel;
  int index = 0;
  HomePageListViewInfoCard(
      {Key? key, required this.homePageModel, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //   Get.to(() => RegularListingScreen(horseId: homePageModel![index].id));
        Navigator.pushNamed(context, listingScreen, arguments: {
          "horseId": homePageModel![index].id,
          "horseName": homePageModel![index].nameOfHorse,
        });
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
                    " : ${homePageModel![index].user?.fullname ?? ""}",
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
                      homePageModel![index].type ?? "",
                      style: homePageValue,
                    ),
                    gapH10,
                    Text(
                      "color".tr,
                      style: homePageHeading,
                    ),
                    gapH5,
                    Text(
                      homePageModel![index].color ?? "",
                      style: homePageValue,
                    ),
                    gapH10,
                    Text(
                      "age".tr,
                      style: homePageHeading,
                    ),
                    gapH5,
                    Text(
                      homePageModel![index].age.toString(),
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
                      homePageModel![index].nameOfHorse ?? "",
                      style: homePageValue,
                    ),
                    gapH10,
                    Text(
                      "height".tr,
                      style: homePageHeading,
                    ),
                    gapH5,
                    Text(
                      homePageModel![index].height.toString(),
                      style: homePageValue,
                    ),
                    gapH10,
                    Text(
                      "site".tr,
                      style: homePageHeading,
                    ),
                    gapH5,
                    Text(
                      homePageModel![index].city ?? "",
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
                          "${AppUrls.ImagebaseUrl}${homePageModel![index].horseFrontView}",
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
                    //     "${AppUrls.ImagebaseUrl}${homePageModel![index].horseFrontView}",
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
                    gapH4,
                    Row(
                      children: [
                        Text(
                          homePageModel![index].totalPrice.toString(),
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
                OutlinedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, listingScreen, arguments: {
                      "horseId": homePageModel![index].id,
                      "horseName": homePageModel![index].nameOfHorse,
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
                  child: Text("fill in the details".tr,
                      style: const TextStyle(
                          fontFamily: "Tajawal",
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          color: cBlackColor)),
                ),
                gapW25
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/*===============================Grid View Components==========================================*/
class HomePageGridViewInfoCard extends StatelessWidget {
  final List<Datum>? homePageModel;
  int index = 0;

  HomePageGridViewInfoCard(
      {Key? key, required this.homePageModel, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //  Get.to(() => RegularListingScreen(horseId: homePageModel![index].id));
        // SessionController().horseId = homePageModel![index].id;
        Navigator.pushNamed(context, listingScreen, arguments: {
          "horseId": homePageModel![index].id,
          "horseName": homePageModel![index].nameOfHorse,
        });
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
                    " : ${homePageModel![index].user?.fullname}",
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
                        "${AppUrls.ImagebaseUrl}${homePageModel![index].horseFrontView}",
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
                  //     "${AppUrls.ImagebaseUrl}${homePageModel![index].horseFrontView}",
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
                      homePageModel![index].age.toString(),
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
                      homePageModel![index].nameOfHorse ?? "",
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
                      homePageModel![index].city ?? "",
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
                  homePageModel![index].totalPrice ?? "",
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
                  "horseId": homePageModel![index].id,
                  "horseName": homePageModel![index].nameOfHorse,
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
              child: Text("fill in the details".tr,
                  style: const TextStyle(
                      fontFamily: "Tajawal",
                      fontWeight: FontWeight.w500,
                      fontSize: 10,
                      color: cBlackColor)),
            ),
          ],
        ),
      ),
    );
  }
}

class SortingDialog extends StatelessWidget {
  const SortingDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeScreenController = Get.find<HomeScreenController>();
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      alignment: Alignment.bottomCenter,
      clipBehavior: Clip.hardEdge,
      backgroundColor: Colors.transparent,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 185,
            width: 255,
            decoration: BoxDecoration(
                color: cWhiteColor, borderRadius: BorderRadius.circular(10)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                    child: TextButtonComponent(
                  onPressedFunction: () {
                    homeScreenController.getApprovedHorses(sortby: "latest");
                    Navigator.pop(context);
                  },
                  buttonText: "sort by latest",
                )),
                const Divider(height: 1, color: cOnyxColor),
                Expanded(
                    child: TextButtonComponent(
                  onPressedFunction: () {
                    homeScreenController.getApprovedHorses(
                        sortby: "lowest_price");
                    Navigator.pop(context);
                  },
                  buttonText: "order the lowest price first",
                )),
                const Divider(height: 1, color: cOnyxColor),
                Expanded(
                    child: TextButtonComponent(
                  onPressedFunction: () {
                    homeScreenController.getApprovedHorses(
                        sortby: "highest_price");
                    Navigator.pop(context);
                  },
                  buttonText: "order the highest price first",
                )),
              ],
            ),
          ),
          gapH110
        ],
      ),
    );
  }
}

class FilterDialog extends StatelessWidget {
  final List<bool> selectedValueList, filterCheckBoxValueList;

  const FilterDialog({
    Key? key,
    required this.selectedValueList,
    required this.filterCheckBoxValueList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var homeController = Get.find<HomeScreenController>();
    return AlertDialog(
      contentPadding: padA10,
      alignment: Alignment.center,
      clipBehavior: Clip.hardEdge,
      backgroundColor: cCulturedWhiteColor,
      scrollable: true,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 330,
            height: context.height * 0.57,
            child: Obx(() => Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ListTile(
                      leading: const Icon(
                        Icons.menu_rounded,
                        color: cBlackColor,
                        size: 17,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      title: Center(
                          child: Text(
                        "type",
                        style: onyx514,
                      )),
                      onTap: () {
                        homeController.typeSelected.value =
                            !homeController.typeSelected.value;
                      },
                    ),
                    homeController.typeSelected.value
                        ? Container(
                            height: 80,
                            width: double.infinity,
                            //   color: Colors.red,
                            child: GridView.builder(
                              shrinkWrap: true,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 8.0,
                                mainAxisSpacing: 8.0,
                              ),
                              itemCount: homeController.type!.length,
                              itemBuilder: (context, index) {
                                String value = homeController.type![index];
                                return CheckboxListTile(
                                  title: Text(homeController.type![index]),
                                  value: false,
                                  onChanged: (checked) {
                                    if (checked!) {
                                      homeController.selectedtype?.add(value);

                                      print(
                                          homeController.selectedtype!.length);
                                    }
                                    // setState(() {
                                    //   if (checked!) {
                                    //     selectedValues.add(value);
                                    //   } else {
                                    //     selectedValues.remove(value);
                                    //   }
                                    // }

                                    // );
                                  },
                                );
                              },
                            ))
                        : SizedBox(),

                    gapH10,

                    ListTile(
                      leading: const Icon(
                        Icons.menu_rounded,
                        color: cBlackColor,
                        size: 17,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      title: Center(
                          child: Text(
                        "region",
                        style: onyx514,
                      )),
                      onTap: () {
                        homeController.regionSelected.value =
                            !homeController.regionSelected.value;
                      },
                    ),
                    homeController.regionSelected.value
                        ? Container(
                            height: 60,
                            width: double.infinity,
                            color: Colors.red,
                          )
                        : SizedBox(),
                    // Flexible(child: MyListView()),
                    // Flexible(
                    //     child: ListView.separated(
                    //   shrinkWrap: true,
                    //   itemCount: filterNamesList.length,
                    //   separatorBuilder: (BuildContext context, int index) => gapH10,
                    //   itemBuilder: (BuildContext context, int index) {
                    //     return Obx(() {
                    //       return Column(
                    //         mainAxisSize: MainAxisSize.min,
                    //         children: [
                    //           ListTileComponent(
                    //             index: index,
                    //             filterClass: filterNamesList.elementAt(index),
                    //             isSelected: selectedValueList.elementAt(index),
                    //           ),
                    //           gapH10,
                    //           Visibility(
                    //               visible: selectedValueList.elementAt(index),
                    //               child: Container(
                    //                 height: 50,
                    //                 width: context.width * 1,
                    //                 decoration: BoxDecoration(
                    //                     color: cPrimaryColor24Opacity,
                    //                     borderRadius: BorderRadius.circular(10)),
                    //                 child: Row(
                    //                   crossAxisAlignment: CrossAxisAlignment.center,
                    //                   mainAxisAlignment:
                    //                       MainAxisAlignment.spaceEvenly,
                    //                   children: [
                    //                     Row(
                    //                       mainAxisSize: MainAxisSize.min,
                    //                       children: [
                    //                         RichText(
                    //                           text: TextSpan(
                    //                             children: <TextSpan>[
                    //                               TextSpan(
                    //                                   text: "option".tr,
                    //                                   style: onyx712),
                    //                               const TextSpan(text: " "),
                    //                               TextSpan(
                    //                                   text: "1".tr, style: onyx712),
                    //                             ],
                    //                           ),
                    //                         ),
                    //                         gapW20,
                    //                         Obx(() {
                    //                           return ListTileCheckBox(
                    //                               checkBxValue:
                    //                                   filterCheckBoxValueList[
                    //                                       index],
                    //                               onChangeFunction: (val) {
                    //                                 log(val.toString());
                    //                                 log("${filterCheckBoxValueList[index]}");
                    //                                 Get.find<HomeScreenController>()
                    //                                     .changeFilterCheckBoxValue(
                    //                                         index: index,
                    //                                         value: val!);
                    //                               });
                    //                         }),
                    //                       ],
                    //                     ),
                    //                     Row(
                    //                       mainAxisSize: MainAxisSize.min,
                    //                       children: [
                    //                         RichText(
                    //                           text: TextSpan(
                    //                             children: <TextSpan>[
                    //                               TextSpan(
                    //                                   text: "option".tr,
                    //                                   style: onyx712),
                    //                               const TextSpan(text: " "),
                    //                               TextSpan(
                    //                                   text: "2".tr, style: onyx712),
                    //                             ],
                    //                           ),
                    //                         ),
                    //                         gapW20,
                    //                         Obx(() {
                    //                           return ListTileCheckBox(
                    //                               checkBxValue:
                    //                                   filterCheckBoxValueList[
                    //                                       index + 1],
                    //                               onChangeFunction: (val) {
                    //                                 Get.find<HomeScreenController>()
                    //                                     .changeFilterCheckBoxValue(
                    //                                         index: index + 1,
                    //                                         value:
                    //                                             !filterCheckBoxValueList[
                    //                                                 index + 1]);
                    //                               });
                    //                         }),
                    //                       ],
                    //                     ),
                    //                     // AddHorseRadioButton()
                    //                   ],
                    //                 ),
                    //               )),
                    //         ],
                    //       );
                    //     });
                    //   },
                    // )),

                    gapH20,
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Spacer(),
                        Expanded(
                          flex: 3,
                          child: HomeFilterAlertDialogButtonComponent(
                            text: "implementation",
                            backGroundColor: cPrimaryColor,
                            onPressedFunction: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                        gapW10,
                        Expanded(
                          flex: 2,
                          child: HomeFilterAlertDialogButtonComponent(
                            text: "survey",
                            backGroundColor: cRomanSilverColor,
                            onPressedFunction: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                        const Spacer()
                      ],
                    ),
                    HomeFilterAlertDialogButtonComponent(
                      text: "cancel",
                      backGroundColor: cRomanSilverColor,
                      onPressedFunction: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}

class HomePageAlertDialog extends StatelessWidget {
  final TextEditingController fullNameController;
  final TextEditingController regionNameController;
  final TextEditingController cityNameController;

  const HomePageAlertDialog({
    required this.fullNameController,
    required this.regionNameController,
    required this.cityNameController,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var accountController = Get.find<AccountController>();
    final getStorageController = Get.find<GetStorageController>();
    return AlertDialog(
        scrollable: true,
        backgroundColor: cScaffoldBackground,
        contentPadding: padA20,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        content: Container(
          width: 330,
          decoration: const BoxDecoration(color: cScaffoldBackground),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              HomePageFormComponent(
                  text: "full name".tr, textController: fullNameController),
              gapH30,
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: ReusableRegionDropDownFormField(
                        labelAlignment: FloatingLabelAlignment.center,
                        radius: 5),
                  ),
                  gapW20,
                  Expanded(
                    child: HomePageFormComponent(
                        text: "city", textController: cityNameController),
                  ),
                ],
              ),
              gapH30,
              Obx(() => ReusableOutlineUnfixedButton(
                    loading: accountController.updatingUser.value,
                    onPressFunction: () {
                      accountController.UpdateUser2(
                        accountController.uid,
                        fullNameController.text,
                        "",
                        regionNameController.text,
                        cityNameController.text,
                        accountController.getUserModel.data!.mobileNumber ?? "",
                        accountController.getUserModel.data!.bankName ?? "",
                        accountController.getUserModel.data!.ibanNumber ?? "",
                      );
                      getStorageController.box.write("logincount", '1');
                      // Get.snackbar(
                      //     "notification".tr, "your preferences are saved".tr);
                      Navigator.pop(context);
                    },
                    stringText: "save",
                    radius: 7,
                    width: 130,
                    height: 35,
                  ))
            ],
          ),
        ));
  }
}

class TextButtonComponent extends StatelessWidget {
  final String buttonText;
  final Function()? onPressedFunction;

  const TextButtonComponent(
      {Key? key, required this.buttonText, required this.onPressedFunction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextButton(
        onPressed: onPressedFunction,
        style: TextButton.styleFrom(
            foregroundColor: cPrimaryColor, shape: const StadiumBorder()),
        child: FittedBox(
          child: Text(
            buttonText.tr,
            style: onyx718,
          ),
        ),
      ),
    );
  }
}

class ListTileComponent extends StatelessWidget {
  final FilterClass filterClass;
  final bool isSelected;
  final int index;

  const ListTileComponent(
      {Key? key,
      required this.filterClass,
      required this.index,
      required this.isSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: cWhiteColor,
      leading: isSelected
          ? SvgPicture.asset(Assets.searchFilterImagesFilterTileIcon)
          : const Icon(
              Icons.menu_rounded,
              color: cBlackColor,
              size: 17,
            ),
      onTap: () {
        Get.find<HomeScreenController>().changeChoseValue(
          value: isSelected,
          index: index,
        );
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      title: Center(
          child: Text(
        filterClass.filterName.tr,
        style: onyx514,
      )),
    );
  }
}

class HomeFilterAlertDialogButtonComponent extends StatelessWidget {
  final Function()? onPressedFunction;
  final String text;
  final Color backGroundColor;

  const HomeFilterAlertDialogButtonComponent(
      {Key? key,
      required this.text,
      required this.backGroundColor,
      required this.onPressedFunction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressedFunction,
        style: ElevatedButton.styleFrom(
            backgroundColor: backGroundColor,
            foregroundColor: cPrimaryColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
        child: FittedBox(
          child: Text(
            text.tr,
            style: auctionDescriptionBoldTextStyle,
          ),
        ));
  }
}

//====================================================================
class HomePageFormComponent extends StatelessWidget {
  final TextEditingController textController;
  final String text;

  const HomePageFormComponent(
      {Key? key, required this.textController, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textController,
      textAlign: TextAlign.center,
      style: const TextStyle(
          fontFamily: "Tajawal", fontWeight: FontWeight.w700, fontSize: 14),
      decoration: InputDecoration(
        filled: true,
        labelStyle: const TextStyle(
          fontFamily: "Tajawal",
          fontWeight: FontWeight.w700,
          fontSize: 12,
          color: cBlackColor,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        label: Center(child: Text(text.tr)),
        fillColor: cWhiteColor,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: BorderSide.none),
      ),
    );
  }
}

class ListTileCheckBox extends StatelessWidget {
  final bool checkBxValue;
  final Function(bool?)? onChangeFunction;

  const ListTileCheckBox(
      {Key? key, required this.checkBxValue, required this.onChangeFunction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 22,
      width: 22,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4), color: cCheckBackground),
      child: Checkbox(
        value: checkBxValue,
        checkColor: cPrimaryColor,
        fillColor: const MaterialStatePropertyAll(cCheckBackground),
        overlayColor: const MaterialStatePropertyAll(cCheckBackground),
        side: const BorderSide(color: cCheckBackground),
        onChanged: onChangeFunction,
      ),
    );
  }
}
