import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:obaiah_mobile_app/reusable_widgets/reusable_appbar.dart';
import 'package:obaiah_mobile_app/screens/user/auth/authentication/controller/authentication_controller.dart';
import 'package:obaiah_mobile_app/utils/spacing/gaps.dart';
import 'package:obaiah_mobile_app/utils/spacing/padding.dart';
import '../../../../../generated/assets.dart';
import '../../../../../utils/colors/colors.dart';
import '../../../../../utils/text_styles/textstyles.dart';
import '../components/setting_preferences_componenents.dart';
import '../controller/setting_preferences_controller.dart';

class SettingPreferencesScreen extends StatelessWidget {
  const SettingPreferencesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final settingPreferencesController =
        Get.find<SettingPreferencesController>();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: ReusableAppBar(
          textStyle: black718,
          titleText: "settings",
          onPressFunction: () {
            Navigator.pop(context);
          }),
      body: Container(
        padding: padA10,
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: Obx(() {
                          return SettingCardComponent(
                              assetName: Assets.settingsImagesAlerts,
                              componentOptionTitle: "alerts",
                              switchValue: settingPreferencesController
                                  .areAlertsOn.value,
                              switchFunction: (val) {
                                settingPreferencesController.toggleAlerts(
                                    alertsSwitchValue: val);
                              });
                        }),
                      ),
                      gapW20,
                      Expanded(
                        child: Obx(() {
                          return SettingCardComponent(
                              assetName: Assets.settingsImagesLightGarkMode,
                              componentOptionTitle: "dark mode",
                              switchValue: settingPreferencesController
                                  .areDarkModeOn.value,
                              switchFunction: (val) {
                                settingPreferencesController.toggleDarkMode(
                                    darkModeValue: val);
                              });
                        }),
                      ),
                    ],
                  ),
                  gapH20,
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: Obx(() {
                          return SettingCardComponent(
                              assetName:
                                  Assets.settingsImagesPromotionalMessages,
                              componentOptionTitle: "promotional messages",
                              switchValue: settingPreferencesController
                                  .isPromotionMessagingOn.value,
                              switchFunction: (val) {
                                settingPreferencesController
                                    .togglePromotionMessaging(
                                        promotingMessagingValue: val);
                              });
                        }),
                      ),
                      gapW20,
                      Expanded(
                        child: Obx(() {
                          return SettingCardComponent(
                              assetName: Assets.settingsImagesLocation,
                              componentOptionTitle: "detect location",
                              switchValue: settingPreferencesController
                                  .isLocationServicesOn.value,
                              switchFunction: (val) {
                                settingPreferencesController
                                    .toggleLocationServices(
                                        locationServicesValue: val);
                              });
                        }),
                      ),
                    ],
                  ),
                  gapH20,
                  GestureDetector(
                    onTap: () {
                      AuthenticationController().signOut();
                      //Get.off(HomeScreenView());
                    },
                    child: Container(
                      height: 120,
                      width: context.width * 0.5,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: cWhiteColor,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            Assets.settingsImagesLogOut,
                            height: 32,
                            width: 35,
                          ),
                          gapH10,
                          Text(
                            "sign out".tr,
                            style: onyx712,
                          ),
                        ],
                      ),
                    ),
                  ),
                  gapH20,
                  const Spacer(),
                  Obx(() => ElevatedButton(
                      onPressed: () {
                        settingPreferencesController.updateAppSettings();
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: cPrimaryColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          fixedSize: Size(context.width * 0.5, 36)),
                      child: settingPreferencesController.updatingSettings.value
                          ? SizedBox(
                              height: 25,
                              width: 25,
                              child: Center(
                                child: CircularProgressIndicator(
                                  color: cBlackColor,
                                ),
                              ))
                          : Text(
                              "save".tr,
                              style: onyx810,
                            ))),
                  gapH20,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
