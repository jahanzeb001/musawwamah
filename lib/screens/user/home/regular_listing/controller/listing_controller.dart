import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:obaiah_mobile_app/screens/user/home/regular_listing/model/add_to_fav_respose.dart';
import 'package:obaiah_mobile_app/screens/user/home/regular_listing/model/get_horse_detail_model.dart';
import 'package:obaiah_mobile_app/screens/user/home/regular_listing/service/get_horse_detail_service.dart';
import 'package:obaiah_mobile_app/utils/constants/app_urls.dart';

class RegularListingController extends GetxController {
  CarouselSliderController sliderController = CarouselSliderController();
  RxBool loadingHorseDetails = false.obs;
  RxString errorLoadingHorseDetails = "".obs;
  List<String> images = [];
  var horseDetailsModel = HorseDetailsResponse();
  int userId = 0;
  @override
  void onInit() {
    getUserId();
    // TODO: implement onInit
    super.onInit();
  }

  void getUserId() {
    userId = GetStorage().read("userId");
  }

  void getHorseDetails(int hId) async {
    errorLoadingHorseDetails.value = "";
    loadingHorseDetails.value = true;
    var res = await GetHorseDetailsService.getHorseDetail(hId);
    loadingHorseDetails.value = false;
    if (res is HorseDetailsResponse) {
      horseDetailsModel = res;
      images = [
        "${AppUrls.ImagebaseUrl}${res.data!.horseFrontView ?? ""}",
        "${AppUrls.ImagebaseUrl}${res.data!.horseBackView ?? ""}",
        "${AppUrls.ImagebaseUrl}${res.data!.horseImageFromLeft ?? ""}",
        "${AppUrls.ImagebaseUrl}${res.data!.horseImageFromRight ?? ""}"
      ];
      print("**********************************${images}");
    } else {
      loadingHorseDetails.value = false;
      errorLoadingHorseDetails.value = res.toString();
    }
  }

  ///////////////////////add to wishlist
  var loading2 = false.obs;
  var error2 = "".obs;
  var addToFavModel = AddToFavouriteResponse();
  void addToFav(int hId, int uid) async {
    error2.value = "";
    loading2.value = true;
    var res = await GetHorseDetailsService.addToFav(uid, hId);
    loading2.value = false;
    if (res is AddToFavouriteResponse) {
      addToFavModel = res;
      Get.snackbar("notification".tr, "added to favourites".tr);
    } else {
      loading2.value = false;
      error2.value = res.toString();
      Get.snackbar("notification".tr, error2.value);
    }
  }
}

class ImageModel {
  String? fimage;
  String? bimage;
  String? limage;
  String? rimage;
  ImageModel({this.fimage, this.bimage, this.limage, this.rimage});
}
