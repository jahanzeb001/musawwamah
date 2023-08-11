import 'dart:developer';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../delivery/delivery_home/controller/delivery_home_controller.dart';
import '../model/review_model.dart';
import '../services/update_user_profile_services.dart';

class ProfileUserHorsesController extends GetxController {
  Rx<bool> isStableChecked = RxBool(true);
  Rx<bool> isRatingsChecked = Rx<bool>(false);
  RxString idFrontBase64 = "".obs;
  RxString idFrontextension = "".obs;
  var loading = false.obs;
  var error = "".obs;
  RxString profileImage = "".obs;
  int uid = 0;
  var getReviewModel = GetUserReviewResponse();

  @override
  void onInit() {
    loadData();
    // TODO: implement onInit
    super.onInit();
  }

  loadData() async {
    uid = getUserId();
    print("*****************************$uid");
    await Future.delayed(Duration(seconds: 1));
  }

  int getUserId() {
    final box = GetStorage();
    return box.read('userId');
  }

  void getUserReviewRating() async {
    loading.value = true;
    error.value = "";
    var res = await GetMyProfileService.getUserReviewRating(uid);

    loading.value = false;
    if (res is GetUserReviewResponse) {
      getReviewModel = res;
    } else {
      loading.value = false;
      error.value = res.toString();
    }
  }

  final deliveryHomeController = Get.find<DeliveryHomeController>();
  void updateUserProfile(image) async {
    loading.value = true;
    error.value = "";
    var res = await GetMyProfileService.updateUserProfile(uid, image);

    loading.value = false;

    if (res == 'true') {
      Get.snackbar("notification".tr, "Update Profie");
      deliveryHomeController.loadData();
      profileImage.value = '';
    } else {
      loading.value = false;
      Get.snackbar("notification".tr, "Something went wrong");
    }
  }

  toggleTypeOfPurchase({required bool isStableTapped}) {
    if (isStableTapped) {
      if (isStableChecked.value) {
        log("Bidding Preview Already True: $isStableChecked");
      } else {
        isStableChecked.value = true;
        isRatingsChecked.value = false;
      }
    } else {
      if (isRatingsChecked.value) {
        log("Fixed Price Preview Already True: $isRatingsChecked");
      } else {
        isStableChecked.value = false;
        isRatingsChecked.value = true;
      }
    }
    log("Bidding Preview: $isStableChecked");
    log("Fixed Price Preview: $isRatingsChecked");
  }
}
