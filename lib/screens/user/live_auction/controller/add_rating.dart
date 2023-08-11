import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../../utils/constants/app_urls.dart';
import '../../../../utils/constants/base_client.dart';
import '../../settings/my_orders/controller/my_orders_controller.dart';

class AddRattingRecord {
  static Future<dynamic> addrating(
      {int? userId,
      var horseid,
      var sellerating,
      var deliverrating,
      var sellercomment,
      var deleveryboycomment,
      context}) async {
    Map data = {
      "userId": userId,
      "horseId": horseid,
      "ratting": sellerating,
      "review": sellercomment,
      "deliveryReview": deleveryboycomment,
      "deliveryRating": deliverrating
    };
    try {
      final myOrdersController = Get.find<MyOrdersController>();
      var url = "${AppUrls.baseUrl}${AppUrls.horsereview}";
      var res = await BaseClientClass.post(url, data);

      if (res is http.Response) {
        log(res.body);
        Get.snackbar("notification", "Success");
        gotoback(context);
        myOrdersController.loadData();
        return 'true';
      } else {
        Get.snackbar("notification", 'Error');
        return 'false';
      }
    } catch (e) {
      return e;
    }
  }
}

gotoback(context) {
  Navigator.pop(context);
}
