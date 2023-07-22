import 'dart:convert';
import 'dart:io';
import 'package:path/path.dart' as path;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:obaiah_mobile_app/screens/delivery/account/model/update_delivery_account_model.dart';
import 'package:obaiah_mobile_app/screens/delivery/account/service/update_delivery_account_service.dart';
import 'package:obaiah_mobile_app/screens/delivery/delivery_home/model/delivery_account_response.dart';
import 'package:obaiah_mobile_app/screens/delivery/delivery_home/services/delivery_account_service.dart';

class DeliveryAccountController extends GetxController {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController idNumberController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController regionController = TextEditingController();
  TextEditingController cityProvinceController = TextEditingController();
  TextEditingController bankNameController = TextEditingController();
  TextEditingController ibanNoController = TextEditingController();
  RxList<bool> chosenCountryValuesList = [
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

  changeChoseValue({required bool value, required int index}) {
    chosenCountryValuesList.removeAt(index);
    chosenCountryValuesList.insert(index, value);
  }

  int? userId;
  var loading = false.obs;
  var error = "".obs;
  var deliveryAccountModel = DeliveryAccountResponse();

  String idBackBase64 = "";
  String idFrontBase64 = "";
  String idFrontextension = "";
  String idBackextension = "";

  @override
  void onInit() {
    loadData();
    // TODO: implement onInit
    super.onInit();
  }

  void loadData() async {
    getUserId();
    await Future.delayed(Duration(milliseconds: 600));
    deliveryAccount(userId!);
  }

  void deliveryAccount(int uid) async {
    loading.value = true;
    error.value = "";
    var res = await DeliveryAccountService.deliveryAccount(uid);

    loading.value = false;

    if (res is DeliveryAccountResponse) {
      deliveryAccountModel = res;
      fullNameController.text =
          deliveryAccountModel.data!.deliveryAccount!.fullname ?? "";
      idNumberController.text =
          deliveryAccountModel.data!.deliveryAccount!.idNumber ?? "";
      bankNameController.text =
          deliveryAccountModel.data!.deliveryAccount!.bankName ?? "";
      cityProvinceController.text =
          deliveryAccountModel.data!.deliveryAccount!.cityOrProvince ?? "";
      mobileNumberController.text =
          deliveryAccountModel.data!.deliveryAccount!.mobileNumber ?? "";
      ibanNoController.text =
          deliveryAccountModel.data!.deliveryAccount!.ibanNumber ?? "";
    } else {
      loading.value = false;
      error.value = res.toString();
    }
  }

  void getUserId() {
    userId = GetStorage().read("userId");
  }

  ////////////////////update delivery account
  RxBool updatingAccount = false.obs;
  RxString error2 = "".obs;
  var updateAccountModel = UpdateDeliveryAccountResponse();
  int chosencityIndex = 0;
  void updateAccount(
      int? userId,
      String? fullname,
      String? region,
      dynamic cityOrProvince,
      String? idNumber,
      File? idPhotoFront,
      File? idPhotoBack,
      String? mobileNumber,
      String? bankName,
      String? ibanNumber,
      List<String>? ordersAcceptanceRegionList) async {
    error2.value = "";
    updatingAccount.value = true;
    fileToString(idPhotoFront!, idPhotoBack!);
    var res = await UpdateDeliveryAccountService.updateUser2(
        userId: userId,
        fullname: fullname,
        region: region,
        cityOrProvince: cityOrProvince,
        idNumber: idNumber,
        idPhotoFront: idFrontBase64,
        idPhotoBack: idBackBase64,
        mobileNumber: mobileNumber,
        bankName: bankName,
        ibanNumber: ibanNumber,
        ordersAcceptanceRegionList: ordersAcceptanceRegionList);

    updatingAccount.value = false;

    if (res is UpdateDeliveryAccountResponse) {
      updateAccountModel = res;

      Get.snackbar("notification".tr, "Account updated successfull");
    } else {
      updatingAccount.value = false;
      error2.value = res.toString();
      Get.snackbar("notification".tr, error2.value);
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
}
