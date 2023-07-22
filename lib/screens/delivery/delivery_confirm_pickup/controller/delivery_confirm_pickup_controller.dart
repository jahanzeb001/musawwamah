import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_field.dart';

import '../models/horse_didnot_match_model.dart';
import '../services/delivery_conform_pickup_services.dart';

class DeliveryConfirmPickUpController extends GetxController {
  CarouselSliderController sliderController = CarouselSliderController();
  TextEditingController compulsoryNotesController = TextEditingController();
  OtpFieldController confirmPickUpOtpController = OtpFieldController();
  var error = "".obs;
  var loading = false.obs;
  int? deliveryAccountId = 0;
  //var myCoonectionsModel = GetMyConnectionResponse();

  @override
  void onInit() {
    loading.value = true;

    super.onInit();
  }

  RxBool loading2 = false.obs;
  RxString error2 = "".obs;
  var horseDidnotModel = HorseDidnotMatch();

  void horseDidnotMatch(int deliveryPersonId, int horseId, int index) async {
    print("methos id running on index :$index");
    loading2.value = true;
    error2.value = "";

    var res = await DeliverConformPivkupService.horseDidnotMatch(
        deliveryPersonId, horseId);
    loading2.value = false;
    if (res is HorseDidnotMatch) {
      horseDidnotModel = res;
      Get.snackbar("notifications".tr, "Horse Did Not Match");

      // getMyConnection(deliveryAccountId!);
    } else {
      loading2.value = false;
      error2.value = res.toString();
      Get.snackbar("notifications".tr, error2.value);
    }
  }

  void customerRefusedToReceived(
      int deliveryPersonId, int horseId, int index) async {
    print("methos id running on index :$index");
    loading2.value = true;
    error2.value = "";

    var res = await DeliverConformPivkupService.customerRefusedToReceived(
        deliveryPersonId, horseId);
    loading2.value = false;
    if (res is HorseDidnotMatch) {
      horseDidnotModel = res;
      Get.snackbar("notifications".tr, "Success");

      // getMyConnection(deliveryAccountId!);
    } else {
      loading2.value = false;
      error2.value = res.toString();
      Get.snackbar("notifications".tr, error2.value);
    }
  }
  // @override
  // void onClose() {
  //   log('disposing controllers');
  //   super.onClose();
  // }
}
