// ignore_for_file: override_on_non_overriding_member

import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:get_storage/get_storage.dart';
import 'package:obaiah_mobile_app/screens/user/home/auction_listing/model/add_insurance_model.dart';
import 'package:obaiah_mobile_app/screens/user/home/auction_listing/service/auction_listing_service.dart';
import 'package:obaiah_mobile_app/screens/user/home/auction_listing/model/add_biding_horse_model.dart';

import '../../home_auction/controller/home_auction_controller.dart';

class AuctionController extends GetxController {
  RxBool isAuctionComingSoon = RxBool(false);
  var amountController = TextEditingController();
  var loading2 = false.obs;
  var error2 = "".obs;
  String? horsesId;
  Rx remeaningTimeforAction = ''.obs;
  int userBalance = 0;
  List<String> images = [];
  int? userId;
  String auctionDate = "";
  var addBidingHorseModel = AddBidingHorseResponse();
  toggleAuctionForFuture({required bool toggleValue}) {
    isAuctionComingSoon.value = toggleValue;
  }

  CarouselSliderController sliderController = CarouselSliderController();
  @override
  void addBiddingHorse(int hid) async {
    print("******************hid :$hid");
    loading2.value = true;
    error2.value = "";

    var res = await AuctionListingService.addBidingHorse(hid);

    loading2.value = false;

    if (res is AddBidingHorseResponse) {
      addBidingHorseModel = res;

      isAuctionComingSoon.value =
          addBidingHorseModel.autioninfo!.isAuctionPassed == 0 ? true : false;

      print("*************************** normal${isAuctionComingSoon.value}");
      print(
          "*************************** api ${addBidingHorseModel.autioninfo!.isAuctionPassed}");
      formateDate(addBidingHorseModel.autioninfo!.auctionDate.toString());

      // print("************************$images");
    } else {
      loading2.value = false;
      error2.value = res.toString();
    }
  }

  formateDate(String date) {
    DateTime dateTime = DateTime.parse(date);
    String formattedDate = DateFormat('yyyy-MM-dd').format(dateTime);
    auctionDate = formattedDate;
  }

  ////////////////////add insurance
  var addingBid = false.obs;
  var errorAddingBid = "".obs;
  var addBidModel = AddInsuranceResponse();
  final homeScreenController = Get.find<HomeAuctionController>();
  void addBid(int hid, int uid, int amount, context) async {
    addingInsurance.value = true;
    errorAddingInsurance.value = "";
    var res = await AuctionListingService.addBid(hid, uid, amount);
    addingInsurance.value = false;
    if (res != '') {
      addInsuranceController.clear();
      Get.snackbar("notification".tr, "added successfully");
      addBiddingHorse(hid);
      homeScreenController.getBiddingHorse();
      //gotoback(context);
    } else {
      Get.snackbar("notification".tr, "Error no added");
    }
  }

  ////////////////////add insurance
  var addingInsurance = false.obs;
  var errorAddingInsurance = "".obs;
  var addInsuranceModel = AddInsuranceResponse();
  var addInsuranceController = TextEditingController();
  void addInsurance(int uid, int amount) async {
    addingInsurance.value = true;
    errorAddingInsurance.value = "";

    var res = await AuctionListingService.addInsurance(amount, uid);

    addingInsurance.value = false;

    if (res is AddInsuranceResponse) {
      addInsuranceModel = res;
      Get.snackbar("notification".tr, "insurance added successfully");
    } else {
      addingInsurance.value = false;
      errorAddingInsurance.value = res.toString();
    }
  }

  getUserData() {
    userBalance = GetStorage().read("accbal");
    userId = GetStorage().read("userId");
    print("user current balance is :$userBalance} ");

    print("user id is :$userId} ");
  }
}

gotoback(context) {
  Navigator.pop(context);
}
