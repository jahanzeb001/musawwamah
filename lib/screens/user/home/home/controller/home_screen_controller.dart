import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:obaiah_mobile_app/screens/user/home/home/models/get_all_propertise_list_response.dart';
import 'package:obaiah_mobile_app/screens/user/home/home/models/get_approved_horses_response.dart';
import 'package:obaiah_mobile_app/screens/user/home/home/service/get_approved_horse_servic.dart';

import '../models/filter_propertise_response.dart';

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
      String? age,
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

//   var loading2 = false.obs;
//   var error2 = "".obs;
//   var propertiseModel = GetFilterPropertiseResponse();
// //////////////////////////////////////////////
//   List<String>? type;
//   List<String>? selectedtype;
//   List<String>? region;
//   List<String>? selectedregion;
//   List<String>? age;
//   List<String>? selectedage;
//   List<String>? color;
//   List<String>? selectedColor;
//   List<String>? casuality;
//   List<String>? selectedCasuality;
//   List<String>? originality;
//   List<String>? selectedorignality;

//   RxBool typeSelected = false.obs;
//   RxBool regionSelected = false.obs;
/////////////////////////////////////////////////
  // void getPropertiseList() async {
  //   loading2.value = true;
  //   error2.value = "";
  //   var res = await GetApprovedHorseService.getList();

  //   loading2.value = false;
  //   if (res is GetFilterPropertiseResponse) {
  //     propertiseModel = res;

  //     type = res.type;

  //     region = res.region;
  //     age = res.age;
  //     color = res.color;
  //     casuality = res.casuality;
  //     originality = res.originality;

  //     print("*************************${type}");
  //     print("*************************${age}");
  //     print("*************************${color}");
  //     print("*************************${casuality}");
  //     print("*************************${originality}");
  //   } else {
  //     loading2.value = false;
  //     error2.value = res.toString();
  //   }
  // }

/////////////
  RxBool isTypedShow = false.obs;
  String selectedType = "";
  RxBool isRegionShow = false.obs;
  String selectedRegion = "";
  RxBool isAgeShow = false.obs;
  String selectedAge = "";
  RxBool isColorShow = false.obs;
  String selectedColor = "";
  RxBool isCasualityShow = false.obs;
  String selectedCasuality = "";
  RxBool isOriginalityShow = false.obs;
  String selectedOriginality = "";
/////////////////////////////
  var loading2 = false.obs;
  var error2 = "".obs;
  var propertiseModel = PropertiseFIlterResponse();

  /////////////
  void getPropertiseList() async {
    loading2.value = true;
    error2.value = "";
    var res = await GetApprovedHorseService.getList();

    loading2.value = false;
    if (res is PropertiseFIlterResponse) {
      propertiseModel = res;

      propertiseModel.type = res.type;

      propertiseModel.region = res.region;
      propertiseModel.horseage = res.horseage;
      propertiseModel.horsecolor = res.horsecolor;
      propertiseModel.casuality = res.casuality;
      propertiseModel.originality = res.originality;

      print("*********${propertiseModel.type}");
      print("*********${propertiseModel.region}");
      print("*********${propertiseModel.horseage}");
      print("*********${propertiseModel.horsecolor}");
      print("*********${propertiseModel.casuality}");

      print("*********${propertiseModel.originality}");
    } else {
      loading2.value = false;
      error2.value = res.toString();
    }
  }
}
