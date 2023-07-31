import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:obaiah_mobile_app/generated/assets.dart';
import 'package:obaiah_mobile_app/utils/text_styles/textstyles.dart';

import '../../../../../reusable_widgets/reusable_button.dart';
import '../../../../../utils/colors/colors.dart';
import '../../../../../utils/spacing/gaps.dart';
import '../../../../../utils/spacing/padding.dart';
import '../controller/authentication_controller.dart';
import 'authentication_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authenticationController = Get.find<AuthenticationController>();
    Size mediaSize = MediaQuery.of(context).size;
    log("Inside On  Authentication Screen");
    return Scaffold(
        body: SafeArea(
      child: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(Assets.onBoardingImagesBackgroundCircles),
                fit: BoxFit.cover)),
        padding: padA10,
        height: mediaSize.height * 1,
        width: mediaSize.width * 1,
        child: CustomScrollView(slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    margin: EdgeInsets.only(right: 10),
                    child: InkWell(
                      onTap: () {
                        var locael = Get.locale!.countryCode;
                        log(locael.toString());
                        if (locael.toString() == 'US') {
                          authenticationController.changeLanguage(
                              languageCode: "ar", countryCode: "SA");
                          final box = GetStorage();
                          box.write('languages', "SA");
                          log('${box.read('languages')}');
                        } else {
                          authenticationController.changeLanguage(
                              languageCode: "en", countryCode: "US");
                          final box = GetStorage();
                          box.write('languages', "US");
                          log('${box.read('languages')}');
                        }
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 35,
                        width: 27,
                        decoration: BoxDecoration(
                            border: Border.all(color: cPrimaryColor),
                            borderRadius: BorderRadius.circular(10)),
                        child: Text(
                          "language".tr,
                          style: const TextStyle(
                              fontFamily: "Tajawal",
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                ),
                // MyMenu(
                //   arabicFunction: () {
                //     authenticationController.changeLanguage(
                //         languageCode: "ar", countryCode: "SA");
                //   },
                //   englishFunction: () {
                //     authenticationController.changeLanguage(
                //         languageCode: "en", countryCode: "US");
                //   },
                // ),
                const Spacer(
                  flex: 2,
                ),
                Text(
                  "mobile number".tr,
                  style: const TextStyle(
                      fontFamily: "Tajawal",
                      fontWeight: FontWeight.w700,
                      fontSize: 26),
                ),
                gapH15,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    controller: authenticationController.mobileFieldController,
                    maxLength: 10,
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.phone,
                    style: const TextStyle(
                        fontFamily: "Tajawal",
                        fontWeight: FontWeight.w700,
                        fontSize: 14),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: cWhiteColor,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: BorderSide.none),
                    ),
                    onTap: () {
                      authenticationController.errorVerifyingPhone.value = '';
                    },
                  ),
                ),
                gapH15,
                Obx(() => ReusableButton(
                    loading: authenticationController.verifyingPhone.value,
                    onPressFunction: () {
                      var phoneNumber =
                          authenticationController.mobileFieldController.text;
                      if (phoneNumber.length == 10) {
                        if (phoneNumber.startsWith('0')) {
                          phoneNumber = '+966' + phoneNumber.substring(1);
                          authenticationController.buildContext = context;
                          authenticationController.validatePhone(phoneNumber);
                        } else {
                          Get.snackbar(
                            'error'.tr,
                            'mustbestartedfrom0'.tr,
                            snackPosition: SnackPosition.TOP,
                          );
                          log('number not start with 0 digit');
                        }
                      } else {
                        Get.snackbar(
                          'error'.tr,
                          'mustbelength10digit'.tr,
                          snackPosition: SnackPosition.TOP,
                        );
                        log('length less then 10 digit');
                      }
                    },
                    stringText: "sign in")),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        child: Text(
                      'dont have account'.tr,
                      style: TextStyle(
                        fontFamily: "Tajawal",
                        color: cBlackColor,
                      ),
                    )),
                    SizedBox(width: 15),
                    Container(
                        child: Align(
                      alignment: AlignmentDirectional.topEnd,
                      child: InkWell(
                          onTap: () {
                            Get.to(() => AuthenticationScreen());
                          },
                          child: Text(
                            'sign up'.tr,
                            style: TextStyle(
                              fontFamily: "Tajawal",
                              color: cBlackColor,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                    ))
                  ],
                ),
                const Spacer(
                  flex: 4,
                ),
                Obx(() => authenticationController.errorVerifyingPhone.value !=
                        ""
                    ? Container(
                        decoration: BoxDecoration(color: cPrimaryColor),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            authenticationController.errorVerifyingPhone.value,
                            style: homePageOnyxGridPrice,
                          ),
                        ),
                      )
                    : SizedBox()),
              ],
            ),
          )
        ]),
      ),
    ));
  }
}
