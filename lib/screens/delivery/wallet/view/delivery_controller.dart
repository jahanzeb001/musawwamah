import 'package:get/get.dart';

import '../model/delivery_account_detail_model.dart';
import '../services/deivery_wallet_services.dart';

class DeliveryController extends GetxController {
  var userBalance = 0.obs;

  void setTotal(val) {
    userBalance.value = val;
  }

  RxBool loading = false.obs;
  RxString error = "".obs;
  int? userId;
  int deliveryId = 0;

  var myDeleveryWalletDetailModel = DeliveryAccountDetailResponse();

  void getMyAccountDetail(int uid) async {
    error.value = '';
    loading.value = true;

    var res = await MyDeliveryAccountService.getMydeliveryDetail(uid);
    loading.value = false;

    if (res is DeliveryAccountDetailResponse) {
      myDeleveryWalletDetailModel = res;
    } else {
      loading.value = false;
      error.value = res.toString();
    }
  }
}
