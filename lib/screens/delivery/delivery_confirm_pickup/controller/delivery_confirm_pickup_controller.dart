import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:obaiah_mobile_app/screens/delivery/delivery_confirm_pickup/models/delivery_confirm_pickup_model.dart';
import 'package:obaiah_mobile_app/screens/delivery/my_deliveries/view/my_delivery_screen.dart';
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

  RxBool isVideoPlaceShowed = false.obs;
  RxBool isNotesImagePlaceShowed = false.obs;
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

  var deliveryConfirmPickupModel = DeliveryConfirmPickupResponse();
  RxBool deliveryConfirmPickupLoading = false.obs;
  RxString error1 = "".obs;

  void confirmDeliveryPickup(
      {File? horseImageFromRight,
      File? horseImageFromLeft,
      File? horseFrontView,
      File? notesImage,
      File? horseBackView,
      File? horseVideo,
      String? notesText,
      int? hid}) async {
    deliveryConfirmPickupLoading.value = true;
    error1.value = "";

    var res = await DeliverConformPivkupService.deliveryConfirmPickup(
        horseImageFromRight: horseImageFromRight,
        horseImageFromLeft: horseImageFromLeft,
        horseBackView: horseBackView,
        horseFrontView: horseFrontView,
        notesImage: notesImage,
        horseVideo: horseVideo);
    deliveryConfirmPickupLoading.value = false;
    if (res is DeliveryConfirmPickupResponse) {
      deliveryConfirmPickupModel = res;

      confirmPickup(notesText ?? "", hid ?? 0);

      print(deliveryConfirmPickupModel.horseBackView);
    } else {
      deliveryConfirmPickupLoading.value = false;
      error1.value = res.toString();
      Get.snackbar("notification", error1.value);
    }
  }

  ////////////////////////////////////
  var confirmPickupModel1 = ConfirmPickupResponse();

  void confirmPickup(String notes, int horseId) async {
    deliveryConfirmPickupLoading.value = true;
    error1.value = "";

    var res = await DeliverConformPivkupService.confirmPickup(
        horseId: horseId,
        horseImageFromRight: deliveryConfirmPickupModel.horseImageFromRight,
        horseImageFromLeft: deliveryConfirmPickupModel.horseImageFromLeft,
        horseBackView: deliveryConfirmPickupModel.horseBackView,
        horseFrontView: deliveryConfirmPickupModel.horseFrontView,
        notesImage: deliveryConfirmPickupModel.notesImage,
        horseVideo: deliveryConfirmPickupModel.horseVideo,
        notes: notes);
    deliveryConfirmPickupLoading.value = false;
    if (res is ConfirmPickupResponse) {
      confirmPickupModel1 = res;
      Get.snackbar("notification", "Saved Successfully");
      Get.off(() => MyDeliveryScreen());
    } else {
      deliveryConfirmPickupLoading.value = false;
      error1.value = res.toString();
      Get.snackbar("notification", error1.value);
    }
  }
}
