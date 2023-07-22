import 'package:get/get.dart';

import '../models/hospitality_model.dart';
import '../services/get_my_hospitality_services.dart';

class HospitalityHomeController extends GetxController {
  RxBool loading = false.obs;
  RxString error = "".obs;
  int? userId;
  int deliveryId = 0;
  var mybalance = "".obs;
  int userBalance = 0;
  var myHospitalityModel = GetHospitalityResponse();
  List<String> images = [];
  @override
  void onInit() {
    loading.value = true;
    // loadData();
    //getUserBalance();
    // TODO: implement onInit
    super.onInit();
  }

  void Hospitalities() async {
    error.value = '';
    loading.value = true;

    var res = await GetMyHospitalityService.getMyHospitalities();
    loading.value = false;

    if (res is GetHospitalityResponse) {
      myHospitalityModel = res;
    } else {
      loading.value = false;
      error.value = res.toString();
    }
  }
}
