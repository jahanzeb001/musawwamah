import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';

class DeliveryConfirmDropOffController extends GetxController {
  CarouselSliderController sliderController = CarouselSliderController();
  TextEditingController compulsoryNotesController = TextEditingController();
  OtpFieldController confirmPickUpOtpController = OtpFieldController();
  GlobalKey<SfSignaturePadState> signaturePadKey = GlobalKey();

  @override
  void onClose() {
    log('disposing controllers');
    super.onClose();
  }
}
