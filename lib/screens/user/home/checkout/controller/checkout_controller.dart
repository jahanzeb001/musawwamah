import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:obaiah_mobile_app/screens/user/home/checkout/model/buy_horse_response.dart';
import 'package:obaiah_mobile_app/screens/user/home/checkout/service/check_out_service.dart';
import 'package:obaiah_mobile_app/screens/user/settings/account/model/get_user_response.dart';
import 'package:obaiah_mobile_app/screens/user/settings/account/service/get_user_service.dart';

class CheckoutController extends GetxController {
  TextEditingController cardHolderNameController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController regionController = TextEditingController();
  TextEditingController cityProvinceController = TextEditingController();
  TextEditingController bankNameController = TextEditingController();
  TextEditingController ibanNoController = TextEditingController();
  Rx<bool> needTransportServices = Rx<bool>(false);
  int userId = 0;
  RxBool loadingUser = false.obs;
  RxString errorGettingUser = "".obs;
  RxString tome = "".obs;
  var getUserModel = GetUserResponse();

  @override
  void onInit() {
    loadData();

    // TODO: implement onInit
    super.onInit();
  }

  checkNeedTransportServices({required bool value}) {
    needTransportServices.value = value;
  }

  void getUserId() {
    userId = GetStorage().read("userId");
  }

  void getUser(int uid) async {
    errorGettingUser.value = '';
    loadingUser.value = true;

    var res = await UserService.getUser(uid);
    loadingUser.value = false;
    if (res is GetUserResponse) {
      getUserModel = res;

      cardHolderNameController.text = getUserModel.data!.fullname.toString();
      //  idNumberController.text = getUserModel.data!.idNumber.toString();
      mobileNumberController.text = getUserModel.data!.mobileNumber.toString();
      regionController.text = getUserModel.data!.region.toString();
      cityProvinceController.text =
          getUserModel.data!.cityOrProvince.toString();
      tome.value = getUserModel.data!.cityOrProvince.toString();
      bankNameController.text = getUserModel.data!.bankName.toString();
      ibanNoController.text = getUserModel.data!.ibanNumber.toString();
    } else {
      loadingUser.value = false;
      errorGettingUser.value = res.toString();
    }
  }

  void loadData() async {
    getUserId();
    await Future.delayed(Duration(milliseconds: 600));
    getUser(userId);
  }

  ///////////////////////add to wishlist
  var loading3 = false.obs;
  var error3 = "".obs;
  var buyHorseModel = BuyHorseResponse();
  void buyHorse(int purchaserId, int sellerId, int horseId, String pickupAdd,
      String deliveryAdd) async {
    error3.value = "";
    loading3.value = true;
    var res = await ChackOutService.buyHorse(
        purchaserId, sellerId, horseId, pickupAdd, deliveryAdd);
    loading3.value = false;
    if (res is BuyHorseResponse) {
      buyHorseModel = res;
      Get.snackbar("notification".tr, "horse purchased successfull".tr);
    } else {
      loading3.value = false;
      error3.value = res.toString();
      Get.snackbar("notification".tr, error3.value);
    }
  }
}
