import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:obaiah_mobile_app/reusable_widgets/reusable_appbar.dart';
import 'package:obaiah_mobile_app/reusable_widgets/reusable_text.dart';
import 'package:obaiah_mobile_app/screens/user/add_new_horse/components/add_new_horse_components.dart';
import 'package:obaiah_mobile_app/screens/user/add_stable_horse/controller/add_stable_horse_controller.dart';
import 'package:obaiah_mobile_app/utils/colors/colors.dart';
import 'package:obaiah_mobile_app/utils/constants/custom_error.dart';
import 'package:obaiah_mobile_app/utils/spacing/gaps.dart';
import 'package:video_player/video_player.dart';
import '../../../../reusable_widgets/reusable_dropdown_formfield.dart';
import '../../../../reusable_widgets/reusable_button.dart';
import '../../../../utils/constants/lists.dart';
import '../../../../utils/spacing/padding.dart';
import '../../../../utils/text_styles/textstyles.dart';
import '../../home/checkout/component/checkout_component.dart';

class AddStableHorseScreen extends StatefulWidget {
  const AddStableHorseScreen({Key? key}) : super(key: key);

  @override
  State<AddStableHorseScreen> createState() => _AddStableHorseScreenState();
}

class _AddStableHorseScreenState extends State<AddStableHorseScreen> {
  File? _pickedVideo;
  File? horseBackView;
  File? horseFrontView;
  File? horseLeftView;
  File? horseRightView;
  List<File?> moreimages = [];

  //////////////////horse back view
  VideoPlayerController? _videoPlayerController;
  Future<void> _getHorseBackImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    setState(() {
      horseBackView = File(pickedFile!.path);
    });
  }

  //////////////////horse front view
  Future<void> _getHorseFrontImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    setState(() {
      horseFrontView = File(pickedFile!.path);
    });
  }

  //////////////////horse left view
  Future<void> _getHorseLeftImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    setState(() {
      horseLeftView = File(pickedFile!.path);
    });
  }

  //////////////////horse right view
  Future<void> _getHorseRightImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    setState(() {
      horseRightView = File(pickedFile!.path);
    });
  }

