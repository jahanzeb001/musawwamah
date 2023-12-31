import 'dart:developer';

import '../../../../../utils/constants/app_urls.dart';
import '../../../../../utils/constants/base_client.dart';
import 'package:http/http.dart' as http;

class ReFundBalance {
  static Future<dynamic> recoverbalance(
      bankname, ibanno, amount, userid) async {
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
        log('${res.body}');
      } else {
        return res;
      }
    } catch (e) {
      return e;
    }
  }
}
