import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:obaiah_mobile_app/utils/constants/custom_error.dart';
import 'package:obaiah_mobile_app/utils/constants/no_data_message.dart';
import '../../../../reusable_widgets/reusable_appbar.dart';
import '../../../../reusable_widgets/reusable_dropdown_formfield.dart';
import '../../../../utils/colors/colors.dart';
import '../../../../utils/constants/lists.dart';
import '../../../../utils/spacing/gaps.dart';
import '../../../../utils/spacing/padding.dart';
import '../../../../utils/text_styles/textstyles.dart';
import '../../../user/settings/wallet_portfolio/components/wallet_portfoio_components.dart';
import '../components/delivery_account_components.dart';
import '../controller/delivery_account_controller.dart';

class DeliveryAccountScreen extends StatefulWidget {
  const DeliveryAccountScreen({Key? key}) : super(key: key);

  @override
  State<DeliveryAccountScreen> createState() => _DeliveryAccountScreenState();
}

class _DeliveryAccountScreenState extends State<DeliveryAccountScreen> {
  File? idBackView;
  File? idFrontView;

  /////////////get Id front view
  Future<void> _getHorseFrontImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    setState(() {
      idFrontView = File(pickedFile!.path);
    });
  }

  /////////////get Id front view
  Future<void> _getHorseBackImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    setState(() {
      idBackView = File(pickedFile!.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    final deliveryAccountController = Get.find<DeliveryAccountController>();
    return Scaffold(
        appBar: ReusableAppBar(
            titleText: "account",
            textStyle: black718,
            onPressFunction: () {
              Navigator.pop(context);
            }),
        body: Obx(
          () => deliveryAccountController.loading.value
              ? Center(
                  child: CircularProgressIndicator(
                  color: cPrimaryColor,
                ))
              : deliveryAccountController.error.value != ""
                  ? Center(
                      child: Custom_Error(
                          onpressed: () {
                            deliveryAccountController.deliveryAccount(
                                deliveryAccountController.userId!);
                          },
                          error: deliveryAccountController.error.value),
                    )
                  : deliveryAccountController.deliveryAccountModel.data == null
                      ? Center(child: NoDataMessage(message: "No Data Found"))
                      : Container(
                          width: context.width * 1,
                          height: context.height * 1,
                          padding: padA10,
                          child: CustomScrollView(
                            slivers: [
                              SliverFillRemaining(
                                hasScrollBody: false,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    gapH20,
                                    DeliveryAccountTextFormComponent(
                                        labelText: "full name",
                                        isLabelInCenter: false,
                                        labelTextStyle: onyx714,
                                        textController:
                                            deliveryAccountController
                                                .fullNameController),
                                    gapH20,
                                    DeliveryAccountTextFormComponent(
                                        labelText: "id number",
                                        keyBoardType: TextInputType.number,
                                        isLabelInCenter: false,
                                        labelTextStyle: onyx714,
                                        textController:
                                            deliveryAccountController
                                                .idNumberController),
                                    gapH2,
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: Text(
                                        "to get the mark of an authenticated seller"
                                            .tr,
                                        style: onyx708,
                                      ),
                                    ),
                                    gapH20,
                                    SizedBox(
                                      height: 107,
                                      child: Stack(children: [
                                        Align(
                                          alignment: Alignment.bottomCenter,
                                          child: Container(
                                            padding: padA10,
                                            height: 100,
                                            width: context.width * 1,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: cCulturedWhiteColor),
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child:
                                                      CustomContainerComponent(
                                                    image: idFrontView,
                                                    onTapFunction: () {
                                                      _showBottomSheetMenuForFront(
                                                          context);
                                                    },
                                                    text:
                                                        "id photo from the front",
                                                  ),
                                                ),
                                                gapW20,
                                                Expanded(
                                                  child:
                                                      CustomContainerComponent(
                                                    image: idBackView,
                                                    onTapFunction: () {
                                                      _showBottomSheetMenu(
                                                          context);
                                                    },
                                                    text:
                                                        "id photo from the back",
                                                  ),
                                                )
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
                                                  "id photos".tr,
                                                  style: onyx714,
                                                ),
                                              ],
                                            )),
                                      ]),
                                    ),
                                    gapH20,
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Expanded(
                                          child:
                                              ReusableRegionDropDownFormField(),
                                        ),
                                        gapW5,
                                        Expanded(
                                          child: DeliveryAccountTextFormComponent(
                                              labelText: "city/province",
                                              isLabelInCenter: false,
                                              labelTextStyle: onyx709,
                                              textController:
                                                  deliveryAccountController
                                                      .cityProvinceController),
                                        ),
                                      ],
                                    ),
                                    gapH20,
                                    SizedBox(
                                      height: context.isPortrait ? 350 : 200,
                                      width: context.width * 1,
                                      child: Stack(children: [
                                        Align(
                                          alignment: Alignment.bottomCenter,
                                          child: Container(
                                            padding: padA20,
                                            height:
                                                context.isPortrait ? 343 : 193,
                                            width: context.width * 1,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: Colors.white,
                                            ),
                                            child: GridView.builder(
                                              physics:
                                                  const NeverScrollableScrollPhysics(),
                                              shrinkWrap: true,
                                              itemCount: 13,
                                              gridDelegate:
                                                  SliverGridDelegateWithFixedCrossAxisCount(
                                                      mainAxisExtent: 70,
                                                      crossAxisCount:
                                                          context.isPortrait
                                                              ? 4
                                                              : 7,
                                                      crossAxisSpacing: 4.0,
                                                      mainAxisSpacing: 4.0),
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                return Obx(() {
                                                  return TransferPlacesCheckComponent(
                                                    checkBoxValue:
                                                        deliveryAccountController
                                                            .chosenCountryValuesList
                                                            .elementAt(index),
                                                    onChangeFunction: (val) {
                                                      deliveryAccountController
                                                          .changeChoseValue(
                                                              value: val!,
                                                              index: index);

                                                      deliveryAccountController
                                                              .chosencityIndex =
                                                          index;
                                                    },
                                                    cityName: citiesList[index],
                                                  );
                                                });
                                              },
                                            ),
                                          ),
                                        ),
                                        Align(
                                            alignment: Alignment.topRight,
                                            child: Row(
                                              children: [
                                                gapW20,
                                                Text(
                                                  "i accept transfer my area to:"
                                                      .tr,
                                                  style: black712,
                                                ),
                                              ],
                                            )),
                                      ]),
                                    ),
                                    gapH20,
                                    DeliveryAccountTextFormComponent(
                                        labelText: "mobile number",
                                        isLabelInCenter: false,
                                        keyBoardType: TextInputType.phone,
                                        labelTextStyle: onyx714,
                                        showVerifiedIcons: true,
                                        textController:
                                            deliveryAccountController
                                                .mobileNumberController),
                                    gapH20,
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Expanded(
                                          child:
                                              ReusableBankDropDownFormField(),
                                        ),
                                        gapW5,
                                        Expanded(
                                          flex: 2,
                                          child:
                                              DeliveryAccountTextFormComponent(
                                                  labelText: "iban no",
                                                  isLabelInCenter: true,
                                                  labelTextStyle: onyx709,
                                                  textController:
                                                      deliveryAccountController
                                                          .ibanNoController),
                                        ),
                                      ],
                                    ),
                                    gapH20,
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Expanded(
                                          flex: 2,
                                          child: Obx(() =>
                                              WalletAlertDialogButtonComponent(
                                                loading:
                                                    deliveryAccountController
                                                        .updatingAccount.value,
                                                text: "save",
                                                backGroundColor: cPrimaryColor,
                                                onPressedFunction: () {
                                                  if (deliveryAccountController.fullNameController.text.length == 0 ||
                                                      deliveryAccountController
                                                              .cityProvinceController
                                                              .text ==
                                                          0 ||
                                                      deliveryAccountController
                                                              .idNumberController
                                                              .text ==
                                                          0 ||
                                                      deliveryAccountController
                                                              .mobileNumberController
                                                              .text
                                                              .length ==
                                                          0 ||
                                                      deliveryAccountController
                                                              .ibanNoController
                                                              .text ==
                                                          0) {
                                                    Get.snackbar(
                                                        "notification".tr,
                                                        "please fill all textfields");
                                                  } else if (idFrontView ==
                                                          null ||
                                                      idBackView == null) {
                                                    Get.snackbar(
                                                        "notification".tr,
                                                        "Please select all images");
                                                  } else if (citiesList
                                                          .length ==
                                                      0) {
                                                    Get.snackbar(
                                                        "notification".tr,
                                                        "Please select region from checkbox");
                                                  } else {
                                                    deliveryAccountController.updateAccount(
                                                        deliveryAccountController
                                                            .userId,
                                                        deliveryAccountController
                                                            .fullNameController
                                                            .text,
                                                        deliveryAccountController
                                                            .regionController
                                                            .text,
                                                        deliveryAccountController
                                                            .cityProvinceController
                                                            .text,
                                                        deliveryAccountController
                                                            .idNumberController
                                                            .text,
                                                        idFrontView,
                                                        idBackView,
                                                        deliveryAccountController
                                                            .mobileNumberController
                                                            .text,
                                                        deliveryAccountController
                                                            .bankNameController
                                                            .text,
                                                        deliveryAccountController
                                                            .ibanNoController
                                                            .text,
                                                        citiesList);
                                                  }
                                                },
                                              )),
                                        ),
                                        gapW10,
                                        Expanded(
                                          child:
                                              WalletAlertDialogButtonComponent(
                                            text: "close",
                                            backGroundColor: cRomanSilverColor,
                                            onPressedFunction: () {
                                              Navigator.pop(context);
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                    gapH20,
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
        ));
  }

  /////////////////get id front pic
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
                    icon: Icon(Icons.camera_alt_outlined)),
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

  /////////////////get id back pic
  void _showBottomSheetMenuForFront(BuildContext context) {
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
                    icon: Icon(Icons.camera_alt_outlined)),
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
}
