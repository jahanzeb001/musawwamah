import 'package:get/get.dart';
import 'package:obaiah_mobile_app/screens/user/training/training_home/services/get_my_services.dart';
import '../models/traning_listing_model.dart';
import '../services/get_my_traning_services.dart';

class TrainingListingController extends GetxController {
  RxBool loading = false.obs;
  RxString error = "".obs;
  int? userId;
  int deliveryId = 0;
  var mybalance = "".obs;
  int userBalance = 0;
  var myTraningListingModel = GetTraningListingResponse();
  List<String> images = [];
  @override
  void onInit() {
    loading.value = true;
    // loadData();
    //getUserBalance();
    // TODO: implement onInit
    super.onInit();
  }

  void getMyTraningListing(id) async {
    error.value = '';
    loading.value = true;

    var res = await GetMyTraningListingService.getMyTraningListing(id);
    loading.value = false;

    if (res is GetTraningListingResponse) {
      myTraningListingModel = res;
    } else {
      loading.value = false;
      error.value = res.toString();
    }
  }
}
