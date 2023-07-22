import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:obaiah_mobile_app/generated/assets.dart';
import 'package:obaiah_mobile_app/screens/user/auth/authentication/view/login.dart';
import 'package:obaiah_mobile_app/utils/colors/colors.dart';
import 'package:obaiah_mobile_app/utils/constants/constants.dart';
import 'package:obaiah_mobile_app/utils/spacing/gaps.dart';
import '../../../../../reusable_widgets/reusable_button.dart';
import '../../../../../utils/spacing/padding.dart';
import '../components/on_boarding_screen_component.dart';
import '../controller/onBoardingController.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final onBoardingController = Get.find<OnBoardingController>();

    Size mediaSize = MediaQuery.of(context).size;
    Orientation mediaOrientation = MediaQuery.of(context).orientation;
    log("Inside On  Boarding Screen");
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
                      onBoardingController.changeLanguage(
                          languageCode: "ar", countryCode: "SA");
                    } else {
                      onBoardingController.changeLanguage(
                          languageCode: "en", countryCode: "US");
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
            //     onBoardingController.changeLanguage(
            //         languageCode: "ar", countryCode: "SA");
            //   },
            //   englishFunction: () {
            //     onBoardingController.changeLanguage(
            //         languageCode: "en", countryCode: "US");
            //   },
            // ),
            const Spacer(),
            Expanded(
              flex: 3,
              child: PageView.builder(
                  controller: onBoardingController.pageController,
                  itemCount: 3,
                  scrollDirection: Axis.horizontal,
                  onPageChanged: (value) {
                    onBoardingController.setPageIndex(index: value);
                    log(value.toString());
                  },
                  itemBuilder: (context, index) {
                    return OnBoardingWidgets(
                      index: index,
                    );
                  }),
            ),
            mediaOrientation == Orientation.portrait
                ? const Spacer()
                : const SizedBox.shrink(),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Obx(() {
                  return ProgressIdentifierComponent(
                    selectedIndex: onBoardingController.pageIndex.value,
                    itemIndex: 0,
                  );
                }),
                gapW5,
                Obx(() {
                  return ProgressIdentifierComponent(
                    selectedIndex: onBoardingController.pageIndex.value,
                    itemIndex: 1,
                  );
                }),
                gapW5,
                Obx(() {
                  return ProgressIdentifierComponent(
                    selectedIndex: onBoardingController.pageIndex.value,
                    itemIndex: 2,
                  );
                }),
              ],
            ),
            mediaOrientation == Orientation.portrait ? gapH70 : gapH50,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "you have an account?".tr,
                  style: const TextStyle(
                      fontFamily: "Tajawal",
                      fontWeight: FontWeight.w500,
                      fontSize: 14),
                ),
                TextButton(
                    onPressed: () {
                      Get.to(() => LoginScreen());
                      // Navigator.pushNamed(
                      //   context,
                      //   authentication,
                      // );
                    },
                    child: Text(
                      "sign in".tr,
                      style: const TextStyle(
                          fontFamily: "Tajawal",
                          color: cBlackColor,
                          fontWeight: FontWeight.w900,
                          fontSize: 14),
                    )),
              ],
            ),
            gapH15,
            ReusableButton(
                onPressFunction: () {
                  Navigator.pushNamed(
                    context,
                    authentication,
                  );
                },
                stringText: "sign up"),
            gapH20,
          ],
        ),
      ),
    ));
  }
}
