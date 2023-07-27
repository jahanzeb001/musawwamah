import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:obaiah_mobile_app/screens/delivery/delivery_confirm_dropoff/models/confirm_drop_off_model.dart';
import 'package:obaiah_mobile_app/screens/delivery/delivery_confirm_dropoff/service/confirm_dropoff_service.dart';
import 'package:obaiah_mobile_app/screens/delivery/delivery_confirm_pickup/services/delivery_conform_pickup_services.dart';
import 'package:obaiah_mobile_app/screens/delivery/my_deliveries/view/my_delivery_screen.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';

import '../../delivery_confirm_pickup/models/delivery_confirm_pickup_model.dart';

class DeliveryConfirmDropOffController extends GetxController {
  CarouselSliderController sliderController = CarouselSliderController();
  TextEditingController compulsoryNotesController = TextEditingController();
  OtpFieldController confirmPickUpOtpController = OtpFieldController();
  GlobalKey<SfSignaturePadState> signaturePadKey = GlobalKey();
  RxBool isNotesImagePlaceShowed = false.obs;
  RxBool isVideoPlaceShowed = false.obs;

  @override
  void onClose() {
    log('disposing controllers');
    super.onClose();
  }

  var deliveryConfirmPickupModel = DeliveryConfirmPickupResponse();
  RxBool deliveryConfirmDropOffLoading = false.obs;
  RxString error1 = "".obs;
  String savedBase64Image = "";

  void confirmDeliveryDropOff(
      {File? horseImageFromRight,
      File? horseImageFromLeft,
      File? horseFrontView,
      File? notesImage,
      File? horseBackView,
      File? horseVideo,
      String? notesText,
      File? signature,
      int? hid}) async {
    deliveryConfirmDropOffLoading.value = true;
    error1.value = "";
    String completeBase64Image = await convertFileToBase64(signature!);
    var res = await DeliverConformPivkupService.deliveryConfirmPickup(
        horseImageFromRight: horseImageFromRight,
        horseImageFromLeft: horseImageFromLeft,
        horseBackView: horseBackView,
        horseFrontView: horseFrontView,
        notesImage: notesImage,
        horseVideo: horseVideo);
    deliveryConfirmDropOffLoading.value = false;
    if (res is DeliveryConfirmPickupResponse) {
      deliveryConfirmPickupModel = res;
      if (deliveryConfirmPickupModel.success == true) {
        confirmDropOff(
            horseId: '$hid',
            horseImageFromRight: deliveryConfirmPickupModel.horseImageFromRight,
            horseImageFromLeft: deliveryConfirmPickupModel.horseImageFromLeft,
            horseBackView: deliveryConfirmPickupModel.horseBackView,
            horseFrontView: deliveryConfirmPickupModel.horseFrontView,
            horseVideo: deliveryConfirmPickupModel.horseVideo,
            notesImage: deliveryConfirmPickupModel.notesImage,
            signature: completeBase64Image,
            notes: notesText);
      }
      //   confirmPickup(notesText ?? "", hid ?? 0);

      print(deliveryConfirmPickupModel.horseBackView);
    } else {
      deliveryConfirmDropOffLoading.value = false;
      error1.value = res.toString();
      log("main error ==== ${error1.value}");
      Get.snackbar("notification", "${error1.value}");
    }
  }

  //////////////
  ///
  var confirmDroOffModel = ConfirmDropOffResponse();
  void confirmDropOff(
      {String? horseId,
      String? horseImageFromRight,
      String? horseImageFromLeft,
      String? horseFrontView,
      String? notesImage,
      String? horseBackView,
      String? horseVideo,
      String? signature,
      String? notes}) async {
    deliveryConfirmDropOffLoading.value = true;
    error1.value = "";

    var res = await ConfirmDropOffService.confirmDropOff(
        horseId: '$horseId',
        horseImageFromLeft: '$horseImageFromLeft',
        horseImageFromRight: '$horseImageFromRight',
        horseBackView: '$horseBackView',
        horseFrontView: '$horseFrontView',
        notes: '$notes',
        horseVideo: '$horseVideo',
        notesImage: '$notesImage',
        signature: '$signature');
    deliveryConfirmDropOffLoading.value = false;

    if (res is ConfirmDropOffResponse) {
      confirmDroOffModel = res;
      Get.snackbar("notifications", confirmDroOffModel.message.toString());
      Get.off(() => MyDeliveryScreen());
    } else {
      deliveryConfirmDropOffLoading.value = false;
      error1.value = res.toString();
      log('errorr === ${error1.value}');
      Get.snackbar("notifications", "${error1.value}");
    }
  }

//////////////////  file to base 64
  Future<String> convertFileToBase64(File file) async {
    List<int> imageBytes = await file.readAsBytes();
    String base64Image = base64Encode(imageBytes);

    String mimeType =
        'image/jpeg'; // Set the appropriate mime type for your image file.

    // Combine the base64 data, data type, and encoding.
    String completeBase64Image = 'data:$mimeType;base64,$base64Image';

    return completeBase64Image;
  }
}
