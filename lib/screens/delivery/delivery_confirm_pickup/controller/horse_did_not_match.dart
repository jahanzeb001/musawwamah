import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:obaiah_mobile_app/screens/delivery/my_deliveries/models/my_deliver_model.dart';
import 'package:obaiah_mobile_app/screens/delivery/my_deliveries/models/reject_connection_model.dart';
import 'package:obaiah_mobile_app/screens/delivery/my_deliveries/services/my_deliver_service.dart';

class MyDeliveriesController extends GetxController {
  var loading = false.obs;
  var error = "".obs;
  int? deliveryAccountId = 0;
  var myCoonectionsModel = GetMyConnectionResponse();

  @override
  void onInit() {
    loading.value = true;

    // TODO: implement onInit
    // print("delivery Person Id  ${SessionController().deliverAccountId!}");

    super.onInit();
  }

  loadData() async {
    getDeliveryPersonId();
    await Future.delayed(Duration(seconds: 1));
    getMyConnection(deliveryAccountId!);
  }

  void getMyConnection(int deliveryAcctId) async {
    loading.value = true;
    error.value = "";

    var res = await MyDeliverService.getMyConnections(deliveryAcctId);
    loading.value = false;
    if (res is GetMyConnectionResponse) {
      myCoonectionsModel = res;
    } else {
      loading.value = false;
      error.value = res.toString();
    }
  }

  RxBool loading2 = false.obs;
  RxString error2 = "".obs;
  var rejectConnectionModel = RejectonnectionResponse();

  void rejectConnection(int deliveryPersonId, int horseId, int index) async {
    print("methos id running on index :$index");
    loading2.value = true;
    error2.value = "";

    var res =
        await MyDeliverService.rejectConnections(deliveryPersonId, horseId);
    loading2.value = false;
    if (res is RejectonnectionResponse) {
      rejectConnectionModel = res;
      Get.snackbar("notifications".tr, "Horse Rejected Successfully");

      loadData();
      // getMyConnection(deliveryAccountId!);
    } else {
      loading2.value = false;
      error2.value = res.toString();
      Get.snackbar("notifications".tr, error2.value);
    }
  }

  RxBool loading3 = false.obs;
  RxString error3 = "".obs;
  //var rejectConnectionModel = RejectonnectionResponse();

  void acceptConnection(int deliveryPersonId, int horseId, int index) async {
    print("methos id running on index :$index");
    loading3.value = true;
    error3.value = "";

    var res =
        await MyDeliverService.acceptConnections(deliveryPersonId, horseId);
    loading2.value = false;
    if (res == 200) {
      Get.snackbar("notifications".tr, "Horse Accepted Successfully");

      loadData();
    } else {
      loading3.value = false;
      error3.value = res.toString();
      Get.snackbar("notifications".tr, error3.value);
    }
  }

  void getDeliveryPersonId() {
    deliveryAccountId = GetStorage().read("delPerId");
  }
}
