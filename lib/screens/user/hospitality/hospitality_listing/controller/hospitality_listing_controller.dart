import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';

class HospitalityListingController extends GetxController {
  RxInt noOfMonths = 0.obs;
  CarouselSliderController sliderController = CarouselSliderController();

  incrementMonths() {
    noOfMonths.value = noOfMonths.value + 1;
  }

  decrementMonths() {
    if (noOfMonths.value != 0) {
      noOfMonths.value = noOfMonths.value - 1;
    } else {
      Get.snackbar("notification".tr, "months are already zero".tr);
    }
  }
}
