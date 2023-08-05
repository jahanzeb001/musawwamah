import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:obaiah_mobile_app/screens/user/add_new_horse/model/add_new_horse_model.dart';
import 'package:obaiah_mobile_app/screens/user/add_new_horse/model/upload_images_response.dart';
import 'package:obaiah_mobile_app/screens/user/add_new_horse/service/add_new_horse_service.dart';
import 'package:obaiah_mobile_app/utils/constants/config.dart';
import '../../../../utils/constants/lists.dart';
import '../model/expert_opinion_data_model.dart';
import 'package:http/http.dart' as http;

class AddNewHorseController extends GetxController {
  final GlobalKey<FormState> addNewHorseFormKey = GlobalKey<FormState>();
  TextEditingController priceController = TextEditingController();
  TextEditingController additionalDescriptionController =
      TextEditingController();
  TextEditingController nameOfHorseController = TextEditingController();
  TextEditingController regionController = TextEditingController();
  TextEditingController cityOrProvinceController = TextEditingController();
  TextEditingController fathersNameController = TextEditingController();
  TextEditingController mothersNameController = TextEditingController();
  TextEditingController ageMonthController = TextEditingController();
  TextEditingController ageYearController = TextEditingController();
  TextEditingController colorController = TextEditingController();
  TextEditingController heightInCmController = TextEditingController();
  TextEditingController bankNameController = TextEditingController();
  TextEditingController ibanNumberController = TextEditingController();

  Rx<bool> isBiddingChecked = RxBool(false);
  Rx<bool> isOnFixedPriceChecked = Rx<bool>(true);
  Rx<bool> needExpertOpinion = Rx<bool>(false);
  Rx<bool> isBiddingForOneDay = RxBool(true);
  Rx<bool> isBiddingForTwoDays = Rx<bool>(false);
  Rx<bool> isBiddingForThreeDays = Rx<bool>(false);
  RxString horseType = horseTypeList[0].obs;
  RxString condition = conditionList[0].obs;
  RxString originality = originalityList[0].obs;
  RxString yesOrNoForIsVaccinated = yesOrNoList[0].obs;
  RxString yesOrNoForHaveEvidence = yesOrNoList[0].obs;
  var selectedTime = TimeOfDay.now().obs;
  var selectedDate = DateTime.now().obs;
  DateTime? convertedDateTime;
  RxBool isVideoPlaceShow = false.obs;

  RxBool isMorePicPlaceShow = false.obs;
  List<String> images = [];

  /////////expert opinion data
  var expertOpinionModel = ExpertOpinionHorseResponse();
  RxBool loadingData = false.obs;
  RxString errorData = "".obs;

  ////////////////////////////////////
  RxInt horsePrice = 0.obs;
  RxInt totalPrice = 0.obs;
  RxInt expertOpinionval = 0.obs;
  RxInt siteCommisionVal = 0.obs;
  int bidingtotalprice = 0;

  List<String> userTokens = [];
  onInit() {
    super.onInit();
    getExpertOpinoinData();
    getUserId();
  }

  @override
  void onClose() {
    priceController.dispose();
    super.onClose();
  }

  toggleTypeOfPurchase({required bool isBiddingTapped}) {
    if (isBiddingTapped) {
      if (isBiddingChecked.value) {
        log("Bidding Preview Already True: $isBiddingChecked");
      } else {
        isBiddingChecked.value = true;
        isOnFixedPriceChecked.value = false;
      }
    } else {
      if (isOnFixedPriceChecked.value) {
        log("Fixed Price Preview Already True: $isOnFixedPriceChecked");
      } else {
        isBiddingChecked.value = false;
        isOnFixedPriceChecked.value = true;
      }
    }
    log("Bidding Preview: $isBiddingChecked");
    log("Fixed Price Preview: $isOnFixedPriceChecked");
  }

  toggleForBiddingDaysSelection({
    required bool forOneDay,
    required bool forThreeDays,
    required bool forSevenDays,
  }) {
    if (forOneDay == true && forThreeDays == false && forSevenDays == false) {
      if (isBiddingForOneDay.value) {
        log("Bidding Day Already True for 1 Day: $isBiddingForOneDay");
      } else {
        isBiddingForOneDay.value = true;
        isBiddingForTwoDays.value = false;
        isBiddingForThreeDays.value = false;
      }
    } else if (forOneDay == false &&
        forThreeDays == true &&
        forSevenDays == false) {
      if (isBiddingForTwoDays.value) {
        log("Bidding Day Already True for 2 Days: $isBiddingForTwoDays");
      } else {
        isBiddingForOneDay.value = false;
        isBiddingForTwoDays.value = true;
        isBiddingForThreeDays.value = false;
      }
    } else {
      if (isBiddingForThreeDays.value) {
        log("Bidding Day Already True for 3 Days: $isBiddingForThreeDays");
      } else {
        isBiddingForOneDay.value = false;
        isBiddingForTwoDays.value = false;
        isBiddingForThreeDays.value = true;
      }
    }
    log("For One Day: $isBiddingForOneDay");
    log("For Two Days: $isBiddingForTwoDays");
    log("For Three Days: $isBiddingForThreeDays");
  }

