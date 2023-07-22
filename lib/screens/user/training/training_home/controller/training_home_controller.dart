import 'dart:math';

import 'package:get/get.dart';
import '../../../../../utils/constants/app_urls.dart';
import '../models/traning_model.dart';
import '../services/get_my_services.dart';

class TrainingHomeController extends GetxController {
  RxBool loading = false.obs;
  RxString error = "".obs;
  int? userId;
  int deliveryId = 0;
  var mybalance = "".obs;
  int userBalance = 0;
  var myTraningModel = GetTraningResponse();
  List<String> images = [];
  @override
  void onInit() {
    loading.value = true;
    // loadData();
    //getUserBalance();
    // TODO: implement onInit
    super.onInit();
  }

  void getMyTraning() async {
    error.value = '';
    loading.value = true;

    var res = await GetMyTraningService.getMyTraning();
    loading.value = false;

    if (res is GetTraningResponse) {
      myTraningModel = res;
    } else {
      loading.value = false;
      error.value = res.toString();
    }
  }
}
