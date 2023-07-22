import 'dart:convert';
import 'dart:io';
import 'package:path/path.dart' as path;
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:obaiah_mobile_app/screens/user/settings/account/model/get_user_response.dart';
import 'package:obaiah_mobile_app/screens/user/settings/account/service/get_user_service.dart';

class AccountController extends GetxController {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController idNumberController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController regionController = TextEditingController();
  TextEditingController cityProvinceController = TextEditingController();
  TextEditingController bankNameController = TextEditingController();
  TextEditingController ibanNoController = TextEditingController();
  String idBackBase64 = "";
  String idFrontBase64 = "";
  String idFrontextension = "";
  String idBackextension = "";
  String frontimage = "";
  String backimage = "";

  RxBool loadingUser = false.obs;
  int uid = 0;
  RxString errorGettingUser = ''.obs;
  var getUserModel = GetUserResponse();

  @override
  void onInit() {
    loadingUser.value = true;
    loadData();

    super.onInit();
  }

  loadData() async {
    uid = getUserId();
    print("*****************************$uid");
    await Future.delayed(Duration(seconds: 1));
    getUser(uid);
  }

  int getUserId() {
    final box = GetStorage();
    return box.read('userId');
  }

  void getUser(int uid) async {
    errorGettingUser.value = '';
    loadingUser.value = true;

    var res = await UserService.getUser(uid);
    loadingUser.value = false;
    if (res is GetUserResponse) {
      getUserModel = res;

      fullNameController.text = getUserModel.data!.fullname.toString();
      idNumberController.text = getUserModel.data!.idNumber.toString();
      mobileNumberController.text = getUserModel.data!.mobileNumber.toString();
      regionController.text = getUserModel.data!.region.toString();
      cityProvinceController.text =
          getUserModel.data!.cityOrProvince.toString();
      bankNameController.text = getUserModel.data!.bankName.toString();
      ibanNoController.text = getUserModel.data!.ibanNumber.toString();
      frontimage = getUserModel.data!.idPhotoFront.toString();
      backimage = getUserModel.data!.idPhotoBack.toString();
    } else {
      loadingUser.value = false;
      errorGettingUser.value = res.toString();
    }
  }

  //////////////to update user
  RxBool updatingUser = false.obs;
  RxString errorUpdating = ''.obs;
  var updtaeUserModel = GetUserResponse();

  void UpdateUser(
      int uid,
      String name,
      String id,
      String region,
      String city,
      String mobile,
      String bankName,
      String iban,
      File? idBackIMage,
      File? idfrontImage) async {
    errorUpdating.value = '';
    updatingUser.value = true;
    fileToString(idfrontImage!, idBackIMage!);
    var res = await UserService.updateUser(
        uid,
        name,
        id,
        region,
        city,
        mobile,
        bankName,
        iban,
        "data:image/$idBackextension;base64,${idBackBase64}",
        "data:image/$idFrontextension;base64,${idFrontBase64}");
    updatingUser.value = false;
    if (res is GetUserResponse) {
      getUserModel = res;
      Get.snackbar("notification".tr, "Account updated Successfully");

      fullNameController.clear();
      idNumberController.clear();
      mobileNumberController.clear();
      regionController.clear();
      cityProvinceController.clear();
      bankNameController.clear();
      ibanNoController.clear();
    } else {
      updatingUser.value = false;
      errorUpdating.value = res.toString();
    }
  }

  /////////////////convrt images to base 64
  Future<void> fileToString(
    File idFview,
    File idBview,
  ) async {
    /////////////////////////////////////////////////////////////
    idFrontBase64 = base64Encode(await idFview.readAsBytes());
    String extension = path.extension(idFview.path);
    idFrontextension = extension.substring(1);
    /////////////////////////////////////////////////////////////
    idBackBase64 = base64Encode(await idBview.readAsBytes());
    String extension2 = path.extension(idBview.path);
    idBackextension = extension2.substring(1);
  }

  ///////////////update user from dashboard

  void UpdateUser2(
    int uid,
    String name,
    String id,
    String region,
    String city,
    String mobile,
    String bankName,
    String iban,
  ) async {
    errorUpdating.value = '';
    updatingUser.value = true;

    var res = await UserService.updateUser2(
        uid, name, id, region, city, mobile, bankName, iban);
    updatingUser.value = false;
    if (res is GetUserResponse) {
      getUserModel = res;
      Get.snackbar("notification".tr, "Account updated Successfully");

      fullNameController.clear();
      idNumberController.clear();
      mobileNumberController.clear();
      regionController.clear();
      cityProvinceController.clear();
      bankNameController.clear();
      ibanNoController.clear();
    } else {
      updatingUser.value = false;
      errorUpdating.value = res.toString();
    }
  }
}
