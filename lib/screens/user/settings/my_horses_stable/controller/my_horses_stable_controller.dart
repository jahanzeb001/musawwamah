import 'dart:io';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:obaiah_mobile_app/screens/user/add_new_horse/model/upload_images_response.dart';
import 'package:obaiah_mobile_app/screens/user/settings/my_horses_stable/model/add_to_sale_model.dart';
import 'package:obaiah_mobile_app/screens/user/settings/my_horses_stable/model/modify_horse_response.dart';
import 'package:obaiah_mobile_app/screens/user/settings/my_horses_stable/model/my_horse_stable_model.dart';
import 'package:obaiah_mobile_app/screens/user/settings/my_horses_stable/service/my_horse_stable_service.dart';

class MyHorsesStableController extends GetxController {
  RxBool showInGrid = RxBool(false);

  RxString error = "".obs;
  RxBool loading = false.obs;
  int uid = 0;
  var stableHorseModel = MyHorseStableResponse();

  changeView() {
    showInGrid.value = !showInGrid.value;
  }

  getUserId() {
    final box = GetStorage();
    uid = box.read('userId');
  }

  loadData() async {
    getUserId();

    await Future.delayed(Duration(milliseconds: 500));
    getStableHorse(uid);
  }

  Future<dynamic> getStableHorse(uid) async {
    loading.value = true;
    error.value = '';
    var res = await MyHorseStableService.myHorseStable(uid);
    loading.value = false;
    if (res is MyHorseStableResponse) {
      stableHorseModel = res;
    } else {
      error.value = res.toString();
      loading.value = false;
    }
  }

  //////////////////add to sale method
  var loading2 = false.obs;
  var error2 = "".obs;
  var addToSaleModel = AddToSaleStableResponse();

  void addToSale(int hid) async {
    loading2.value = true;
    error2.value = "";
    var res = await MyHorseStableService.addToSale(hid);

    loading2.value = false;

    if (res is AddToSaleStableResponse) {
      addToSaleModel = res;
      Get.snackbar("notification".tr, "Added to Sale Successfully");
    } else {
      loading2.value = false;
      error2.value = res.toString();
      Get.snackbar("notification".tr, error2.value);
    }
  }

  /////////////////////////////////modify horse

  var loading3 = false.obs;
  var error3 = "".obs;
  var modifyHorseModel = ModifyHorseResponse();
  var addHorseImage = AddImagesResponse();

  void modifyHorse({
    File? fview,
    File? bview,
    File? lview,
    File? rview,
    int? hid,
    String? nameOfHorse,
    String? type,
    String? fathersName,
    String? mothersName,
    String? monthOfBirth,
    String? yearOfBirth,
    dynamic age,
    String? color,
    String? casuality,
    String? originality,
    dynamic region,
    String? city,
    dynamic siteCommision,
    dynamic expertOpinionPrice,
    dynamic totalPrice,
    String? ibanNumber,
  }) async {
    loading3.value = true;
    error3.value = "";

    var res1 =
        await MyHorseStableService.uploadFiles(fview!, bview!, lview!, rview!);
    if (res1 is AddImagesResponse) {
      addHorseImage = res1;
    } else {
      loading.value = false;
      Get.snackbar(
        "notification".tr,
        error.value,
      );
    }
    var res = await MyHorseStableService.modifyHorse(
        hid: hid,
        nameOfHorse: nameOfHorse,
        type: type,
        fathersName: fathersName,
        mothersName: mothersName,
        monthOfBirth: monthOfBirth,
        yearOfBirth: yearOfBirth,
        age: int.parse(age),
        color: color,
        casuality: casuality,
        originality: originality,
        region: region,
        city: city,
        siteCommision: siteCommision,
        expertOpinionPrice: expertOpinionPrice,
        totalPrice: totalPrice,
        ibanNumber: ibanNumber,
        horseBackView: addHorseImage.horseBackView,
        horseFrontView: addHorseImage.horseFrontView,
        horseImageFromLeft: addHorseImage.horseImageFromLeft,
        horseImageFromRight: addHorseImage.horseImageFromRight);

    loading3.value = false;

    if (res is ModifyHorseResponse) {
      modifyHorseModel = res;

      Get.snackbar("notification".tr, res.message.toString());

      Get.back();
    } else {
      loading3.value = false;
      error3.value = res.toString();
      Get.snackbar("notification".tr, error3.value);
    }
  }
}
