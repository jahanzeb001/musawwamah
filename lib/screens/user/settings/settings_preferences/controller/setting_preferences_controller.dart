import 'dart:developer';
import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:obaiah_mobile_app/screens/user/settings/account/model/get_user_response.dart';
import 'package:obaiah_mobile_app/screens/user/settings/account/service/get_user_service.dart';

class SettingPreferencesController extends GetxController {
  onInit() {
    super.onInit();
    loadData();
  }

  RxBool areAlertsOn = RxBool(false);
  RxBool areDarkModeOn = RxBool(false);
  RxBool isPromotionMessagingOn = RxBool(false);
  RxBool isLocationServicesOn = RxBool(false);

  toggleAlerts({required bool alertsSwitchValue}) {
    areAlertsOn.value = alertsSwitchValue;
    AppSettings.openSoundSettings();
  }

  toggleDarkMode({required bool darkModeValue}) {
    areDarkModeOn.value = darkModeValue;
    changeTheme(turnDarkModeOff: !darkModeValue);
  }

  togglePromotionMessaging({required bool promotingMessagingValue}) {
    isPromotionMessagingOn.value = promotingMessagingValue;
    AppSettings.openNotificationSettings();
  }

  toggleLocationServices({required bool locationServicesValue}) async {
    isLocationServicesOn.value = locationServicesValue;
    AppSettings.openLocationSettings();
  }

  changeTheme({required bool turnDarkModeOff}) {
    log("Changing Theme");
    if (turnDarkModeOff) {
      Get.changeTheme(ThemeData.light());
    } else {
      Get.changeTheme(ThemeData.dark());
    }
  }

  loadData() async {
    uid = getUserId();
    print("*****************************$uid");
    await Future.delayed(Duration(seconds: 1));
    getFromPref();
  }

  int getUserId() {
    final box = GetStorage();
    return box.read('userId');
  }

  RxBool loadingUser = false.obs;
  int uid = 0;
  RxString errorGettingUser = ''.obs;
  var getUserModel = GetUserResponse();

  var updatingSettings = false.obs;
  var error = "".obs;

  void updateAppSettings() async {
    error.value = "";
    updatingSettings.value = true;

    var res = await UserService.updateAppSettings(
        uid,
        areAlertsOn.value == true ? "1" : "0",
        areDarkModeOn.value == true ? "1" : "0",
        isPromotionMessagingOn.value == true ? "1" : "0",
        isLocationServicesOn.value == true ? "1" : "0");
    updatingSettings.value = false;
    if (res is GetUserResponse) {
      getUserModel = res;
      Get.snackbar("notification".tr, "updated successfull");

      // areAlertsOn.value = getUserModel.data!.getAlerts == "1" ? true : false;
      // areDarkModeOn.value =
      //     getUserModel.data!.darkModeEnabled == "1" ? true : false;
      // isLocationServicesOn.value =
      //     getUserModel.data!.detectLocation == "1" ? true : false;
      // isPromotionMessagingOn.value =
      //     getUserModel.data!.getPromotionalMessages == "1" ? true : false;

      if (getUserModel.data != null) {
        saveDataToPref();
        Get.snackbar("notification".tr, "data saved to prefrence");
      }

      // getUserModel.data!.getAlerts == "1" ? true : false,
      // getUserModel.data!.darkModeEnabled == "1" ? true : false,
      // getUserModel.data!.getPromotionalMessages == "1" ? true : false,
      // getUserModel.data!.detectLocation == "1" ? true : false);
    } else {
      updatingSettings.value = false;
      error.value = res.toString();
      Get.snackbar("notification".tr, "your preferences are saved".tr);
    }
  }

  void saveDataToPref() {
    GetStorage().write("areAlertsOn", areAlertsOn.value);
    GetStorage().write("areDarkModeOn", areDarkModeOn.value);
    GetStorage().write("isPromotionMessagingOn", isPromotionMessagingOn.value);
    GetStorage().write("isLocationServicesOn", isLocationServicesOn.value);

    // print(
    //     "********************* dark mode val ${GetStorage().read("areDarkModeOn")}");
  }

  void getFromPref() {
    areAlertsOn.value = GetStorage().read("areAlertsOn");
    areDarkModeOn.value = GetStorage().read("areDarkModeOn");
    isPromotionMessagingOn.value = GetStorage().read("isPromotionMessagingOn");
    areAlertsOn.value = GetStorage().read("areAlertsOn");
  }
}
