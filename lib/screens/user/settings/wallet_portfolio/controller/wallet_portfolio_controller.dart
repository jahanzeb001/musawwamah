import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:obaiah_mobile_app/screens/user/settings/wallet_portfolio/model/get_my_wallet_response.dart';
import 'package:obaiah_mobile_app/screens/user/settings/wallet_portfolio/service/get_my_wallet_service.dart';

class WalletPortfolioController extends GetxController {
  TextEditingController bankNameController = TextEditingController();
  TextEditingController ibanNoController = TextEditingController();
  TextEditingController amountNoController = TextEditingController();

  RxBool loading = false.obs;
  RxString error = "".obs;
  int? userId;
  int deliveryId = 0;
  var mybalance = "".obs;
  int userBalance = 0;
  var myWalletModel = GetDeleveryWalletResponse();
  @override
  void onInit() {
    loading.value = true;
    // loadData();
    //getUserBalance();
    // TODO: implement onInit
    super.onInit();
  }

  void getUserId() {
    userId = GetStorage().read("userId");
  }

  void getMyWallet(int uid) async {
    error.value = '';
    loading.value = true;

    var res = await GetMyWalletService.getMydeleveryWallet(uid);
    loading.value = false;

    if (res is GetDeleveryWalletResponse) {
      myWalletModel = res;
      int mybalance = int.parse('${myWalletModel.accountBalance}');
      GetStorage().write("accbal", mybalance);
    } else {
      loading.value = false;
      error.value = res.toString();
    }
  }

  void getUserBalance() {
    userBalance = GetStorage().read("accbal").toInt();
  }
}
