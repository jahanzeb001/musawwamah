import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:obaiah_mobile_app/generated/assets.dart';
import 'package:obaiah_mobile_app/screens/user/home/home/components/home_screen_components.dart';
import 'package:obaiah_mobile_app/screens/user/hospitality/hospitality_home/controller/hospitality_home_controller.dart';
import 'package:obaiah_mobile_app/utils/colors/colors.dart';
import 'package:obaiah_mobile_app/utils/spacing/gaps.dart';
import 'package:obaiah_mobile_app/utils/spacing/padding.dart';

class SortingDialogBox2 extends StatelessWidget {
  const SortingDialogBox2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sortByRatingController = Get.find<HospitalityHomeController>();
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
                    sortByRatingController.Hospitalities(sortBy: "ratting");
                    Navigator.pop(context);
                  },
                  buttonText: "Sort by rating",
                )),
                const Divider(height: 1, color: cOnyxColor),
                Expanded(
                    child: TextButtonComponent(
                  onPressedFunction: () {
                    sortByRatingController.Hospitalities(
                        sortBy: "lowest_price_first");
                    Navigator.pop(context);
                  },
                  buttonText: "order the lowest price first",
                )),
                const Divider(height: 1, color: cOnyxColor),
                Expanded(
                    child: TextButtonComponent(
                  onPressedFunction: () {
                    sortByRatingController.Hospitalities(
                        sortBy: "highest_price_first");
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
class FilterDialogBox2 extends StatefulWidget {
  final List<bool> selectedValueList, filterCheckBoxValueList;

  FilterDialogBox2({
    Key? key,
    required this.selectedValueList,
    required this.filterCheckBoxValueList,
  }) : super(key: key);

  @override
  State<FilterDialogBox2> createState() => _FilterDialogBox2State();
}

class _FilterDialogBox2State extends State<FilterDialogBox2> {
  var priceController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final sortByRatingController = Get.find<HospitalityHomeController>();
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
                  // height: 180,
                  //  color: Colors.red,
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
                                                        .regionSelectedVal =
                                                    (newValue
                                                        ? region.region
                                                        : "")!;
                                              });

                                              print(
                                                  "*********************${sortByRatingController.regionSelectedVal}");
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
                              sortByRatingController.isServicesShow.value =
                                  !sortByRatingController.isServicesShow.value;

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
                                  sortByRatingController.isServicesShow.value
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
                                  Text("The Services"),
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
                          sortByRatingController.isServicesShow.value
                              ? Container(
                                  margin: EdgeInsets.only(bottom: 10),
                                  height: 100,
                                  color: cPrimaryColor24Opacity,
                                  child: ListView.builder(
                                      padding: EdgeInsets.only(top: 0),
                                      itemCount: sortByRatingController
                                          .propertiseModel.services!.length,
                                      itemBuilder: (context, index) {
                                        final services = sortByRatingController
                                            .propertiseModel.services![index];
                                        return ListTile(
                                          title: Text(services.service ?? ""),
                                          trailing: Checkbox(
                                            checkColor: cPrimaryColor,
                                            activeColor: cWhiteColor,
                                            value: services.isServiceSelected,
                                            onChanged: (newValue) {
                                              setState(() {
                                                for (int i = 0;
                                                    i <
                                                        sortByRatingController
                                                            .propertiseModel
                                                            .services!
                                                            .length;
                                                    i++) {
                                                  sortByRatingController
                                                          .propertiseModel
                                                          .services![i]
                                                          .isServiceSelected =
                                                      false;
                                                }
                                                sortByRatingController
                                                        .propertiseModel
                                                        .services![index]
                                                        .isServiceSelected =
                                                    newValue!;

                                                sortByRatingController
                                                        .serviceSelectedVal =
                                                    (newValue
                                                        ? services.service
                                                        : "")!;
                                              });

                                              print(
                                                  "*********************${sortByRatingController.serviceSelectedVal}");
                                            },
                                          ),
                                        );
                                      }),
                                )
                              : SizedBox(),

                          ///////////////////////sex
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
                    sortByRatingController.Hospitalities();

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
                    sortByRatingController.Hospitalities(
                      filter: 1,
                      servicetype: sortByRatingController.serviceSelectedVal,
                      region: sortByRatingController.regionSelectedVal,
                      price: priceController.text,
                    );

                    sortByRatingController.isRegionShow.value = false;
                    sortByRatingController.isPriceShow.value = false;
                    sortByRatingController.isRegionShow.value = false;
                    sortByRatingController.isServicesShow.value = false;
// ///////////////reset values
                    sortByRatingController.regionSelectedVal = '';
                    sortByRatingController.thePriceSelectedVal = '';
                    sortByRatingController.serviceSelectedVal = '';

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
              sortByRatingController.isRegionShow.value = false;
              sortByRatingController.isServicesShow.value = false;
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
