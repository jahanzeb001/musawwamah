import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:obaiah_mobile_app/screens/user/settings/my_sold_horses/model/get_my_sales_response.dart';
import 'package:obaiah_mobile_app/screens/user/settings/my_sold_horses/service/get_my_sales_service.dart';

class MySoldHorsesController extends GetxController {
  RxBool showInGrid = RxBool(false);
  RxBool loadingSoldHorse = false.obs;
  RxString error = "".obs;
  int? uid;
  var soldHorseModel = GetMySalesResponse();

  @override
  void onInit() {
    loadData();
    super.onInit();
  }

  changeView() {
    showInGrid.value = !showInGrid.value;
  }

  void loadData() async {
    getUserId();
    Future.delayed(Duration(milliseconds: 600));
    getMySales(uid!);
  }

  void getUserId() {
    uid = GetStorage().read("userId");
  }

  void getMySales(int uid) async {
    loadingSoldHorse.value = true;
    error.value = '';
    var res = await GetMySalesService.getMySales(uid);

    loadingSoldHorse.value = false;

    if (res is GetMySalesResponse) {
      soldHorseModel = res;
    } else {
      loadingSoldHorse.value = false;
      error.value = res.toString();
    }
  }
}
