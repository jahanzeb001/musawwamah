import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/constants/app_urls.dart';
import '../../../../../utils/constants/base_client.dart';
import 'package:http/http.dart' as http;

class ReFundBalance {
  static Future<dynamic> recoverbalance(
      bankname, ibanno, amount, userid, context) async {
    Map data = {
      "bank_name": bankname,
      "iban": ibanno,
      "amount_to_be_returned": amount,
      "user_id": userid
    };
    try {
      var url = "${AppUrls.baseUrl}${AppUrls.recoverBalance}";
      var res = await BaseClientClass.post(url, data);

      if (res is http.Response) {
        Get.snackbar("notification".tr, "Request Submit successfull");
        gotoback(context);
        log('${res.body}');
      } else {
        Get.snackbar("Error".tr, "$res");
        return res;
      }
    } catch (e) {
      return e;
    }
  }

  static gotoback(context) {
    Navigator.pop(context);
  }
}
