import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';

import '../models/hospitality_listing_model.dart';
import '../services/get_my_hospitality_services.dart';

class HospitalityListingController extends GetxController {
  RxBool loading = false.obs;
  RxString error = "".obs;
  int? userId;
  int deliveryId = 0;
  var mybalance = "".obs;
  int userBalance = 0;
  var myHospitalityListingModel = GetHospitalityListingResponse();
  List<String> images = [];
  @override
  void onInit() {
    loading.value = true;
    // loadData();
    //getUserBalance();
    // TODO: implement onInit
    super.onInit();
  }

  void getMyHospitalityListing(id) async {
    error.value = '';
    loading.value = true;

    var res = await GetMyHospitalityListingService.getMyHospitalityListing(id);
    loading.value = false;

    if (res is GetHospitalityListingResponse) {
      myHospitalityListingModel = res;
    } else {
      loading.value = false;
      error.value = res.toString();
    }
  }

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
