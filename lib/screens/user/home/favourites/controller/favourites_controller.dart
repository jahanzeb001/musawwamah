import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:obaiah_mobile_app/screens/user/home/favourites/model/delete_horse_response.dart';
import 'package:obaiah_mobile_app/screens/user/home/favourites/model/get_my_favourite_response.dart';
import 'package:obaiah_mobile_app/screens/user/home/favourites/service/get_my_favourite_service.dart';

class FavouritesController extends GetxController {
  RxBool showInGrid = RxBool(false);
  RxBool loading = false.obs;
  RxString error = "".obs;
  int? userId;
  var myFavMOdel = GetMyFavouriteResponse().obs;

  changeView() {
    showInGrid.value = !showInGrid.value;
  }

  void loadData() async {
    getUserId();
    Future.delayed(Duration(milliseconds: 500));
    getMyFavourites(userId!);
  }

  void getUserId() {
    userId = GetStorage().read("userId");
  }

  void getMyFavourites(int uid) async {
    error.value = "";
    loading.value = true;
    var res = await GetMyFavouriteService.getMyFavourites(uid);
    loading.value = false;
    if (res is GetMyFavouriteResponse) {
      myFavMOdel.value = res;
    } else {
      loading.value = false;
      error.value = res.toString();
    }
  }

  ///////////////////delete horse
  var deletingHorse = false.obs;
  RxString errorDeletinggHorse = "".obs;
  var deletHorseModel = DeleteHorseResponse();

  void deletHorse(int horseId, int index, int uid) async {
    errorDeletinggHorse.value = "";
    myFavMOdel.value.data![index].loading?.value = true;
    var res = await GetMyFavouriteService.deleteHorse(horseId, uid);
    myFavMOdel.value.data![index].loading?.value = false;

    if (res == 'true') {
      Get.snackbar("notification".tr, "removed from favourites".tr);
      loadData();
    } else {
      myFavMOdel.value.data![index].loading?.value = false;
      errorDeletinggHorse.value = res.toString();
      Get.snackbar("notification".tr, 'Error not removed from favourites');
    }
  }
}
