import 'dart:developer';

import 'package:alt_sms_autofill/alt_sms_autofill.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:obaiah_mobile_app/generated/assets.dart';

import '../../../../../reusable_widgets/reusable_button.dart';
import '../../../../../utils/colors/colors.dart';
import '../../../../../utils/spacing/gaps.dart';
import '../../../../../utils/spacing/padding.dart';
import '../../on_boarding_screen/components/on_boarding_screen_component.dart';
import '../controller/authentication_controller.dart';

class AuthenticationScreen extends StatefulWidget {
  //BuildContext? context;
  const AuthenticationScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  @override
  void dispose() {
    AltSmsAutofill().unregisterListener();
    super.dispose();
  }

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
                MyMenu(
                  arabicFunction: () {
                    authenticationController.changeLanguage(
                        languageCode: "ar", countryCode: "SA");
                    final box = GetStorage();
                    box.write('languages', "SA");
                    log('${box.read('languages')}');
                  },
                  englishFunction: () {
                    authenticationController.changeLanguage(
                        languageCode: "en", countryCode: "US");
                    final box = GetStorage();
                    box.write('languages', "US");
                    log('${box.read('languages')}');
                  },
                ),
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
                  ),
                ),
                gapH15,
                Obx(() => ReusableButton(
                    loading: authenticationController.loading.value,
                    onPressFunction: () {
                      var phoneNumber =
                          authenticationController.mobileFieldController.text;
                      if (phoneNumber.length == 10) {
                        if (phoneNumber.startsWith('0')) {
                          phoneNumber = '+966' + phoneNumber.substring(1);
                          authenticationController.buildContext = context;
                          authenticationController.Signup(
                            phoneNumber,
                          );
                        } else {
                          Get.snackbar(
                            'error'.tr,
                            'mustbestartedfrom0'.tr,
                            snackPosition: SnackPosition.TOP,
                          );
                          log('lnumber not start with 0 digit');
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
                    stringText: "sign up")),
                const Spacer(
                  flex: 5,
                ),
              ],
            ),
          )
        ]),
      ),
    ));
  }
}
