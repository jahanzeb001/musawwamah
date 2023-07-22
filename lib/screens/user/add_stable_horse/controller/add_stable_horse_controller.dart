import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:obaiah_mobile_app/screens/user/add_new_horse/model/add_new_horse_model.dart';
import 'package:obaiah_mobile_app/screens/user/add_new_horse/model/expert_opinion_data_model.dart';
import 'package:obaiah_mobile_app/screens/user/add_new_horse/model/upload_images_response.dart';
import 'package:obaiah_mobile_app/screens/user/add_new_horse/service/add_new_horse_service.dart';
import 'package:obaiah_mobile_app/screens/user/add_stable_horse/model/delete_horse_model.dart';
import 'package:obaiah_mobile_app/screens/user/add_stable_horse/services/stable_horse_service.dart';
import 'package:obaiah_mobile_app/screens/user/settings/my_horses_stable/view/my_horses_stable_screeen.dart';
import '../../../../utils/constants/lists.dart';

class AddStableHorseController extends GetxController {
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
  RxBool isVideoPlaceShow = false.obs;

  RxBool isMorePicPlaceShow = false.obs;

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

  var addHorseImage = AddImagesResponse();
  var addNewHorseModel = AddNewHorseResponse();

  void getUserId() {
    userId = GetStorage().read("userId");
  }

  void addNewHorse(File fview, File bview, File lview, File rview,
      List<File> moreimages, File video) async {
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
    var res = await AddNewHorseService.addStableHorse(
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
      Get.snackbar(
        "notification".tr,
        res.message!,
      );

      Get.off(() => MyHorsesStableScreen());
    } else {
      loading.value = false;
      error.value = res.toString();

      Get.snackbar(
        "notification".tr,
        error.value,
      );
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

      //totalPrice.value=     int.parse(expertOpinionModel.settings!.siteComission!)+;

      // totalPrice = expertOpinionval + siteCommisionVal.value;
    } else {
      loadingData.value = false;
      errorData.value = res.toString();
    }
  }

  void calculateTotalPrice({RxInt? horsePrice, int? expertopinionChosen}) {
    totalPrice.value = expertopinionChosen == 1
        ? int.parse(expertOpinionModel.opinion!.price!) +
            int.parse(expertOpinionModel.settings!.siteComission!) +
            horsePrice!.value
        : int.parse(expertOpinionModel.settings!.siteComission!) +
            horsePrice!.value;
  }

  var deleteHorseModel = DeleteStableHorseResponse();
  void deleteStableHorse(int horseId) async {
    loading2.value = true;
    error2.value = "";

    var res = await StableHorseService.deleteHorse(horseId);

    if (res is DeleteStableHorseResponse) {
      deleteHorseModel = res;
      Get.snackbar("notification".tr, "removed from favourites".tr);
    } else {
      loading2.value = false;
      error2.value = res.toString();
      Get.snackbar("notification".tr, error2.value);
    }
  }
}
