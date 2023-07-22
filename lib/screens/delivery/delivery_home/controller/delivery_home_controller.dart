import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:obaiah_mobile_app/screens/delivery/delivery_home/model/delivery_account_response.dart';
import 'package:obaiah_mobile_app/screens/delivery/delivery_home/services/delivery_account_service.dart';

class DeliveryHomeController extends GetxController {
  int? userId;
  var loading = false.obs;
  var error = "".obs;
  var deliveryAccountModel = DeliveryAccountResponse();

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
    } else {
      loading.value = false;
      error.value = res.toString();
    }
  }

  void getUserId() {
    userId = GetStorage().read("userId");
  }
}