  checkExpertOpinion({required bool value}) {
    needExpertOpinion.value = value;
  }

  checkForHorseType({required dynamic value}) {
    horseType.value = value;
  }

  checkForCondition({required dynamic value}) {
    condition.value = value;
  }

  checkForOriginality({required dynamic value}) {
    originality.value = value;
  }

  checkYesOrNoForIsVaccinated({required dynamic value}) {
    yesOrNoForIsVaccinated.value = value;
  }

  checkYesOrNoForHaveEvidence({required dynamic value}) {
    yesOrNoForHaveEvidence.value = value;
  }

  //////////////////////////adding fix price horse
  RxBool loading = false.obs;
  RxBool loading2 = false.obs;
  RxString error = "".obs;
  RxString error2 = "".obs;
  int? userId;
  String? username = "";

  var addHorseImage = AddImagesResponse();
  var addNewHorseModel = AddNewHorseResponse();

  void getUserId() {
    userId = GetStorage().read("userId");
    username = GetStorage().read("username");
  }

  void addNewHorse(BuildContext context, File fview, File bview, File lview,
      File rview, List<File> moreimages, File video) async {
    error.value = "";
    loading.value = true;
    var res1 = await AddNewHorseService.uploadFiles(
        fview, bview, lview, rview, moreimages, video);
    if (res1 is AddImagesResponse) {
      addHorseImage = res1;
    } else {
      loading.value = false;
      Get.snackbar(
        "notification".tr,
        error.value,
      );
    }
    var res = await AddNewHorseService.addFixedPriceHorse(
        userId: userId,
        nameOfHorse: nameOfHorseController.text,
        type: horseType.value,
        fathersName: fathersNameController.text,
        mothersName: mothersNameController.text,
        monthOfBirth: ageMonthController.text,
        yearOfBirth: ageYearController.text,
        color: colorController.text,
        casuality: condition.value,
        originality: originality.value,
        region: regionController.text,
        city: cityOrProvinceController.text,
        expertOpinionChosen: needExpertOpinion.value == true ? 1 : 0,
        expertOpinionAdviceUserId: expertOpinionModel.opinion!.id!,
        expertOpinion: expertOpinionModel.opinion!.description!,
        price: priceController.text.length == 0
            ? 0
            : int.parse(priceController.text),
        siteCommision: int.parse(expertOpinionModel.settings!.siteComission!),
        expertOpinionPrice: int.parse(expertOpinionModel.opinion!.price!),
        totalPrice: totalPrice.value,
        additionalDescription: additionalDescriptionController.text,
        bankName: bankNameController.text,
        ibanNumber: ibanNumberController.text,
        isVaccinated: yesOrNoForIsVaccinated.value == "yes" ? "1" : "0",
        haveEvidence: yesOrNoForHaveEvidence.value == "yes" ? "1" : "0",
        horseBackView: addHorseImage.horseBackView,
        horseFrontView: addHorseImage.horseFrontView,
        horseImageFromLeft: addHorseImage.horseImageFromLeft,
        horseImageFromRight: addHorseImage.horseImageFromRight,
        moreImages: addHorseImage.moreImages,
        horseVideo: addHorseImage.horseVideo);

    loading.value = false;

    if (res is AddNewHorseResponse) {
      addNewHorseModel = res;
      sendPushNotification(
          nameOfHorseController.text, addHorseImage.horseFrontView ?? "");
      Get.snackbar(
        "notification".tr,
        res.message!,
      );

      Navigator.pop(context);
    } else {
      loading.value = false;
      error.value = res.toString();

      Get.snackbar(
        "notification".tr,
        error.value,
      );
    }
  }

