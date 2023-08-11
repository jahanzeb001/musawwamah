import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../model/get_notification_response.dart';
import '../service/get_notification_service.dart';

class NotificationAuctionController extends GetxController {
  var loading = false.obs;
  var error = "".obs;
  var getNotificationModel = GetNotificationResponse();
  var mybalance = ''.obs;
  int? userBalance;
  int uid = 0;
  int? userId;
  RxBool isSearchFieldShow = false.obs;
  var searchTextController = TextEditingController();
  @override
  void onInit() {
    loading.value = true;
    loadData();

    super.onInit();
  }

  loadData() async {
    uid = getUserId();
    print("*****************************$uid");
    await Future.delayed(Duration(seconds: 1));
  }

  int getUserId() {
    final box = GetStorage();
    return box.read('userId');
  }

  Future<void> getNotification() async {
    loading.value = true;
    error.value = "";

    var res = await GetNotificationService.getNotification(uid);

    loading.value = false;

    if (res is GetNotificationResponse) {
      getNotificationModel = res;
      await Future.delayed(Duration(milliseconds: 300));
      // searchResults = getBiddingHorseModel.data!;
      //print("=============================${searchResults!.length}");
    } else {
      loading.value = false;
      error.value = res.toString();
    }
  }
}
