import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../response/get_delivery_response.dart';
import '../servicess/my_services.dart';

class MyDeliveryWalletPortfolioController extends GetxController {
  TextEditingController bankNameController = TextEditingController();
  TextEditingController ibanNoController = TextEditingController();

  RxBool loading = false.obs;
  RxString error = "".obs;
  int? userId;
  int deliveryId = 0;
  int userBalance = 0;
  var myWalletModel = GetDeleveryWalletResponse();
  @override
  void onInit() {
    loading.value = true;
    // loadData();
    getUserBalance();
    // TODO: implement onInit
    super.onInit();
  }

  void getUserId() {
    userId = GetStorage().read("userId");
  }

  void getMyWallet(int uid) async {
    error.value = '';
    loading.value = true;

    var res = await GetMyWalletService.getMydeleveryWallet(87);
    loading.value = false;

    if (res is GetDeleveryWalletResponse) {
      myWalletModel = res;
    } else {
      loading.value = false;
      error.value = res.toString();
    }
  }

  void getUserBalance() {
    userBalance = GetStorage().read("accbal");
  }
}
