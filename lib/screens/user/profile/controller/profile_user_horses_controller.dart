import 'dart:developer';

import 'package:get/get.dart';

class ProfileUserHorsesController extends GetxController {
  Rx<bool> isStableChecked = RxBool(true);
  Rx<bool> isRatingsChecked = Rx<bool>(false);

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
