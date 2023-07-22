import 'package:get/get.dart';
import 'dart:developer';
import 'package:get_storage/get_storage.dart';

class GetStorageController extends GetxController implements GetxService {
  final box = GetStorage();

  Future<void> initStorage() async {
    await GetStorage().initStorage;
  }

  @override
  void onInit() {
    super.onInit();
    log("Get Storage Controller Initialized:");
  }

  bool isHavingData = false;

  toggleIsHavingData(bool value) {
    isHavingData = value;
    update();
  }

  String? writeStorage({required String key, required String value}) {
    log("Saving key in Get Storage: Key is: $key and value is: $value");
    box.write(key, value);
    log("Token is saved in GetStorage: ${box.read(key)}");
    toggleIsHavingData(true);
    return null;
  }

  String? readStorage(String key) {
    return box.read(key);
  }

  Future<void> removeGetStorage() async {
    await box.erase();
    log("Get Storage Emptied : ");
    log("Value in Get Storage is: ${readStorage("user-token")}");
  }

  Future<void> removeStorage() async {
    await box.erase().then((value) async {
      toggleIsHavingData(false);
      log("Remove Storage: ");
      update();
    });
  }

// storeLoginModel(LoginModel loginModel) {
//   box.write("loginModel", loginModel.toJson());
//   update();
//   log("Login Model Stored Successfully:");
// }
//
// LoginModel? getLoginModel() {
//   final data = box.read("loginModel");
//   update();
//   log("This is value: $data");
//   if (data != null) {
//     return LoginModel.fromJson((data));
//   } else {
//     return null;
//   }
// }
}
