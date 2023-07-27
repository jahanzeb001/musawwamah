import 'dart:io';
import 'dart:math';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:obaiah_mobile_app/reusable_widgets/reusable_appbar.dart';
import 'package:obaiah_mobile_app/reusable_widgets/reusable_text.dart';
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
import '../components/add_new_horse_components.dart';
import '../controller/add_new_horse_controller.dart';

class AddNewHorseScreen extends StatefulWidget {
  AddNewHorseScreen({Key? key}) : super(key: key);

  @override
  State<AddNewHorseScreen> createState() => _AddNewHorseScreenState();
}

class _AddNewHorseScreenState extends State<AddNewHorseScreen> {
  final addNewHorseController = Get.find<AddNewHorseController>();
  File? _pickedVideo;
  File? horseBackView;
  File? horseFrontView;
  File? horseLeftView;
  File? horseRightView;
  List<File?> moreimages = [];
  DateTime convertedDateTime = new DateTime(2023, 6, 11, 10, 30, 0);

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
        body: Obx(
          () => addNewHorseController.loadingData.value
              ? Center(
                  child: CircularProgressIndicator(
                  color: cPrimaryColor,
                ))
              : addNewHorseController.errorData.value != ""
                  ? Center(
                      child: Custom_Error(
                          onpressed: () {
                            addNewHorseController.getExpertOpinoinData();
                          },
                          error: addNewHorseController.errorData.value))
                  : Container(
                      padding: padA10,
                      width: context.width * 1,
                      height: context.height * 1,
                      child: SingleChildScrollView(
                        child: Form(
                          key: addNewHorseController.addNewHorseFormKey,
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
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  gapW10,
                                  Expanded(
                                    child: Obx(
                                      () => SelectContainerComponent(
                                        text: "fixed price",
                                        isChecked: addNewHorseController
                                            .isOnFixedPriceChecked.value,
                                        onTapFunction: () {
                                          addNewHorseController
                                              .toggleTypeOfPurchase(
                                                  isBiddingTapped: false);
                                        },
                                      ),
                                    ),
                                  ),
                                  gapW50,
                                  Expanded(
                                    child: Obx(
                                      () => SelectContainerComponent(
                                        text: "bidding",
                                        isChecked: addNewHorseController
                                            .isBiddingChecked.value,
                                        onTapFunction: () {
                                          addNewHorseController
                                              .toggleTypeOfPurchase(
                                                  isBiddingTapped: true);
                                        },
                                      ),
                                    ),
                                  ),
                                  gapW10,
                                ],
                              ),
                              gapH30,
                              //Component 2 //Bidding Text
                              // Component 10 Bidding Preview
                              Obx(
                                () =>
                                    addNewHorseController.isBiddingChecked.value
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
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
                                              image: horseFrontView,
                                              text: "horse image from front"),
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
                                                image: horseLeftView,
                                                text: "horse image from left")),
                                        gapW40,
                                        Expanded(
                                          child: CustomContainerComponent(
                                              onTapFunction: () {
                                                _horseRightViewMenu(context);
                                              },
                                              image: horseRightView,
                                              text:
                                                  "picture of the horse from the right"),
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
                                                addNewHorseController
                                                        .isVideoPlaceShow
                                                        .value =
                                                    !addNewHorseController
                                                        .isVideoPlaceShow.value;

                                                print(addNewHorseController
                                                    .isVideoPlaceShow.value);
                                              }),
                                        ),
                                        gapW40,
                                        Expanded(
                                          child: MediaButton(
                                              text: "more pictures",
                                              onPressFunction: () {
                                                addNewHorseController
                                                        .isMorePicPlaceShow
                                                        .value =
                                                    !addNewHorseController
                                                        .isMorePicPlaceShow
                                                        .value;
                                              }),
                                        ),
                                        gapW30,
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              addNewHorseController.isVideoPlaceShow.value
                                  ? gapH10
                                  : gapH10,

                              Obx(
                                  () =>
                                      addNewHorseController
                                              .isVideoPlaceShow.value
                                          ? GestureDetector(
                                              onTap: () {
                                                _horseVideoPick(context);
                                              },
                                              child: Container(
                                                height: 150,
                                                decoration: BoxDecoration(
                                                    color: cCulturedWhiteColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                child: Center(
                                                  child: _pickedVideo != null
                                                      ? AspectRatio(
                                                          aspectRatio:
                                                              _videoPlayerController!
                                                                  .value
                                                                  .aspectRatio,
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
                                          : addNewHorseController
                                                  .isMorePicPlaceShow.value
                                              ? Container(
                                                  height: 150,
                                                  decoration: BoxDecoration(
                                                      color:
                                                          cCulturedWhiteColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Container(
                                                        height: 150,
                                                        width: double.infinity,
                                                        // color: Colors.red,
                                                        child: Row(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Expanded(
                                                                flex: 3,
                                                                child:
                                                                    Container(
                                                                  height: 150,
                                                                  // decoration: BoxDecoration(
                                                                  //     color:
                                                                  //         cCulturedWhiteColor,
                                                                  //     borderRadius:
                                                                  //         BorderRadius
                                                                  //             .circular(
                                                                  //                 10)),

                                                                  child: _selectedImages
                                                                              .length ==
                                                                          0
                                                                      ? Center(
                                                                          child:
                                                                              Text("select images"),
                                                                        )
                                                                      : GridView
                                                                          .builder(
                                                                          gridDelegate:
                                                                              SliverGridDelegateWithFixedCrossAxisCount(
                                                                            crossAxisCount:
                                                                                3,
                                                                          ),
                                                                          itemCount:
                                                                              _selectedImages.length,
                                                                          itemBuilder:
                                                                              (BuildContext context, int index) {
                                                                            return Container(
                                                                              margin: EdgeInsets.all(4),
                                                                              height: 60,
                                                                              width: 60,
                                                                              decoration: BoxDecoration(color: cCulturedWhiteColor, borderRadius: BorderRadius.circular(10)),
                                                                              child: Image.file(
                                                                                _selectedImages[index],
                                                                                fit: BoxFit.cover,
                                                                              ),
                                                                            );
                                                                          },
                                                                        ),
                                                                )),
                                                            Expanded(
                                                                flex: 1,
                                                                child: Center(
                                                                  child:
                                                                      GestureDetector(
                                                                    onTap: () {
                                                                      _openImagePicker(
                                                                          context);
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      height:
                                                                          100,
                                                                      width: 60,
                                                                      decoration: BoxDecoration(
                                                                          color:
                                                                              cCulturedWhiteColor,
                                                                          borderRadius:
                                                                              BorderRadius.circular(10)),
                                                                      child: Icon(
                                                                          Icons
                                                                              .add),
                                                                    ),
                                                                  ),
                                                                ))
                                                          ],
                                                        )),
                                                  ),
                                                )
                                              : SizedBox()),
                              addNewHorseController.isVideoPlaceShow.value
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
                                                          addNewHorseController
                                                              .nameOfHorseController,
                                                    )),
                                              ),
                                              gapW15,
                                              Expanded(
                                                child: TwoWidgetsAlignComponent(
                                                    text: "type",
                                                    passedWidget: SizedBox(
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          context.isPortrait
                                                              ? const SizedBox
                                                                  .shrink()
                                                              : gapW50,
                                                          Obx(() {
                                                            return AddHorseRadioButton(
                                                              value:
                                                                  horseTypeList[
                                                                      0],
                                                              groupValue:
                                                                  addNewHorseController
                                                                      .horseType
                                                                      .value,
                                                              onChangeFunction:
                                                                  (value) {
                                                                addNewHorseController
                                                                    .checkForHorseType(
                                                                        value:
                                                                            value);
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
                                                              value:
                                                                  horseTypeList[
                                                                      1],
                                                              groupValue:
                                                                  addNewHorseController
                                                                      .horseType
                                                                      .value,
                                                              onChangeFunction:
                                                                  (value) {
                                                                addNewHorseController
                                                                    .checkForHorseType(
                                                                        value:
                                                                            value);
                                                              },
                                                            );
                                                          }),
                                                          Text(
                                                            "mare".tr,
                                                            style: onyx410,
                                                          ),
                                                          context.isPortrait
                                                              ? gapW10
                                                              : gapW50
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
                                                child:
                                                    ThreeWidgetsAlignComponent(
                                                        topText:
                                                            "name of the father",
                                                        passedWidget:
                                                            NewHorseTextFormWithoutLabelComponent(
                                                          textController:
                                                              addNewHorseController
                                                                  .fathersNameController,
                                                        ),
                                                        bottomText:
                                                            "leave blank if unknown"),
                                              ),
                                              gapW15,
                                              Expanded(
                                                child:
                                                    ThreeWidgetsAlignComponent(
                                                        topText: "mother name",
                                                        passedWidget: SizedBox(
                                                          child:
                                                              NewHorseTextFormWithoutLabelComponent(
                                                            textController:
                                                                addNewHorseController
                                                                    .mothersNameController,
                                                          ),
                                                        ),
                                                        bottomText:
                                                            "leave blank if unknown"),
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
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        gapW5,
                                                        Expanded(
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            children: [
                                                              gapH2,
                                                              Text(
                                                                "month (not mandatory)"
                                                                    .tr,
                                                                style: onyx405,
                                                              ),
                                                              Expanded(
                                                                  child:
                                                                      TextFormCustomColorComponent(
                                                                onChanged:
                                                                    (val) {
                                                                  if (int.parse(
                                                                          val) >
                                                                      12) {
                                                                    Get.snackbar(
                                                                      'invalidage'
                                                                          .tr,
                                                                      'pleaseenteranagenotgreaterthan12.'
                                                                          .tr,
                                                                    );
                                                                    addNewHorseController
                                                                        .ageMonthController
                                                                        .clear();
                                                                  }
                                                                },
                                                                inputFormatters: [
                                                                  FilteringTextInputFormatter
                                                                      .allow(RegExp(
                                                                          r'^\d{0,2}$')),
                                                                ],
                                                                textController:
                                                                    addNewHorseController
                                                                        .ageMonthController,
                                                                fillColor:
                                                                    cScaffoldBackground,
                                                                keyboardType:
                                                                    TextInputType
                                                                        .number,
                                                              )),
                                                              gapH2,
                                                            ],
                                                          ),
                                                        ),
                                                        gapW5,
                                                        Expanded(
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
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
                                                                    addNewHorseController
                                                                        .ageYearController,
                                                                fillColor:
                                                                    cScaffoldBackground,
                                                                keyboardType:
                                                                    TextInputType
                                                                        .number,
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
                                                          addNewHorseController
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
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      context.isPortrait
                                                          ? const SizedBox
                                                              .shrink()
                                                          : gapW50,
                                                      Obx(() {
                                                        return AddHorseRadioButton(
                                                          value:
                                                              conditionList[0],
                                                          groupValue:
                                                              addNewHorseController
                                                                  .condition
                                                                  .value,
                                                          onChangeFunction:
                                                              (value) {
                                                            print('$value');
                                                            addNewHorseController
                                                                .checkForCondition(
                                                                    value:
                                                                        value);
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
                                                          value:
                                                              conditionList[1],
                                                          groupValue:
                                                              addNewHorseController
                                                                  .condition
                                                                  .value,
                                                          onChangeFunction:
                                                              (value) {
                                                            addNewHorseController
                                                                .checkForCondition(
                                                                    value:
                                                                        value);
                                                          },
                                                        );
                                                      }),
                                                      Text(
                                                        "injured".tr,
                                                        style: onyx410,
                                                      ),
                                                      context.isPortrait
                                                          ? gapW10
                                                          : gapW50
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
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          context.isPortrait
                                                              ? const SizedBox
                                                                  .shrink()
                                                              : gapW50,
                                                          Obx(() {
                                                            return AddHorseRadioButton(
                                                              value:
                                                                  originalityList[
                                                                      0],
                                                              groupValue:
                                                                  addNewHorseController
                                                                      .originality
                                                                      .value,
                                                              onChangeFunction:
                                                                  (value) {
                                                                addNewHorseController
                                                                    .checkForOriginality(
                                                                        value:
                                                                            value);
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
                                                              value:
                                                                  originalityList[
                                                                      1],
                                                              groupValue:
                                                                  addNewHorseController
                                                                      .originality
                                                                      .value,
                                                              onChangeFunction:
                                                                  (value) {
                                                                addNewHorseController
                                                                    .checkForOriginality(
                                                                        value:
                                                                            value);
                                                              },
                                                            );
                                                          }),
                                                          Text(
                                                            "hybrid".tr,
                                                            style: onyx410,
                                                          ),
                                                          context.isPortrait
                                                              ? gapW10
                                                              : gapW50
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
                                                    text:
                                                        "did he complete his vaccinations?",
                                                    passedWidget: SizedBox(
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          context.isPortrait
                                                              ? const SizedBox
                                                                  .shrink()
                                                              : gapW50,
                                                          Obx(() {
                                                            return AddHorseRadioButton(
                                                              value:
                                                                  yesOrNoList[
                                                                      0],
                                                              groupValue:
                                                                  addNewHorseController
                                                                      .yesOrNoForIsVaccinated
                                                                      .value,
                                                              onChangeFunction:
                                                                  (value) {
                                                                print(value);
                                                                addNewHorseController
                                                                    .checkYesOrNoForIsVaccinated(
                                                                        value:
                                                                            value);
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
                                                              value:
                                                                  yesOrNoList[
                                                                      1],
                                                              groupValue:
                                                                  addNewHorseController
                                                                      .yesOrNoForIsVaccinated
                                                                      .value,
                                                              onChangeFunction:
                                                                  (value) {
                                                                print(value);
                                                                addNewHorseController
                                                                    .checkYesOrNoForIsVaccinated(
                                                                        value:
                                                                            value);
                                                              },
                                                            );
                                                          }),
                                                          Text(
                                                            "no".tr,
                                                            style: onyx410,
                                                          ),
                                                          context.isPortrait
                                                              ? gapW10
                                                              : gapW50
                                                        ],
                                                      ),
                                                    )),
                                              ),
                                              gapW15,
                                              Expanded(
                                                child: TwoWidgetsAlignComponent(
                                                    text:
                                                        "does he have evidence?",
                                                    passedWidget: SizedBox(
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          context.isPortrait
                                                              ? const SizedBox
                                                                  .shrink()
                                                              : gapW50,
                                                          Obx(() {
                                                            return AddHorseRadioButton(
                                                              value:
                                                                  yesOrNoList[
                                                                      0],
                                                              groupValue:
                                                                  addNewHorseController
                                                                      .yesOrNoForHaveEvidence
                                                                      .value,
                                                              onChangeFunction:
                                                                  (value) {
                                                                addNewHorseController
                                                                    .checkYesOrNoForHaveEvidence(
                                                                        value:
                                                                            value);
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
                                                              value:
                                                                  yesOrNoList[
                                                                      1],
                                                              groupValue:
                                                                  addNewHorseController
                                                                      .yesOrNoForHaveEvidence
                                                                      .value,
                                                              onChangeFunction:
                                                                  (value) {
                                                                addNewHorseController
                                                                    .checkYesOrNoForHaveEvidence(
                                                                        value:
                                                                            value);
                                                              },
                                                            );
                                                          }),
                                                          Text(
                                                            "no".tr,
                                                            style: onyx410,
                                                          ),
                                                          context.isPortrait
                                                              ? gapW10
                                                              : gapW50
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
                                                  child:
                                                      ReusableRegionDropDownFormField(
                                                labelAlignment:
                                                    FloatingLabelAlignment
                                                        .center,
                                              )),
                                              gapW15,
                                              Expanded(
                                                child: TwoWidgetsAlignComponent(
                                                    text: "city/province",
                                                    passedWidget:
                                                        NewHorseTextFormWithoutLabelComponent(
                                                      textController:
                                                          addNewHorseController
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
                                  gapH10,
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Container(
                                          height: 40,
                                          width: 40,
                                          decoration: BoxDecoration(
                                              color: cCheckBackground,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          alignment: Alignment.center,
                                          child: Transform.scale(
                                            scale: 1.5,
                                            child: Obx(() {
                                              return Checkbox(
                                                  value: addNewHorseController
                                                      .needExpertOpinion.value,
                                                  checkColor: cPrimaryColor,
                                                  fillColor:
                                                      const MaterialStatePropertyAll(
                                                          cCheckBackground),
                                                  overlayColor:
                                                      const MaterialStatePropertyAll(
                                                          cCheckBackground),
                                                  side: const BorderSide(
                                                      color: cCheckBackground),
                                                  onChanged: (val) {
                                                    addNewHorseController
                                                        .checkExpertOpinion(
                                                            value: val!);
                                                    addNewHorseController.calculateTotalPrice(
                                                        horsePrice:
                                                            addNewHorseController
                                                                .horsePrice
                                                                .toInt(),
                                                        expertopinionChosen:
                                                            addNewHorseController
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
                                          style:
                                              auctionDescriptionPrimaryTextStyle,
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
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: Colors.white,
                                            ),
                                            child: Text(
                                              addNewHorseController
                                                      .expertOpinionModel
                                                      .opinion!
                                                      .description ??
                                                  "",
                                              textAlign: TextAlign.justify,
                                              style:
                                                  auctionDescriptionTextStyle,
                                            ),
                                          ),
                                        ),
                                        Align(
                                            alignment: Alignment.topCenter,
                                            child: Text(
                                              "it's recommended!".tr,
                                              style:
                                                  auctionMediumPrimaryTextStyle,
                                            )),
                                      ]),
                                    ),
                                  ),
                                ],
                              ),
                              gapH20,
                              //Component 6 Bidding Preview
                              Obx(
                                  () =>
                                      addNewHorseController
                                              .isBiddingChecked.value
                                          ? SizedBox(
                                              height: 194,
                                              child: Stack(children: [
                                                Align(
                                                  alignment:
                                                      Alignment.bottomCenter,
                                                  child: Container(
                                                    padding: padA20,
                                                    height: 185,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      color: Colors.white,
                                                    ),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                          children: [
                                                            gapW5,
                                                            Expanded(
                                                              child: SizedBox(
                                                                height: 64,
                                                                child: Stack(
                                                                    children: [
                                                                      Align(
                                                                        alignment:
                                                                            Alignment.bottomCenter,
                                                                        child: Container(
                                                                            padding: padA20,
                                                                            height: 55,
                                                                            alignment: Alignment.center,
                                                                            decoration: BoxDecoration(
                                                                              borderRadius: BorderRadius.circular(10),
                                                                              color: cCheckBackground,
                                                                            ),
                                                                            child: Text(
                                                                              addNewHorseController.expertOpinionModel.opinion!.percentage.toString(),
                                                                              style: primary716,
                                                                            )),
                                                                      ),
                                                                      Align(
                                                                          alignment: Alignment
                                                                              .topCenter,
                                                                          child:
                                                                              Text(
                                                                            "site commission".tr,
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                            style:
                                                                                auctionValueTextStyle,
                                                                          )),
                                                                    ]),
                                                              ),
                                                            ),
                                                            gapW15,
                                                            Expanded(
                                                              child: SizedBox(
                                                                height: 64,
                                                                child: Stack(
                                                                    children: [
                                                                      Align(
                                                                        alignment:
                                                                            Alignment.bottomCenter,
                                                                        child: Container(
                                                                            padding: padA20,
                                                                            height: 55,
                                                                            alignment: Alignment.center,
                                                                            decoration: BoxDecoration(
                                                                              borderRadius: BorderRadius.circular(10),
                                                                              color: cCheckBackground,
                                                                            ),
                                                                            child: ReUsableText(
                                                                              text: addNewHorseController.expertOpinionModel.opinion!.price.toString(),
                                                                              textStyle: primary716,
                                                                            )),
                                                                      ),
                                                                      Align(
                                                                          alignment: Alignment
                                                                              .topCenter,
                                                                          child:
                                                                              Text(
                                                                            "expert opinion".tr,
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                            style:
                                                                                auctionValueTextStyle,
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
                                                          textAlign:
                                                              TextAlign.justify,
                                                          style:
                                                              auctionValueTextStyle,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Align(
                                                    alignment:
                                                        Alignment.topCenter,
                                                    child: Text(
                                                      "price".tr,
                                                      style:
                                                          auctionMediumPrimaryTextStyle,
                                                    )),
                                              ]),
                                            )
                                          : const SizedBox.shrink()),

                              //Components 7 Column For Fixed Price Preview
                              Obx(
                                () => addNewHorseController
                                        .isOnFixedPriceChecked.value
                                    ? Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          // Component 6 Fixed Price Preview
                                          SizedBox(
                                            height: 99,
                                            width: context.width * 1,
                                            child: Stack(children: [
                                              Align(
                                                alignment:
                                                    Alignment.bottomCenter,
                                                child: Container(
                                                    padding: padA20,
                                                    height: 90,
                                                    width: context.width * 1,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      color:
                                                          cCulturedWhiteColor,
                                                    ),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        Expanded(
                                                          flex: 2,
                                                          child:
                                                              NewHorseSimpleTextFormFieldComponent(
                                                                  onChanged:
                                                                      (val) {
                                                                    addNewHorseController
                                                                            .horsePrice
                                                                            .value =
                                                                        int.parse(
                                                                            val);

                                                                    addNewHorseController
                                                                        .calculateTotalPrice(
                                                                      horsePrice:
                                                                          int.parse(
                                                                              val),
                                                                    );
                                                                  },
                                                                  hintText:
                                                                      "Enter Price",
                                                                  textController:
                                                                      addNewHorseController
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
                                                            ? const SizedBox
                                                                .shrink()
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
                                                        style:
                                                            auctionMediumPrimaryTextStyle,
                                                      ),
                                                    ],
                                                  )),
                                            ]),
                                          ),
                                          gapH20,
                                          // Component 7 Fixed Price Preview
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
                                                            text: addNewHorseController
                                                                .expertOpinionModel
                                                                .settings!
                                                                .siteComission
                                                                .toString(),
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
                                                            text: addNewHorseController
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
                                                          addNewHorseController
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
                                          hintText: addNewHorseController
                                                  .expertOpinionModel
                                                  .opinion!
                                                  .description ??
                                              "",
                                          textController: addNewHorseController
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
                                () => addNewHorseController
                                        .isOnFixedPriceChecked.value
                                    ? Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          SizedBox(
                                            height: 99,
                                            width: context.width * 1,
                                            child: Stack(children: [
                                              Align(
                                                alignment:
                                                    Alignment.bottomCenter,
                                                child: Container(
                                                  padding: padA20,
                                                  height: 90,
                                                  width: context.width * 1,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    color: cCulturedWhiteColor,
                                                  ),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Expanded(
                                                        child:
                                                            ReusableBankDropDownFormField(),
                                                      ),
                                                      gapW5,
                                                      Expanded(
                                                        flex: 2,
                                                        child: CheckOutTextFormComponent(
                                                            labelText:
                                                                "iban no",
                                                            textController:
                                                                addNewHorseController
                                                                    .ibanNumberController),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                  alignment:
                                                      Alignment.topCenter,
                                                  child: Text(
                                                    "bank info".tr,
                                                    style: primary516,
                                                  )),
                                            ]),
                                          ),
                                          gapH40,
                                        ],
                                      )
                                    : Row(
                                        children: [
                                          Expanded(
                                            child: Column(
                                              children: [
                                                Text(
                                                  "auction date".tr,
                                                  style: TextStyle(
                                                      fontFamily: "Tajawal",
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: cRomanSilverColor),
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    addNewHorseController
                                                        .pickDate();
                                                  },
                                                  child: Container(
                                                    height: 40,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      color:
                                                          cCulturedWhiteColor,
                                                    ),
                                                    child: Center(
                                                        child: Obx(() => Text(
                                                              "${DateFormat('yyyy-MM-dd').format(DateTime.parse(addNewHorseController.selectedDate.value.toString()))}",
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                      "Tajawal",
                                                                  fontSize: 13,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  color:
                                                                      cRomanSilverColor),
                                                            ))),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          gapW15,
                                          Expanded(
                                            child: Column(
                                              children: [
                                                Text(
                                                  "Auction Time",
                                                  style: TextStyle(
                                                      fontFamily: "Tajawal",
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: cRomanSilverColor),
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    pickTime(context);
                                                  },
                                                  child: Container(
                                                    height: 40,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      color:
                                                          cCulturedWhiteColor,
                                                    ),
                                                    child: Center(
                                                        child: Text(
                                                      DateFormat.Hm().format(
                                                          convertedDateTime),

                                                      // "${addNewHorseController.convertedDateTime}",
                                                      style: TextStyle(
                                                          fontFamily: "Tajawal",
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color:
                                                              cRomanSilverColor),
                                                    )),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                              ),

                              gapH10,
                              // Component 10
                              Obx(() {
                                return PrimaryColorButton(
                                    width: context.width * 1,
                                    loading: addNewHorseController
                                            .isOnFixedPriceChecked.value
                                        ? addNewHorseController.loading.value
                                        : addNewHorseController.loading2.value,
                                    height: 55,
                                    stringText: addNewHorseController
                                            .isOnFixedPriceChecked.value
                                        ? "add"
                                        : "submit a bid request",
                                    textStyle: onyx718,
                                    onPressFunction: addNewHorseController
                                            .isOnFixedPriceChecked.value
                                        ? () {
                                            if (addNewHorseController
                                                        .nameOfHorseController
                                                        .text
                                                        .length ==
                                                    0 ||
                                                addNewHorseController
                                                        .ageYearController
                                                        .text
                                                        .length ==
                                                    0 ||
                                                addNewHorseController
                                                        .colorController
                                                        .text
                                                        .length ==
                                                    0 ||
                                                addNewHorseController
                                                        .cityOrProvinceController
                                                        .text
                                                        .length ==
                                                    0 ||
                                                addNewHorseController
                                                        .priceController
                                                        .text
                                                        .length ==
                                                    0 ||
                                                addNewHorseController
                                                        .additionalDescriptionController
                                                        .text
                                                        .length ==
                                                    0 ||
                                                addNewHorseController
                                                        .ibanNumberController
                                                        .text
                                                        .length ==
                                                    0) {
                                              Get.snackbar(
                                                "notification".tr,
                                                "please fill all text fields",
                                              );
                                            } else if (addNewHorseController
                                                    .ageYearController
                                                    .text
                                                    .length !=
                                                4) {
                                              Get.snackbar(
                                                'Invalid Year',
                                                'Please enter valid year',
                                              );
                                              addNewHorseController
                                                  .ageYearController
                                                  .clear();
                                            } else {
                                              horseFrontView == null ||
                                                      horseBackView == null ||
                                                      horseLeftView == null ||
                                                      horseRightView == null ||
                                                      _selectedImages.length ==
                                                          0 ||
                                                      _pickedVideo == null
                                                  ? Get.snackbar(
                                                      "notification".tr,
                                                      "please add all images",
                                                    )
                                                  : addNewHorseController
                                                      .addNewHorse(
                                                          context,
                                                          horseFrontView!,
                                                          horseBackView!,
                                                          horseLeftView!,
                                                          horseRightView!,
                                                          _selectedImages,
                                                          _pickedVideo!);
                                            }
                                          }
                                        : () {
                                            if (addNewHorseController
                                                        .nameOfHorseController
                                                        .text
                                                        .length ==
                                                    0 ||
                                                addNewHorseController
                                                        .ageMonthController
                                                        .text
                                                        .length ==
                                                    0 ||
                                                addNewHorseController
                                                        .ageYearController
                                                        .text
                                                        .length ==
                                                    0 ||
                                                addNewHorseController
                                                        .colorController
                                                        .text
                                                        .length ==
                                                    0 ||
                                                addNewHorseController
                                                        .cityOrProvinceController
                                                        .text
                                                        .length ==
                                                    0 ||
                                                addNewHorseController
                                                        .additionalDescriptionController
                                                        .text
                                                        .length ==
                                                    0) {
                                              Get.snackbar(
                                                "notification".tr,
                                                "please fill all text frields",
                                              );
                                            } else if (addNewHorseController
                                                    .ageYearController
                                                    .text
                                                    .length !=
                                                4) {
                                              Get.snackbar(
                                                'Invalid Year',
                                                'Please enter valid year',
                                              );
                                              addNewHorseController
                                                  .ageYearController
                                                  .clear();
                                            } else {
                                              horseFrontView == null ||
                                                      horseBackView == null ||
                                                      horseLeftView == null ||
                                                      horseRightView == null
                                                  ? Get.snackbar(
                                                      "notification".tr,
                                                      "please add all images",
                                                    )
                                                  : addNewHorseController
                                                      .addBidingHorse(
                                                          context,
                                                          horseFrontView!,
                                                          horseBackView!,
                                                          horseLeftView!,
                                                          horseRightView!,
                                                          _selectedImages,
                                                          _pickedVideo!);
                                            }
                                          });
                              }),
                              gapH20,
                            ],
                          ),
                        ),
                      ),
                    ),
        ));
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

//////////////////////select time

  void pickTime(context) async {
    var selectedTime =
        TimeOfDay.now(); // Initialize selectedTime with the current time

    // Show time picker dialog and wait for user selection
    var time = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );

    if (time != null) {
      // Update selectedTime with the user-selected time
      selectedTime = time;

      // Convert selectedTime to DateTime
      DateTime now = DateTime.now();
      DateTime dateTime = DateTime(
        now.year,
        now.month,
        now.day,
        selectedTime.hour,
        selectedTime.minute,
      );

      // Save the dateTime value in a variable
      setState(() {
        convertedDateTime = dateTime;
        addNewHorseController.convertedDateTime = dateTime;

        print(
            "************************  ${addNewHorseController.convertedDateTime}");
      });
      // Use the convertedDateTime variable as needed
      // Example: print the convertedDateTime value
      print(convertedDateTime);
    }
  }
}
