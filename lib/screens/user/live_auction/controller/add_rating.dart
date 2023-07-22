import 'dart:developer';
import 'package:http/http.dart' as http;

import '../../../../utils/constants/app_urls.dart';
import '../../../../utils/constants/base_client.dart';

class AddRattingRecord {
  static Future<dynamic> addrating(
      {int? userId,
      var horseid,
      var sellerating,
      var deliverrating,
      var sellercomment,
      var deleveryboycomment}) async {
    Map data = {
      "userId": userId,
      "horseId": horseid,
      "ratting": sellerating,
      "review": sellercomment,
      "deliveryReview": deleveryboycomment,
      "deliveryRating": deliverrating
    };
    try {
      var url = "${AppUrls.baseUrl}${AppUrls.horsereview}";
      var res = await BaseClientClass.post(url, data);

      if (res is http.Response) {
        log(res.body);
        return (res.body);
      } else {
        return res;
      }
    } catch (e) {
      return e;
    }
  }
}
