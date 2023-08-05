import 'package:get/get.dart';
import 'package:obaiah_mobile_app/screens/user/training/training_home/models/training_filter_propertise_model.dart';
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

  void getMyTraning(
      {int? filter,
      String? servicetype,
      String? region,
      String? price,
      String? sex,
      String? sortBy}) async {
    error.value = '';
    loading.value = true;

    var res = await GetMyTraningService.getMyTraning(
        filter: filter,
        servicetype: servicetype,
        region: region,
        price: price,
        sex: sex,
        sortBy: sortBy);
    loading.value = false;

    if (res is GetTraningResponse) {
      myTraningModel = res;
    } else {
      loading.value = false;
      error.value = res.toString();
    }
  }

  RxBool isRegionShow = false.obs;
  RxBool isPriceShow = false.obs;
  RxBool isTrainingTypeShow = false.obs;
  RxBool isSexShow = false.obs;

  String regionSelectedValue = "";

  String priceSelectedValue = "";
  String trainingTypeSelectedValue = "";
  String sexSelectedValue = "";

  var loading2 = false.obs;
  var error2 = "".obs;
  var propertiseModel = TrainingFilterPropertiseResponse();

  /////////////
  void getPropertiseList() async {
    loading2.value = true;
    error2.value = "";
    var res = await GetMyTraningService.getMyTraningPropertise();

    loading2.value = false;
    if (res is TrainingFilterPropertiseResponse) {
      propertiseModel = res;

      propertiseModel.region = res.region;
      propertiseModel.type = res.type;
      propertiseModel.sex = res.sex;

      print("*************************${propertiseModel.type}");
      print("*************************${propertiseModel.region}");
      print("*************************${propertiseModel.sex}");
    } else {
      loading2.value = false;
      error2.value = res.toString();
    }
  }
}
