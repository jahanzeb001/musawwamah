import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class OnBoardingController extends GetxController {
  RxInt pageIndex = 0.obs;
  PageController pageController = PageController(initialPage: 0);

  increaseIndex() {
    pageIndex.value = pageIndex.value + 1;
  }

  decreaseIndex() {
    pageIndex.value = pageIndex.value - 1;
  }

  setPageIndex({required int index}) {
    pageIndex.value = index;
  }

  changeLanguage({required String languageCode, required String countryCode}) {
    var locale = Locale(languageCode, countryCode);
    Get.updateLocale(locale);
    log("Changing Language");
  }

  @override
  void onClose() {
    log('disposing controllers');
    pageController.dispose();
    super.onClose();
  }
}