//////////////////pick video
  Future<void> _pickVideo(ImageSource source) async {
    final ImagePicker _picker = ImagePicker();

    final pickedFile = await _picker.getVideo(source: source);
    setState(() {
      _pickedVideo = File(pickedFile!.path);
    });
    _videoPlayerController = VideoPlayerController.file(_pickedVideo!)
      ..initialize().then((_) {
        setState(() {});

        _videoPlayerController!.play();
      });
  }

  //////////////////horse more images view
  List<File> _selectedImages = [];
  Future<void> _openImagePicker(BuildContext context) async {
    final List<XFile>? images = await ImagePicker().pickMultiImage();
    if (images != null) {
      setState(() {
        _selectedImages.insertAll(
          _selectedImages.length,
          images.map((image) => File(image.path)).toList(),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final addNewStableHorseController = Get.find<AddStableHorseController>();
    return Scaffold(
      appBar: ReusableAppBar(
          onPressFunction: () {
            Navigator.pop(context);
          },
          textStyle: const TextStyle(
              fontFamily: "Tajawal",
              fontWeight: FontWeight.w900,
              fontSize: 20,
              color: cPrimaryColor),
          titleText: "add a new horse"),
      body: Container(
        padding: padA10,
        width: context.width * 1,
        height: context.height * 1,
        child: SingleChildScrollView(
          child: Form(
            key: addNewStableHorseController.addNewHorseFormKey,
            child: Column(
              children: [
                //Text
                Row(
                  children: [
                    gapW15,
                    Text(
                      "add type".tr,
                      style: black514,
                    ),
                  ],
                ),
                gapH10,
                //Component 1
                // Row(
                //   mainAxisSize: MainAxisSize.min,
                //   children: [
                //     gapW10,
                //     Expanded(
                //       child: Obx(
                //         () => SelectContainerComponent(
                //           text: "fixed price",
                //           isChecked:
                //               addNewHorseController.isOnFixedPriceChecked.value,
                //           onTapFunction: () {
                //             addNewHorseController.toggleTypeOfPurchase(
                //                 isBiddingTapped: false);
                //           },
                //         ),
                //       ),
                //     ),
                //     gapW50,
                //     Expanded(
                //       child: Obx(
                //         () => SelectContainerComponent(
                //           text: "bidding",
                //           isChecked:
                //               addNewHorseController.isBiddingChecked.value,
                //           onTapFunction: () {
                //             addNewHorseController.toggleTypeOfPurchase(
                //                 isBiddingTapped: true);
                //           },
                //         ),
                //       ),
                //     ),
                //     gapW10,
                //   ],
                // ),
                //   gapH30,
                //Component 2 //Bidding Text
                // Component 10 Bidding Preview
                Obx(
                  () => addNewStableHorseController.isBiddingChecked.value
                      ? Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "the auction will be reviewed by the administration and contact you as soon as possible."
                                  .tr,
                              textAlign: TextAlign.center,
                              style: onyx514,
                            ),
                            gapH30
                          ],
                        )
                      : const SizedBox.shrink(),
                ),
                //Component 3
                Container(
                  padding: padA20,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: cCulturedWhiteColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          gapW30,
                          Expanded(
                              child: CustomContainerComponent(
                            onTapFunction: () {
                              _showBottomSheetMenu(context);
                            },
                            text: "horse back view",
                            image: horseBackView,
                          )),
                          gapW40,
                          Expanded(
                            child: CustomContainerComponent(
                              onTapFunction: () {
                                _horseFrontViewMenu(context);
                              },
                              text: "horse image from front",
                              image: horseFrontView,
                            ),
                          ),
                          gapW30,
                        ],
                      ),
                      gapH20,
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          gapW30,
                          Expanded(
                            child: CustomContainerComponent(
                              onTapFunction: () {
                                _horseLeftViewMenu(context);
                              },
                              text: "horse image from left",
                              image: horseLeftView,
                            ),
                          ),
                          gapW40,
                          Expanded(
                            child: CustomContainerComponent(
                              onTapFunction: () {
                                _horseRightViewMenu(context);
                              },
                              text: "picture of the horse from the right",
                              image: horseRightView,
                            ),
                          ),
                          gapW30,
                        ],
                      ),
                      gapH20,
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          gapW30,
                          Expanded(
                            child: MediaButton(
                                text: "add a video",
                                onPressFunction: () {
                                  addNewStableHorseController
                                          .isVideoPlaceShow.value =
                                      !addNewStableHorseController
                                          .isVideoPlaceShow.value;
                                }),
                          ),
                          gapW40,
                          Expanded(
                            child: MediaButton(
                                text: "more pictures",
                                onPressFunction: () {
                                  addNewStableHorseController
                                          .isMorePicPlaceShow.value =
                                      !addNewStableHorseController
                                          .isMorePicPlaceShow.value;
                                }),
                          ),
                          gapW30,
                        ],
                      )
                    ],
                  ),
                ),
                addNewStableHorseController.isVideoPlaceShow.value
                    ? gapH10
                    : gapH10,

                Obx(() => addNewStableHorseController.isVideoPlaceShow.value
                    ? GestureDetector(
                        onTap: () {
                          _horseVideoPick(context);
                        },
                        child: Container(
                          height: 150,
                          decoration: BoxDecoration(
                              color: cCulturedWhiteColor,
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: _pickedVideo != null
                                ? AspectRatio(
                                    aspectRatio: _videoPlayerController!
                                        .value.aspectRatio,
                                    child: VideoPlayer(
                                      _videoPlayerController!,
                                    ),
                                  )
                                : Text(
                                    "add a video".tr,
                                    style: onyx410,
                                  ),
                          ),
                        ),
                      )
                    : addNewStableHorseController.isMorePicPlaceShow.value
                        ? Container(
                            height: 150,
                            decoration: BoxDecoration(
                                color: cCulturedWhiteColor,
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                  height: 150,
                                  width: double.infinity,
                                  // color: Colors.red,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                          flex: 3,
                                          child: Container(
                                            height: 150,
                                            // decoration: BoxDecoration(
                                            //     color:
                                            //         cCulturedWhiteColor,
                                            //     borderRadius:
                                            //         BorderRadius
                                            //             .circular(
                                            //                 10)),

                                            child: _selectedImages.length == 0
                                                ? Center(
                                                    child:
                                                        Text("select images"),
                                                  )
                                                : GridView.builder(
                                                    gridDelegate:
                                                        SliverGridDelegateWithFixedCrossAxisCount(
                                                      crossAxisCount: 3,
                                                    ),
                                                    itemCount:
                                                        _selectedImages.length,
                                                    itemBuilder:
                                                        (BuildContext context,
                                                            int index) {
                                                      return Container(
                                                        margin:
                                                            EdgeInsets.all(4),
                                                        height: 60,
                                                        width: 60,
                                                        decoration: BoxDecoration(
                                                            color:
                                                                cCulturedWhiteColor,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10)),
                                                        child: Image.file(
                                                          _selectedImages[
                                                              index],
                                                          fit: BoxFit.cover,
                                                        ),
                                                      );
                                                    },
                                                  ),
                                          )),
                                      Expanded(
                                          flex: 1,
                                          child: Center(
                                            child: GestureDetector(
                                              onTap: () {
                                                _openImagePicker(context);
                                              },
                                              child: Container(
                                                height: 100,
                                                width: 60,
                                                decoration: BoxDecoration(
                                                    color: cCulturedWhiteColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                child: Icon(Icons.add),
                                              ),
                                            ),
                                          ))
                                    ],
                                  )),
                            ),
                          )
                        : SizedBox()),
                addNewStableHorseController.isVideoPlaceShow.value
                    ? gapH10
                    : gapH10,
                //Component 4 TextFields
                SizedBox(
                  height: 475,
                  width: context.width * 1,
                  child: Stack(children: [
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        padding: padA20,
                        height: 466,
                        width: context.width * 1,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: cCulturedWhiteColor,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                gapW10,
                                Expanded(
                                  child: TwoWidgetsAlignComponent(
                                      text: "name of horse",
                                      passedWidget:
                                          NewHorseTextFormWithoutLabelComponent(
                                        textController:
                                            addNewStableHorseController
                                                .nameOfHorseController,
                                      )),
                                ),
                                gapW15,
                                Expanded(
                                  child: TwoWidgetsAlignComponent(
                                      text: "type",
                                      passedWidget: SizedBox(
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            context.isPortrait
                                                ? const SizedBox.shrink()
                                                : gapW50,
                                            Obx(() {
                                              return AddHorseRadioButton(
                                                value: horseTypeList[0],
                                                groupValue:
                                                    addNewStableHorseController
                                                        .horseType.value,
                                                onChangeFunction: (value) {
                                                  addNewStableHorseController
                                                      .checkForHorseType(
                                                          value: value);
                                                },
                                              );
                                            }),
                                            Text(
                                              "horsesKhel".tr,
                                              style: onyx410,
                                            ),
                                            const Spacer(),
                                            Obx(() {
                                              return AddHorseRadioButton(
                                                value: horseTypeList[1],
                                                groupValue:
                                                    addNewStableHorseController
                                                        .horseType.value,
                                                onChangeFunction: (value) {
                                                  addNewStableHorseController
                                                      .checkForHorseType(
                                                          value: value);
                                                },
                                              );
                                            }),
                                            Text(
                                              "mare".tr,
                                              style: onyx410,
                                            ),
                                            context.isPortrait ? gapW10 : gapW50
                                          ],
                                        ),
                                      )),
                                ),
                                gapW10,
                              ],
                            ),
                            gapH15,
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                gapW10,
                                Expanded(
                                  child: ThreeWidgetsAlignComponent(
                                      topText: "name of the father",
                                      passedWidget:
                                          NewHorseTextFormWithoutLabelComponent(
                                        textController:
                                            addNewStableHorseController
                                                .fathersNameController,
                                      ),
                                      bottomText: "leave blank if unknown"),
                                ),
                                gapW15,
                                Expanded(
                                  child: ThreeWidgetsAlignComponent(
                                      topText: "mother name",
                                      passedWidget: SizedBox(
                                        child:
                                            NewHorseTextFormWithoutLabelComponent(
                                          textController:
                                              addNewStableHorseController
                                                  .mothersNameController,
                                        ),
                                      ),
                                      bottomText: "leave blank if unknown"),
                                ),
                                gapW10,
                              ],
                            ),
                            gapH15,
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                gapW10,
                                Expanded(
                                  child: TwoWidgetsAlignComponent(
                                      text: "age",
                                      passedWidget: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          gapW5,
                                          Expanded(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                gapH2,
                                                Text(
                                                  "month (not mandatory)".tr,
                                                  style: onyx405,
                                                ),
                                                Expanded(
                                                    child:
                                                        TextFormCustomColorComponent(
                                                  onChanged: (val) {
                                                    if (int.parse(val) > 12) {
                                                      Get.snackbar(
                                                        'invalidage'.tr,
                                                        'pleaseenteranagenotgreaterthan12.'
                                                            .tr,
                                                      );
                                                      addNewStableHorseController
                                                          .ageMonthController
                                                          .clear();
                                                    }
                                                  },
                                                  textController:
                                                      addNewStableHorseController
                                                          .ageMonthController,
                                                  fillColor:
                                                      cScaffoldBackground,
                                                  keyboardType:
                                                      TextInputType.number,
                                                )),
                                                gapH2,
                                              ],
                                            ),
                                          ),
                                          gapW5,
                                          Expanded(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                gapH2,
                                                Text(
                                                  "year".tr,
                                                  style: onyx405,
                                                ),
                                                Expanded(
                                                    child:
                                                        TextFormCustomColorComponent(
                                                  textController:
                                                      addNewStableHorseController
                                                          .ageYearController,
                                                  fillColor:
                                                      cScaffoldBackground,
                                                  keyboardType:
                                                      TextInputType.number,
                                                )),
                                                gapH2,
                                              ],
                                            ),
                                          ),
                                          gapW5,
                                        ],
                                      )),
                                ),
                                gapW15,
                                Expanded(
                                  child: TwoWidgetsAlignComponent(
                                      text: "color",
                                      passedWidget:
                                          NewHorseTextFormWithoutLabelComponent(
                                        textController:
                                            addNewStableHorseController
                                                .colorController,
                                      )),
                                ),
                                gapW10,
                              ],
                            ),
                            gapH15,
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                gapW10,
                                Expanded(
                                  child: TwoWidgetsAlignComponent(
                                    text: "safety",
                                    passedWidget: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        context.isPortrait
                                            ? const SizedBox.shrink()
                                            : gapW50,
                                        Obx(() {
                                          return AddHorseRadioButton(
                                            value: conditionList[0],
                                            groupValue:
                                                addNewStableHorseController
                                                    .condition.value,
                                            onChangeFunction: (value) {
                                              addNewStableHorseController
                                                  .checkForCondition(
                                                      value: value);
                                            },
                                          );
                                        }),
                                        Text(
                                          "salim".tr,
                                          style: onyx410,
                                        ),
                                        const Spacer(),
                                        Obx(() {
                                          return AddHorseRadioButton(
                                            value: conditionList[1],
                                            groupValue:
                                                addNewStableHorseController
                                                    .condition.value,
                                            onChangeFunction: (value) {
                                              addNewStableHorseController
                                                  .checkForCondition(
                                                      value: value);
                                            },
                                          );
                                        }),
                                        Text(
                                          "injured".tr,
                                          style: onyx410,
                                        ),
                                        context.isPortrait ? gapW10 : gapW50
                                      ],
                                    ),
                                  ),
                                ),
                                gapW15,
                                Expanded(
                                  child: TwoWidgetsAlignComponent(
                                      text: "originality",
                                      passedWidget: SizedBox(
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            context.isPortrait
                                                ? const SizedBox.shrink()
                                                : gapW50,
                                            Obx(() {
                                              return AddHorseRadioButton(
                                                value: originalityList[0],
                                                groupValue:
                                                    addNewStableHorseController
                                                        .originality.value,
                                                onChangeFunction: (value) {
                                                  addNewStableHorseController
                                                      .checkForOriginality(
                                                          value: value);
                                                },
                                              );
                                            }),
                                            Text(
                                              "arabic".tr,
                                              style: onyx410,
                                            ),
                                            const Spacer(),
                                            Obx(() {
                                              return AddHorseRadioButton(
                                                value: originalityList[1],
                                                groupValue:
                                                    addNewStableHorseController
                                                        .originality.value,
                                                onChangeFunction: (value) {
                                                  addNewStableHorseController
                                                      .checkForOriginality(
                                                          value: value);
                                                },
                                              );
                                            }),
                                            Text(
                                              "hybrid".tr,
                                              style: onyx410,
                                            ),
                                            context.isPortrait ? gapW10 : gapW50
                                          ],
                                        ),
                                      )),
                                ),
                                gapW10,
                              ],
                            ),
                            gapH15,
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                gapW10,
                                Expanded(
                                  child: TwoWidgetsAlignComponent(
                                      text: "did he complete his vaccinations?",
                                      passedWidget: SizedBox(
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            context.isPortrait
                                                ? const SizedBox.shrink()
                                                : gapW50,
                                            Obx(() {
                                              return AddHorseRadioButton(
                                                value: yesOrNoList[0],
                                                groupValue:
                                                    addNewStableHorseController
                                                        .yesOrNoForIsVaccinated
                                                        .value,
                                                onChangeFunction: (value) {
                                                  addNewStableHorseController
                                                      .checkYesOrNoForIsVaccinated(
                                                          value: value);
                                                },
                                              );
                                            }),
                                            Text(
                                              "yes".tr,
                                              style: onyx410,
                                            ),
                                            const Spacer(),
                                            Obx(() {
                                              return AddHorseRadioButton(
                                                value: yesOrNoList[1],
                                                groupValue:
                                                    addNewStableHorseController
                                                        .yesOrNoForIsVaccinated
                                                        .value,
                                                onChangeFunction: (value) {
                                                  addNewStableHorseController
                                                      .checkYesOrNoForIsVaccinated(
                                                          value: value);
                                                },
                                              );
                                            }),
                                            Text(
                                              "no".tr,
                                              style: onyx410,
                                            ),
                                            context.isPortrait ? gapW10 : gapW50
                                          ],
                                        ),
                                      )),
                                ),
                                gapW15,
                                Expanded(
                                  child: TwoWidgetsAlignComponent(
                                      text: "does he have evidence?",
                                      passedWidget: SizedBox(
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            context.isPortrait
                                                ? const SizedBox.shrink()
                                                : gapW50,
                                            Obx(() {
                                              return AddHorseRadioButton(
                                                value: yesOrNoList[0],
                                                groupValue:
                                                    addNewStableHorseController
                                                        .yesOrNoForHaveEvidence
                                                        .value,
                                                onChangeFunction: (value) {
                                                  addNewStableHorseController
                                                      .checkYesOrNoForHaveEvidence(
                                                          value: value);
                                                },
                                              );
                                            }),
                                            Text(
                                              "yes".tr,
                                              style: onyx410,
                                            ),
                                            const Spacer(),
                                            Obx(() {
                                              return AddHorseRadioButton(
                                                value: yesOrNoList[1],
                                                groupValue:
                                                    addNewStableHorseController
                                                        .yesOrNoForHaveEvidence
                                                        .value,
                                                onChangeFunction: (value) {
                                                  addNewStableHorseController
                                                      .checkYesOrNoForHaveEvidence(
                                                          value: value);
                                                },
                                              );
                                            }),
                                            Text(
                                              "no".tr,
                                              style: onyx410,
                                            ),
                                            context.isPortrait ? gapW10 : gapW50
                                          ],
                                        ),
                                      )),
                                ),
                                gapW10,
                              ],
                            ),
                            gapH15,
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                gapW10,
                                Expanded(
                                    child: ReusableRegionDropDownFormField(
                                  labelAlignment: FloatingLabelAlignment.center,
                                )),
                                gapW15,
                                Expanded(
                                  child: TwoWidgetsAlignComponent(
                                      text: "city/province",
                                      passedWidget:
                                          NewHorseTextFormWithoutLabelComponent(
                                        textController:
                                            addNewStableHorseController
                                                .cityOrProvinceController,
                                      )),
                                ),
                                gapW10,
                              ],
                            ),
                            gapH15,
                          ],
                        ),
                      ),
                    ),
                    Align(
                        alignment: Alignment.topCenter,
                        child: Text(
                          "horse details".tr,
                          style: auctionMediumPrimaryTextStyle,
                        )),
                  ]),
                ),
                gapH30,
                //Component 5
                Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                color: cCheckBackground,
                                borderRadius: BorderRadius.circular(10)),
                            alignment: Alignment.center,
                            child: Transform.scale(
                              scale: 1.5,
                              child: Obx(() {
                                return Checkbox(
                                    value: addNewStableHorseController
                                        .needExpertOpinion.value,
                                    checkColor: cPrimaryColor,
                                    fillColor: const MaterialStatePropertyAll(
                                        cCheckBackground),
                                    overlayColor:
                                        const MaterialStatePropertyAll(
                                            cCheckBackground),
                                    side: const BorderSide(
                                        color: cCheckBackground),
                                    onChanged: (val) {
                                      addNewStableHorseController
                                          .checkExpertOpinion(value: val!);

                                      addNewStableHorseController
                                          .calculateTotalPrice(
                                              horsePrice:
                                                  addNewStableHorseController
                                                      .horsePrice,
                                              expertopinionChosen:
                                                  addNewStableHorseController
                                                              .needExpertOpinion
                                                              .value ==
                                                          true
                                                      ? 1
                                                      : 0);
                                    });
                              }),
                            ),
                          ),
                          gapH10,
                          Text(
                            "add an expert opinion?".tr,
                            textAlign: TextAlign.center,
                            style: auctionDescriptionPrimaryTextStyle,
                          ),
                          gapH10,
                          Text(
                            "200 riyals will be added to the site commission"
                                .tr,
                            textAlign: TextAlign.center,
                            style: auctionDescriptionTextStyle,
                          ),
                        ],
                      ),
                    ),
                    gapW10,
                    Expanded(
                      flex: 2,
                      child: SizedBox(
                        height: 150,
                        child: Stack(children: [
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              padding: padA20,
                              height: 141,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                              ),
                              child: Text(
                                "the expert's opinion will add more credibility and confidence to your horse, which will make it sold at the required price or even at a higher price than estimated due to the expert's opinion."
                                    .tr,
                                textAlign: TextAlign.justify,
                                style: auctionDescriptionTextStyle,
                              ),
                            ),
                          ),
                          Align(
                              alignment: Alignment.topCenter,
                              child: Text(
                                "it's recommended!".tr,
                                style: auctionMediumPrimaryTextStyle,
                              )),
                        ]),
                      ),
                    ),
                  ],
                ),
                gapH20,
                //Component 6 Bidding Preview
                Obx(() => addNewStableHorseController.isBiddingChecked.value
                    ? SizedBox(
                        height: 194,
                        child: Stack(children: [
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              padding: padA20,
                              height: 185,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      gapW5,
                                      Expanded(
                                        child: SizedBox(
                                          height: 64,
                                          child: Stack(children: [
                                            Align(
                                              alignment: Alignment.bottomCenter,
                                              child: Container(
                                                  padding: padA20,
                                                  height: 55,
                                                  alignment: Alignment.center,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    color: cCheckBackground,
                                                  ),
                                                  child: const Text(
                                                    "10%",
                                                    style: primary716,
                                                  )),
                                            ),
                                            Align(
                                                alignment: Alignment.topCenter,
                                                child: Text(
                                                  "site commission".tr,
                                                  textAlign: TextAlign.center,
                                                  style: auctionValueTextStyle,
                                                )),
                                          ]),
                                        ),
                                      ),
                                      gapW15,
                                      Expanded(
                                        child: SizedBox(
                                          height: 64,
                                          child: Stack(children: [
                                            Align(
                                              alignment: Alignment.bottomCenter,
                                              child: Container(
                                                  padding: padA20,
                                                  height: 55,
                                                  alignment: Alignment.center,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    color: cCheckBackground,
                                                  ),
                                                  child: const ReUsableText(
                                                    text: "375",
                                                    textStyle: primary716,
                                                  )),
                                            ),
                                            Align(
                                                alignment: Alignment.topCenter,
                                                child: Text(
                                                  "expert opinion".tr,
                                                  textAlign: TextAlign.center,
                                                  style: auctionValueTextStyle,
                                                )),
                                          ]),
                                        ),
                                      ),
                                      gapW5,
                                    ],
                                  ),
                                  Text(
                                    "it will be deducted from the total value of the horse after the end of the auction and the completion of the sale"
                                        .tr,
                                    textAlign: TextAlign.justify,
                                    style: auctionValueTextStyle,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Align(
                              alignment: Alignment.topCenter,
                              child: Text(
                                "price".tr,
                                style: auctionMediumPrimaryTextStyle,
                              )),
                        ]),
                      )
                    : const SizedBox.shrink()),

                //Components 7 Column For Fixed Price Preview
                Obx(
                  () => addNewStableHorseController.isOnFixedPriceChecked.value
                      ? Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // Component 6 Fixed Price Preview
                            SizedBox(
                              height: 99,
                              width: context.width * 1,
                              child: Stack(children: [
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Container(
                                      padding: padA20,
                                      height: 90,
                                      width: context.width * 1,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: cCulturedWhiteColor,
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Expanded(
                                            flex: 2,
                                            child:
                                                NewHorseSimpleTextFormFieldComponent(
                                                    onChanged: (val) {
                                                      addNewStableHorseController
                                                              .horsePrice
                                                              .value =
                                                          int.parse(val);
                                                      addNewStableHorseController
                                                          .calculateTotalPrice(
                                                              horsePrice:
                                                                  addNewStableHorseController
                                                                      .horsePrice,
                                                              expertopinionChosen:
                                                                  addNewStableHorseController
                                                                              .needExpertOpinion
                                                                              .value ==
                                                                          true
                                                                      ? 1
                                                                      : 0);
                                                    },
                                                    hintText: "enter price",
                                                    textController:
                                                        addNewStableHorseController
                                                            .priceController),
                                          ),
                                          gapW30,
                                          Expanded(
                                            child: Text(
                                              "riyal".tr,
                                              style: onyx522,
                                            ),
                                          ),
                                          context.isPortrait
                                              ? const SizedBox.shrink()
                                              : gapW30,
                                        ],
                                      )),
                                ),
                                Align(
                                    alignment: Alignment.topRight,
                                    child: Row(
                                      children: [
                                        gapW20,
                                        Text(
                                          "price".tr,
                                          style: auctionMediumPrimaryTextStyle,
                                        ),
                                      ],
                                    )),
                              ]),
                            ),
                            gapH20,
                            // Component 7 Fixed Price Preview
                            Obx(() => addNewStableHorseController
                                    .loadingData.value
                                ? Center(
                                    child: CircularProgressIndicator(
                                    color: cPrimaryColor,
                                  ))
                                : addNewStableHorseController.errorData.value !=
                                        ""
                                    ? Center(
                                        child: Custom_Error(
                                          onpressed: () {
                                            addNewStableHorseController
                                                .getExpertOpinoinData();
                                          },
                                          error: addNewStableHorseController
                                              .errorData.value,
                                        ),
                                      )
                                    : Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              gapW5,
                                              Expanded(
                                                child: SizedBox(
                                                  height: 64,
                                                  child: Stack(children: [
                                                    Align(
                                                      alignment: Alignment
                                                          .bottomCenter,
                                                      child: Container(
                                                          padding: padA20,
                                                          height: 55,
                                                          alignment:
                                                              Alignment.center,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                            color:
                                                                cCheckBackground,
                                                          ),
                                                          child: ReUsableText(
                                                            text: addNewStableHorseController
                                                                    .expertOpinionModel
                                                                    .settings!
                                                                    .siteComission ??
                                                                "",
                                                            textStyle: onyx516,
                                                          )),
                                                    ),
                                                    Align(
                                                        alignment:
                                                            Alignment.topCenter,
                                                        child: Text(
                                                          "site commission".tr,
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: onyx516,
                                                        )),
                                                  ]),
                                                ),
                                              ),
                                              gapW15,
                                              Expanded(
                                                child: SizedBox(
                                                  height: 64,
                                                  child: Stack(children: [
                                                    Align(
                                                      alignment: Alignment
                                                          .bottomCenter,
                                                      child: Container(
                                                          padding: padA20,
                                                          height: 55,
                                                          alignment:
                                                              Alignment.center,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                            color:
                                                                cCheckBackground,
                                                          ),
                                                          child: ReUsableText(
                                                            text: addNewStableHorseController
                                                                .expertOpinionModel
                                                                .opinion!
                                                                .price
                                                                .toString(),
                                                            textStyle: onyx516,
                                                          )),
                                                    ),
                                                    Align(
                                                        alignment:
                                                            Alignment.topCenter,
                                                        child: Text(
                                                          "expert opinion".tr,
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: onyx516,
                                                        )),
                                                  ]),
                                                ),
                                              ),
                                              gapW5,
                                            ],
                                          ),
                                          gapH20,
                                          // Component 8 Fixed Price Preview
                                          SizedBox(
                                            height: 79,
                                            child: Stack(children: [
                                              Align(
                                                alignment:
                                                    Alignment.bottomCenter,
                                                child: Container(
                                                    padding: padA20,
                                                    height: 70,
                                                    alignment: Alignment.center,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      color: cCheckBackground,
                                                    ),
                                                    child: ReUsableText(
                                                      text:
                                                          addNewStableHorseController
                                                              .totalPrice.value
                                                              .toString(),
                                                      textStyle: primary532,
                                                    )),
                                              ),
                                              Align(
                                                  alignment: Alignment.topRight,
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      gapW20,
                                                      Text(
                                                        "the total price of the horse is"
                                                            .tr,
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: onyx516,
                                                      ),
                                                      const Text(
                                                        ":",
                                                        style: onyx516,
                                                      ),
                                                    ],
                                                  )),
                                            ]),
                                          ),
                                        ],
                                      )),
                            gapH70,
                          ],
                        )
                      : const SizedBox.shrink(),
                ),

                // Component 8
                SizedBox(
                  height: 289,
                  child: Stack(children: [
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: SizedBox(
                        height: 280,
                        child: NewHorseMaxLinesIncreasedTextFormFieldComponent(
                            hintText: addNewStableHorseController
                                    .expertOpinionModel.opinion?.description ??
                                "",
                            textController: addNewStableHorseController
                                .additionalDescriptionController),
                      ),
                    ),
                    Align(
                        alignment: Alignment.topCenter,
                        child: Text(
                          "additional description".tr,
                          textAlign: TextAlign.center,
                          style: primary516,
                        )),
                  ]),
                ),
                gapH20,

                // Component 9 Bidding Preview
                Obx(
                  () => addNewStableHorseController.isOnFixedPriceChecked.value
                      ? Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              height: 99,
                              width: context.width * 1,
                              child: Stack(children: [
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Container(
                                    padding: padA20,
                                    height: 90,
                                    width: context.width * 1,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: cCulturedWhiteColor,
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Expanded(
                                          child:
                                              ReusableBankDropDownFormField(),
                                        ),
                                        gapW5,
                                        Expanded(
                                          flex: 2,
                                          child: CheckOutTextFormComponent(
                                              labelText: "iban no",
                                              textController:
                                                  addNewStableHorseController
                                                      .ibanNumberController),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Align(
                                    alignment: Alignment.topCenter,
                                    child: Text(
                                      "bank info".tr,
                                      style: primary516,
                                    )),
                              ]),
                            ),
                            gapH40,
                          ],
                        )
                      : const SizedBox.shrink(),
                ),

                // Component 10
                Obx(() {
                  return PrimaryColorButton(
                      loading: addNewStableHorseController.loading.value,
                      width: context.width * 1,
                      height: 55,
                      stringText: addNewStableHorseController
                              .isOnFixedPriceChecked.value
                          ? "add"
                          : "submit a bid request",
                      textStyle: onyx718,
                      onPressFunction: addNewStableHorseController
                              .isOnFixedPriceChecked.value
                          ? () {
                              if (addNewStableHorseController
                                          .nameOfHorseController.text.length ==
                                      0 ||
                                  addNewStableHorseController.ageYearController.text.length ==
                                      0 ||
                                  addNewStableHorseController.colorController.text.length ==
                                      0 ||
                                  addNewStableHorseController
                                          .cityOrProvinceController.text.length ==
                                      0 ||
                                  addNewStableHorseController
                                          .priceController.text.length ==
                                      0 ||
                                  addNewStableHorseController
                                          .additionalDescriptionController
                                          .text
                                          .length ==
                                      0 ||
                                  addNewStableHorseController
                                          .ibanNumberController.text.length ==
                                      0) {
                                Get.snackbar(
                                  "notification".tr,
                                  "please fill all text fields",
                                );
                              } else if (addNewStableHorseController
                                      .ageYearController.text.length !=
                                  4) {
                                Get.snackbar(
                                  'Invalid Year',
                                  'Please enter valid year',
                                );
                                addNewStableHorseController.ageYearController
                                    .clear();
                              } else {
                                horseFrontView == null ||
                                        horseBackView == null ||
                                        horseLeftView == null ||
                                        horseRightView == null ||
                                        _selectedImages.length == 0 ||
                                        _pickedVideo == null
                                    ? Get.snackbar(
                                        "notification".tr,
                                        "please add all images",
                                      )
                                    : addNewStableHorseController.addNewHorse(
                                        horseFrontView!,
                                        horseBackView!,
                                        horseLeftView!,
                                        horseRightView!,
                                        _selectedImages,
                                        _pickedVideo!);
                              }
                            }
                          : () {
                              Get.snackbar("notification".tr,
                                  "your bid request is submitted".tr);
                            });
                }),
                gapH20,
              ],
            ),
          ),
        ),
      ),
    );
  }

  //////////////////for horse back view
  void _showBottomSheetMenu(BuildContext context) {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          return Container(
            decoration: BoxDecoration(
                color: cCheckBackground,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10))),
            child: Row(
              children: [
                gapW60,
                IconButton(
                    onPressed: () {
                      _getHorseBackImage(ImageSource.camera);
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.camera)),
                Spacer(),
                IconButton(
                    onPressed: () {
                      _getHorseBackImage(ImageSource.gallery);
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.photo_album)),
                gapW60,
              ],
            ),
          );
        });
  }

  //////////////////for front  view
  void _horseFrontViewMenu(BuildContext context) {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          return Container(
            decoration: BoxDecoration(
                color: cCheckBackground,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10))),
            child: Row(
              children: [
                gapW60,
                IconButton(
                    onPressed: () {
                      _getHorseFrontImage(ImageSource.camera);
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.camera)),
                Spacer(),
                IconButton(
                    onPressed: () {
                      _getHorseFrontImage(ImageSource.gallery);
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.photo_album)),
                gapW60,
              ],
            ),
          );
        });
  }

