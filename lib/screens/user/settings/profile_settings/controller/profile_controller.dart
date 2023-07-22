import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProfileController extends GetxController {
  RxBool isDeliveryBoyMode = RxBool(false);
  int userId = 0;
  int userBalance = 0;
  onInit() {
    super.onInit();
    getUserId();
    getUserBalance();
  }

  toggleUseAndDeliveryBoy({required bool toggleValue}) {
    isDeliveryBoyMode.value = toggleValue;
  }

  void getUserId() {
    userId = GetStorage().read("userId");
  }

  void getUserBalance() {
    userBalance = GetStorage().read("accbal").toInt();
  }
}
