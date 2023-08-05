import 'package:get/get.dart';
import 'package:obaiah_mobile_app/screens/user/hospitality/hospitality_home/models/hospitality_advance-filter-response.dart';

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

    super.onInit();
  }

  void Hospitalities(
      {int? filter,
      String? servicetype,
      String? region,
      String? price,
      String? sortBy}) async {
    error.value = '';
    loading.value = true;

    var res = await GetMyHospitalityService.getMyHospitalities(
        sortBy: sortBy,
        region: region,
        filter: filter,
        servicetype: servicetype,
        price: price);
    loading.value = false;

    if (res is GetHospitalityResponse) {
      myHospitalityModel = res;
    } else {
      loading.value = false;
      error.value = res.toString();
    }
  }

  ////////////////////////
  RxBool isRegionShow = false.obs;
  RxBool isPriceShow = false.obs;

  RxBool isServicesShow = false.obs;

  String regionSelectedVal = "";
  String thePriceSelectedVal = "";
  String serviceSelectedVal = "";

  var loading2 = false.obs;
  var error2 = "".obs;
  var propertiseModel = HospitalityAdvanceFilterResponse();

  /////////////
  void getPropertiseList() async {
    loading2.value = true;
    error2.value = "";
    var res = await GetMyHospitalityService.getMyHospitalitiesAdvanceFilter();

    loading2.value = false;
    if (res is HospitalityAdvanceFilterResponse) {
      propertiseModel = res;

      propertiseModel.region = res.region;
      propertiseModel.services = res.services;

      print("*************************${propertiseModel.services}");
      print("*************************${propertiseModel.region}");
    } else {
      loading2.value = false;
      error2.value = res.toString();
    }
  }
}