//////////////////////horse left view

  void _horseLeftViewMenu(BuildContext context) {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          return Container(
            decoration: BoxDecoration(
                color: cCheckBackground,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10))),
            child: Row(
              children: [
                gapW60,
                IconButton(
                    onPressed: () {
                      _getHorseLeftImage(ImageSource.camera);
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.camera)),
                Spacer(),
                IconButton(
                    onPressed: () {
                      _getHorseLeftImage(ImageSource.gallery);
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.photo_album)),
                gapW60,
              ],
            ),
          );
        });
  }

  //////////////////////horse right view

  void _horseRightViewMenu(BuildContext context) {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          return Container(
            decoration: BoxDecoration(
                color: cCheckBackground,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10))),
            child: Row(
              children: [
                gapW60,
                IconButton(
                    onPressed: () {
                      _getHorseRightImage(ImageSource.camera);
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.camera)),
                Spacer(),
                IconButton(
                    onPressed: () {
                      _getHorseRightImage(ImageSource.gallery);
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.photo_album)),
                gapW60,
              ],
            ),
          );
        });
  }

/////////////////pick horse vide
  void _horseVideoPick(BuildContext context) {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          return Container(
            decoration: BoxDecoration(
                color: cCheckBackground,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10))),
            child: Row(
              children: [
                gapW60,
                IconButton(
                    onPressed: () {
                      _pickVideo(ImageSource.camera);
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.camera)),
                Spacer(),
                IconButton(
                    onPressed: () {
                      _pickVideo(ImageSource.gallery);
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.photo_album)),
                gapW60,
              ],
            ),
          );
        });
  }
}