  //////////**************************************fixed pric sec end ****************************************/
  void addBidingHorse(BuildContext context, File fview, File bview, File lview,
      File rview, List<File> moreimages, File video) async {
    error2.value = "";
    loading2.value = true;
    var res1 = await AddNewHorseService.uploadFiles(
        fview, bview, lview, rview, moreimages, video);
    if (res1 is AddImagesResponse) {
      addHorseImage = res1;
    } else {
      loading2.value = false;
      Get.snackbar(
        "notification".tr,
        error2.value,
      );
    }

    calculateBidingTotalPrice(
        percenctage: expertOpinionModel.opinion!.percentage,
        price: int.parse(expertOpinionModel.opinion!.price!));
    var res = await AddNewHorseService.addBiddingHorse(
        userId: userId,
        nameOfHorse: nameOfHorseController.text,
        type: horseType.value,
        fathersName: fathersNameController.text,
        mothersName: mothersNameController.text,
        monthOfBirth: ageMonthController.text,
        yearOfBirth: ageYearController.text,
        color: colorController.text,
        casuality: condition.value,
        originality: originality.value,
        region: regionController.text,
        city: cityOrProvinceController.text,
        expertOpinionChosen: needExpertOpinion.value == true ? 1 : 0,
        expertOpinionAdviceUserId: expertOpinionModel.opinion!.id!,
        expertOpinion: expertOpinionModel.opinion!.description!,
        price: bidingtotalprice,
        siteCommision: int.parse(expertOpinionModel.settings!.siteComission!),
        expertOpinionPrice: int.parse(expertOpinionModel.opinion!.price!),
        additionalDescription: additionalDescriptionController.text,
        bankName: bankNameController.text,
        ibanNumber: ibanNumberController.text,
        isVaccinated: yesOrNoForIsVaccinated.value == "yes" ? "1" : "0",
        haveEvidence: yesOrNoForHaveEvidence.value == "yes" ? "1" : "0",
        timeForAuction: convertedDateTime.toString(),
        dateForAution: selectedDate.toString(),
        horseBackView: addHorseImage.horseBackView,
        horseFrontView: addHorseImage.horseFrontView,
        horseImageFromLeft: addHorseImage.horseImageFromLeft,
        horseImageFromRight: addHorseImage.horseImageFromRight,
        moreImages: addHorseImage.moreImages,
        horseVideo: addHorseImage.horseVideo);

    loading2.value = false;

    if (res is AddNewHorseResponse) {
      addNewHorseModel = res;
      sendPushNotification(
          nameOfHorseController.text, addHorseImage.horseFrontView ?? "");
      Get.snackbar(
        "notification".tr,
        "your bid added successfully",
      );
      Navigator.pop(context);
    } else {
      loading2.value = false;
      error2.value = res.toString();

      Get.snackbar(
        "notification".tr,
        error2.value,
      );
    }
  }

  /////////////pick auction time and date

  // void pickTime(context) async {
  //   var time = await Get.dialog<TimeOfDay>(
  //     TimePickerDialog(
  //       initialTime: selectedTime.value,
  //       //  useRootNavigator: false,
  //     ),
  //   );
  //   if (time != null) {
  //     selectedTime.value = time;
  //   }
  // }

  void pickDate() async {
    var date = await Get.dialog<DateTime>(
      DatePickerDialog(
        initialDate: selectedDate.value,
        firstDate: DateTime(2000),
        lastDate: DateTime(2100),
        //   useRootNavigator: false,
      ),
    );
    if (date != null) {
      selectedDate.value = date;
    }
  }

  ////////////////////getExpert opinion data
  void getExpertOpinoinData() async {
    errorData.value = "";
    loadingData.value = true;

    var res = await AddNewHorseService.getExpertOpinionData();
    loadingData.value = false;

    if (res is ExpertOpinionHorseResponse) {
      expertOpinionModel = res;
      images = [
        "${expertOpinionModel.settings!.banner}",
        "${expertOpinionModel.settings!.banner_2}",
      ];

      //totalPrice.value=     int.parse(expertOpinionModel.settings!.siteComission!)+;

      // totalPrice = expertOpinionval + siteCommisionVal.value;
    } else {
      loadingData.value = false;
      errorData.value = res.toString();
    }
  }

  void calculateTotalPrice({int? horsePrice, int? expertopinionChosen}) {
    totalPrice.value = needExpertOpinion.value == true
        ? int.parse(expertOpinionModel.opinion!.price!) +
            int.parse(expertOpinionModel.settings!.siteComission!) +
            horsePrice!
        : int.parse(expertOpinionModel.settings!.siteComission!) + horsePrice!;
  }

  void calculateBidingTotalPrice({String? percenctage, int? price}) {
    double percentage =
        double.parse(percenctage!.substring(0, percenctage.length - 1)) /
            100.toInt();

    bidingtotalprice = price! + (price * percentage).toInt();
    print(bidingtotalprice); // Output: 110.0
  }

  /////////////////////////send posh notifications

  Future<void> sendPushNotification(String horsename, String image) async {
    // Replace with your FCM server key
    final String url = 'https://fcm.googleapis.com/fcm/send';

    final Map<String, dynamic> payload = {
      "registration_ids": userTokens,
      "notification": {
        "body": "New ${horsename} has been added by user $userId",
        "title": " New Horse Has been Added",
        "android_channel_id": "mussawammahnotification",
        "sound": false,
        "image": image,
      }
    };

    final Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'key=$SERVER_KEY',
    };

    try {
      final http.Response response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: jsonEncode(payload),
      );

      if (response.statusCode == 200) {
        print('Notification sent successfully!');
      } else {
        print(
            'Failed to send notification. Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
    } catch (e) {
      print('Error sending notification: $e');
    }
  }

  /////////////////////fetch token from firebase

  // Future<void> fetchDeviceTokens() async {
  //   try {
  //     // Access the 'users' collection
  //     QuerySnapshot querySnapshot =
  //         await FirebaseFirestore.instance.collection('users').get();

  //     // Loop through each document and extract the 'devicetoken' field
  //     querySnapshot.docs.forEach((doc) {
  //       String? devicetoken = doc.get(
  //           'deviceToken'); // Replace 'devicetoken' with the actual field name in the document
  //       if (devicetoken != null) {
  //         userTokens.add(devicetoken);
  //       }

  //       print(" user token    ****************** ${userTokens.length}");
  //     });
  //   } catch (e) {
  //     print('Error fetching device tokens: $e');
  //   }
  // }
}
