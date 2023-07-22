import 'package:get/get.dart';

class DeliveryController extends GetxController {
  var userBalance = 0.obs;

  void setTotal(val) {
    userBalance.value = val;
  }
}
