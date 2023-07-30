import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:obaiah_mobile_app/screens/user/home/home/models/get_all_propertise_list_response.dart';
import 'package:obaiah_mobile_app/screens/user/home/home/models/get_approved_horses_response.dart';
import 'package:obaiah_mobile_app/screens/user/home/home/service/get_approved_horse_servic.dart';

class HomeScreenController extends GetxController {
  RxBool loadingApprovedHorse = false.obs;
  RxString errorGettingApprovedHorses = "".obs;
  var approvedHorsesModel = GetApprovedHorsesResponse();
  final showInGrid = RxBool(false);
  TextEditingController fullNameController = TextEditingController();
  TextEditingController cityNameController = TextEditingController();
  TextEditingController regionNameController = TextEditingController();

  RxList<bool> filterValuesList = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ].obs;

  RxList<bool> filterCheckBoxValueList = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ].obs;

  changeFilterCheckBoxValue({required int index, required bool value}) {
    filterCheckBoxValueList.removeAt(index);
    filterCheckBoxValueList.insert(index, value);
  }

  changeChoseValue({required bool value, required int index}) {
    filterValuesList.removeAt(index);
    filterValuesList.insert(index, !value);
  }

  changeView() {
    showInGrid.value = !showInGrid.value;
  }

  void getApprovedHorses(
      {int? filter,
      String? horseType,
      String? region,
      int? age,
      String? color,
      String? safety,
      String? originality,
      String? sortby}) async {
    errorGettingApprovedHorses.value = "";
    loadingApprovedHorse.value = true;
    var res = await GetApprovedHorseService.getApprovedHorse(
        filter: filter,
        horseType: horseType,
        region: region,
        age: age,
        color: color,
        safety: safety,
        originality: originality,
        sortby: sortby);
    loadingApprovedHorse.value = false;
    if (res is GetApprovedHorsesResponse) {
      approvedHorsesModel = res;
    } else {
      loadingApprovedHorse.value = false;
      errorGettingApprovedHorses.value = res.toString();
    }
  }

  // void readDataToPref() {
  //   areAlertsOn.value = GetStorage().read("areAlertsOn") ?? false;
  //   areDarkModeOn.value = GetStorage().read("areDarkModeOn") ?? false;
  //   isPromotionMessagingOn.value =
  //       GetStorage().read("isPromotionMessagingOn") ?? false;
  //   isLocationServicesOn.value = GetStorage().read(
  //         "isLocationServicesOn",
  //       ) ??
  //       false;
  // }

  /////////////
  RxBool isTypedShow = false.obs;
  RxBool isTypedSelected = false.obs;
  RxBool isRegionShow = false.obs;
  RxBool isRegionSelected = false.obs;

  RxBool isAgeShow = false.obs;
  RxBool isAgeSelected = false.obs;

  RxBool isColorShow = false.obs;
  RxBool isColorSelected = false.obs;

  RxBool isCasualityShow = false.obs;
  RxBool isCasualitySelected = false.obs;

  RxBool isOriginalityShow = false.obs;
  RxBool isOriginalitySelected = false.obs;
/////////////////////////////
  var loading2 = false.obs;
  var error2 = "".obs;
  var propertiseModel = GetFilterPropertiseResponse();
//////////////////////////////////////////////
  List<String>? type;
  List<String>? region;
  List<String>? age;
  List<String>? color;
  List<String>? casuality;
  List<String>? originality;

  /////////////
  void getPropertiseList() async {
    loading2.value = true;
    error2.value = "";
    var res = await GetApprovedHorseService.getList();

    loading2.value = false;
    if (res is GetFilterPropertiseResponse) {
      propertiseModel = res;

      type = res.type;

      region = res.region;
      age = res.age;
      color = res.color;
      casuality = res.casuality;
      originality = res.originality;

      print("*************************${type}");
      print("*************************${age}");
      print("*************************${color}");
      print("*************************${casuality}");
      print("*************************${originality}");
    } else {
      loading2.value = false;
      error2.value = res.toString();
    }
  }
}
