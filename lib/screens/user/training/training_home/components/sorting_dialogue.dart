import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:obaiah_mobile_app/generated/assets.dart';
import 'package:obaiah_mobile_app/screens/user/home/home/components/home_screen_components.dart';
import 'package:obaiah_mobile_app/screens/user/training/training_home/controller/training_home_controller.dart';
import 'package:obaiah_mobile_app/utils/colors/colors.dart';
import 'package:obaiah_mobile_app/utils/spacing/gaps.dart';
import 'package:obaiah_mobile_app/utils/spacing/padding.dart';

class SortingDialogBox extends StatelessWidget {
  const SortingDialogBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sortByRatingController = Get.find<TrainingHomeController>();
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
                    sortByRatingController.getMyTraning(sortBy: "ratting");
                    Navigator.pop(context);
                  },
                  buttonText: "Sort by rating",
                )),
                const Divider(height: 1, color: cOnyxColor),
                Expanded(
                    child: TextButtonComponent(
                  onPressedFunction: () {
                    sortByRatingController.getMyTraning(sortBy: "lowest_price");
                    Navigator.pop(context);
                  },
                  buttonText: "order the lowest price first",
                )),
                const Divider(height: 1, color: cOnyxColor),
                Expanded(
                    child: TextButtonComponent(
                  onPressedFunction: () {
                    sortByRatingController.getMyTraning(
                        sortBy: "highest_price");
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

////////////////////////filter dialogue
class FilterDialogBox extends StatefulWidget {
  final List<bool> selectedValueList, filterCheckBoxValueList;

  FilterDialogBox({
    Key? key,
    required this.selectedValueList,
    required this.filterCheckBoxValueList,
  }) : super(key: key);

  @override
  State<FilterDialogBox> createState() => _FilterDialogBoxState();
}

class _FilterDialogBoxState extends State<FilterDialogBox> {
  var priceController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final sortByRatingController = Get.find<TrainingHomeController>();
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
          Flexible(
              child: Container(
                  margin: EdgeInsets.only(top: 20),
                  // height: 230,
                  // color: Colors.red,
                  child: Obx(
                    () => SingleChildScrollView(
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              sortByRatingController.isRegionShow.value =
                                  !sortByRatingController.isRegionShow.value;
                            },
                            child: Container(
                              height: 40,
                              color: Colors.white,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 10,
                                  ),
                                  sortByRatingController.isRegionShow.value
                                      ? SvgPicture.asset(Assets
                                          .searchFilterImagesFilterTileIcon)
                                      : const Icon(
                                          Icons.menu_rounded,
                                          color: cBlackColor,
                                          size: 17,
                                        ),
                                  SizedBox(
                                    width: 70,
                                  ),
                                  Text("Region"),
                                  SizedBox(
                                    width: 20,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          sortByRatingController.isRegionShow.value
                              ? Container(
                                  margin: EdgeInsets.only(bottom: 10),
                                  height: 100,
                                  color: cPrimaryColor24Opacity,
                                  child: ListView.builder(
                                      padding: EdgeInsets.only(top: 0),
                                      itemCount: sortByRatingController
                                          .propertiseModel.region!.length,
                                      itemBuilder: (context, index) {
                                        final region = sortByRatingController
                                            .propertiseModel.region![index];
                                        return ListTile(
                                          title: Text(region.region ?? ""),
                                          trailing: Checkbox(
                                            checkColor: cPrimaryColor,
                                            activeColor: cWhiteColor,
                                            value: region.isRegionSelected,
                                            onChanged: (newValue) {
                                              setState(() {
                                                for (int i = 0;
                                                    i <
                                                        sortByRatingController
                                                            .propertiseModel
                                                            .region!
                                                            .length;
                                                    i++) {
                                                  sortByRatingController
                                                      .propertiseModel
                                                      .region![i]
                                                      .isRegionSelected = false;
                                                }
                                                sortByRatingController
                                                        .propertiseModel
                                                        .region![index]
                                                        .isRegionSelected =
                                                    newValue!;

                                                sortByRatingController
                                                        .regionSelectedValue =
                                                    (newValue
                                                        ? region.region
                                                        : "")!;
                                              });

                                              print(
                                                  "*********************${sortByRatingController.regionSelectedValue}");
                                            },
                                          ),
                                        );
                                      }),
                                )
                              : SizedBox(),

                          ////////////////////price

                          SizedBox(
                            height: 8,
                          ),

                          GestureDetector(
                            onTap: () {
                              sortByRatingController.isPriceShow.value =
                                  !sortByRatingController.isPriceShow.value;

                              sortByRatingController.isRegionShow.value = false;
                            },
                            child: Container(
                              height: 40,
                              color: Colors.white,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 10,
                                  ),
                                  sortByRatingController.isPriceShow.value
                                      ? SvgPicture.asset(Assets
                                          .searchFilterImagesFilterTileIcon)
                                      : const Icon(
                                          Icons.menu_rounded,
                                          color: cBlackColor,
                                          size: 17,
                                        ),
                                  SizedBox(
                                    width: 70,
                                  ),
                                  Text("The Price"),
                                  SizedBox(
                                    width: 20,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          sortByRatingController.isPriceShow.value
                              ? Container(
                                  margin: EdgeInsets.only(bottom: 10),
                                  height: 50,
                                  //   color: cPrimaryColor24Opacity,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10.0),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.3),
                                          spreadRadius: 2,
                                          blurRadius: 5,
                                          offset: Offset(0,
                                              3), // changes position of shadow
                                        ),
                                      ],
                                    ),
                                    child: TextField(
                                      cursorColor: cPrimaryColor24Opacity,
                                      controller: priceController,
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        hintText: 'Enter price...',
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: 16.0, vertical: 12.0),
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ))
                              : SizedBox(),

                          ///////////////////////training type
                          SizedBox(
                            height: 8,
                          ),

                          GestureDetector(
                            onTap: () {
                              sortByRatingController.isTrainingTypeShow.value =
                                  !sortByRatingController
                                      .isTrainingTypeShow.value;

                              sortByRatingController.isPriceShow.value = false;
                            },
                            child: Container(
                              height: 40,
                              color: Colors.white,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 10,
                                  ),
                                  sortByRatingController
                                          .isTrainingTypeShow.value
                                      ? SvgPicture.asset(Assets
                                          .searchFilterImagesFilterTileIcon)
                                      : const Icon(
                                          Icons.menu_rounded,
                                          color: cBlackColor,
                                          size: 17,
                                        ),
                                  SizedBox(
                                    width: 70,
                                  ),
                                  Text("Training Type"),
                                  SizedBox(
                                    width: 20,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          sortByRatingController.isTrainingTypeShow.value
                              ? Container(
                                  margin: EdgeInsets.only(bottom: 10),
                                  height: 100,
                                  color: cPrimaryColor24Opacity,
                                  child: ListView.builder(
                                      padding: EdgeInsets.only(top: 0),
                                      itemCount: sortByRatingController
                                          .propertiseModel.type!.length,
                                      itemBuilder: (context, index) {
                                        final type = sortByRatingController
                                            .propertiseModel.type![index];
                                        return ListTile(
                                          title: Text(type.type ?? ""),
                                          trailing: Checkbox(
                                            checkColor: cPrimaryColor,
                                            activeColor: cWhiteColor,
                                            value: type.isTypeSelected,
                                            onChanged: (newValue) {
                                              setState(() {
                                                for (int i = 0;
                                                    i <
                                                        sortByRatingController
                                                            .propertiseModel
                                                            .type!
                                                            .length;
                                                    i++) {
                                                  sortByRatingController
                                                      .propertiseModel
                                                      .type![i]
                                                      .isTypeSelected = false;
                                                }
                                                sortByRatingController
                                                    .propertiseModel
                                                    .type![index]
                                                    .isTypeSelected = newValue!;

                                                sortByRatingController
                                                        .trainingTypeSelectedValue =
                                                    (newValue
                                                        ? type.type
                                                        : "")!;
                                              });

                                              print(
                                                  "*********************${sortByRatingController.trainingTypeSelectedValue}");
                                            },
                                          ),
                                        );
                                      }),
                                )
                              : SizedBox(),

                          ///////////////////////sex

                          SizedBox(
                            height: 8,
                          ),

                          GestureDetector(
                            onTap: () {
                              sortByRatingController.isSexShow.value =
                                  !sortByRatingController.isSexShow.value;

                              sortByRatingController.isTrainingTypeShow.value =
                                  false;
                            },
                            child: Container(
                              height: 40,
                              color: Colors.white,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 10,
                                  ),
                                  sortByRatingController.isSexShow.value
                                      ? SvgPicture.asset(Assets
                                          .searchFilterImagesFilterTileIcon)
                                      : const Icon(
                                          Icons.menu_rounded,
                                          color: cBlackColor,
                                          size: 17,
                                        ),
                                  SizedBox(
                                    width: 70,
                                  ),
                                  Text("Sex"),
                                  SizedBox(
                                    width: 20,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          sortByRatingController.isSexShow.value
                              ? Container(
                                  margin: EdgeInsets.only(bottom: 10),
                                  height: 100,
                                  color: cPrimaryColor24Opacity,
                                  child: ListView.builder(
                                      padding: EdgeInsets.only(top: 0),
                                      itemCount: sortByRatingController
                                          .propertiseModel.sex!.length,
                                      itemBuilder: (context, index) {
                                        final sex = sortByRatingController
                                            .propertiseModel.sex![index];
                                        return ListTile(
                                          title: Text(sex.sex ?? ""),
                                          trailing: Checkbox(
                                            checkColor: cPrimaryColor,
                                            activeColor: cWhiteColor,
                                            value: sex.isSexSelected,
                                            onChanged: (newValue) {
                                              setState(() {
                                                for (int i = 0;
                                                    i <
                                                        sortByRatingController
                                                            .propertiseModel
                                                            .sex!
                                                            .length;
                                                    i++) {
                                                  sortByRatingController
                                                      .propertiseModel
                                                      .sex![i]
                                                      .isSexSelected = false;
                                                }
                                                sortByRatingController
                                                    .propertiseModel
                                                    .sex![index]
                                                    .isSexSelected = newValue!;

                                                sortByRatingController
                                                        .sexSelectedValue =
                                                    (newValue ? sex.sex : "")!;
                                              });

                                              print(
                                                  "*********************${sortByRatingController.sexSelectedValue}");
                                            },
                                          ),
                                        );
                                      }),
                                )
                              : SizedBox(),
                        ],
                      ),
                    ),
                  ))),

          //////////here end
          gapH20,
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Spacer(),
              Expanded(
                flex: 3,
                child: HomeFilterAlertDialogButtonComponent(
                  text: "Applicatioin",
                  backGroundColor: cPrimaryColor,
                  onPressedFunction: () {
                    sortByRatingController.getMyTraning();

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
                    sortByRatingController.getMyTraning(
                        filter: 1,
                        servicetype:
                            sortByRatingController.trainingTypeSelectedValue,
                        region: sortByRatingController.regionSelectedValue,
                        price: priceController.text,
                        sex: sortByRatingController.sexSelectedValue);

                    sortByRatingController.isRegionShow.value = false;

                    sortByRatingController.isPriceShow.value = false;
                    sortByRatingController.isTrainingTypeShow.value = false;
                    sortByRatingController.isSexShow.value = false;
// ///////////////reset values
                    sortByRatingController.sexSelectedValue = '';
                    sortByRatingController.regionSelectedValue = '';
                    sortByRatingController.trainingTypeSelectedValue = '';

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
              sortByRatingController.isRegionShow.value = false;

              sortByRatingController.isPriceShow.value = false;
              sortByRatingController.isTrainingTypeShow.value = false;
              sortByRatingController.isSexShow.value = false;
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
