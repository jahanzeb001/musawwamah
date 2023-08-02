import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:obaiah_mobile_app/reusable_widgets/reusable_appbar.dart';
import 'package:obaiah_mobile_app/utils/constants/custom_error.dart';
import 'package:obaiah_mobile_app/utils/constants/no_data_message.dart';
import 'package:obaiah_mobile_app/utils/spacing/padding.dart';
import 'package:obaiah_mobile_app/utils/text_styles/textstyles.dart';

import '../../../../../reusable_widgets/reusable_dropdown_formfield.dart';
import '../../../../../utils/colors/colors.dart';
import '../../../../../utils/constants/app_urls.dart';
import '../../../../../utils/spacing/gaps.dart';
import '../../wallet_portfolio/components/wallet_portfoio_components.dart';
import '../components/account_components.dart';
import '../controller/account_controller.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
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

  AccountController accountController = Get.put(AccountController());
  @override
  void initState() {
    accountController.loadData();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AccountController accountController = Get.find<AccountController>();

    return Scaffold(
        appBar: ReusableAppBar(
            titleText: "account",
            textStyle: black718,
            onPressFunction: () {
              Navigator.pop(context);
            }),
        body: Obx(
          () => accountController.loadingUser.value
              ? Center(
                  child: CircularProgressIndicator(
                  color: cPrimaryColor,
                ))
              : accountController.errorGettingUser.value != ""
                  ? Center(
                      child: Custom_Error(
                        onpressed: () {
                          accountController.getUser(accountController.uid);
                        },
                        error: accountController.errorGettingUser.value,
                      ),
                    )
                  : accountController.getUserModel.data == null
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
                                    gapH10,
                                    AccountTextFormComponent(
                                        labelText: "card name",
                                        isLabelInCenter: false,
                                        labelTextStyle: onyx714,
                                        textController: accountController
                                            .fullNameController),
                                    gapH20,
                                    AccountTextFormComponent(
                                        labelText: "id number",
                                        keyBoardType: TextInputType.number,
                                        isLabelInCenter: false,
                                        labelTextStyle: onyx714,
                                        textController: accountController
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
                                                  child: idFrontView == null
                                                      ? InkWell(
                                                          onTap: () {
                                                            _showBottomSheetMenuForFront(
                                                                context);
                                                          },
                                                          child:
                                                              CustomContainerComponent(
                                                            image: idFrontView,
                                                            onTapFunction: () {
                                                              _showBottomSheetMenuForFront(
                                                                  context);

                                                              print(
                                                                  "The image of the id Front View is ====== ${idFrontView}");
                                                              print(
                                                                  "The image of the id Front View is ====== ${idBackView}");
                                                            },
                                                            text:
                                                                "id photo from the front",
                                                          ))
                                                      : CustomContainerComponent(
                                                          image: idFrontView,
                                                          onTapFunction: () {
                                                            _showBottomSheetMenuForFront(
                                                                context);

                                                            print(
                                                                "The image of the id Front View is ====== ${idFrontView}");
                                                            print(
                                                                "The image of the id Front View is ====== ${idBackView}");
                                                          },
                                                          text:
                                                              "id photo from the front",
                                                        ),
                                                ),
                                                gapW20,
                                                Expanded(
                                                  child: idBackView == null
                                                      ? InkWell(
                                                          onTap: () {
                                                            _showBottomSheetMenu(
                                                                context);
                                                          },
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
                                                      : CustomContainerComponent(
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
                                              ReusableRegionDropDownFormField(
                                            controller: accountController
                                                .regionController,
                                          ),
                                        ),
                                        gapW5,
                                        Expanded(
                                          child: AccountTextFormComponent(
                                              labelText: "city/province",
                                              isLabelInCenter: false,
                                              labelTextStyle: onyx709,
                                              textController: accountController
                                                  .cityProvinceController),
                                        ),
                                      ],
                                    ),
                                    gapH20,
                                    AccountTextFormComponent(
                                        labelText: "mobile number",
                                        isLabelInCenter: false,
                                        labelTextStyle: onyx714,
                                        keyBoardType: TextInputType.phone,
                                        textController: accountController
                                            .mobileNumberController),
                                    gapH20,
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Expanded(
                                          child: ReusableBankDropDownFormField(
                                            controller: accountController
                                                .bankNameController,
                                          ),
                                        ),
                                        gapW5,
                                        Expanded(
                                          flex: 2,
                                          child: AccountTextFormComponent(
                                              labelText: "iban no",
                                              isLabelInCenter: true,
                                              labelTextStyle: onyx709,
                                              textController: accountController
                                                  .ibanNoController),
                                        ),
                                      ],
                                    ),
                                    const Spacer(),
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Expanded(
                                          flex: 2,
                                          child: Obx(() =>
                                              WalletAlertDialogButtonComponent(
                                                text: "save",
                                                loading: accountController
                                                    .updatingUser.value,
                                                backGroundColor: cPrimaryColor,
                                                onPressedFunction: () {
                                                  accountController.UpdateUser(
                                                      accountController.uid,
                                                      accountController
                                                          .fullNameController
                                                          .text,
                                                      accountController
                                                          .idNumberController
                                                          .text,
                                                      accountController
                                                          .regionController
                                                          .text,
                                                      accountController
                                                          .cityProvinceController
                                                          .text,
                                                      accountController
                                                          .mobileNumberController
                                                          .text,
                                                      accountController
                                                          .bankNameController
                                                          .text,
                                                      accountController
                                                          .ibanNoController
                                                          .text,
                                                      idBackView!,
                                                      idFrontView!);
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
