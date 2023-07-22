import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:obaiah_mobile_app/screens/user/settings/my_orders/model/get_my_purchase_response.dart';
import 'package:obaiah_mobile_app/screens/user/settings/my_orders/services/get_my_purchase_servic.dart';

class MyOrdersController extends GetxController {
  RxBool showInGrid = RxBool(false);

  RxBool loading = false.obs;
  RxString error = "".obs;
  var myPurchaseModel = GetMyPurchasResponse();
  int? uid;

  changeView() {
    showInGrid.value = !showInGrid.value;
  }

  void loadData() async {
    getUserId();
    Future.delayed(Duration(milliseconds: 600));

    getMyPurchase(uid!);
  }

  void getUserId() {
    uid = GetStorage().read("userId");
  }

  void getMyPurchase(int uid) async {
    error.value = '';
    loading.value = true;

    var res = await GetMyPurchaseService.getMyPurchase(uid);
    loading.value = false;

    if (res is GetMyPurchasResponse) {
      myPurchaseModel = res;
    } else {
      loading.value = false;
      error.value = res.toString();
    }
  }
}
