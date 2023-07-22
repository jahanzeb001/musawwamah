import 'dart:developer';
import '../../../../../utils/constants/app_urls.dart';
import '../../../../../utils/constants/base_client.dart';
import 'package:http/http.dart' as http;

import '../models/traning_listing_model.dart';

class GetMyTraningListingService {
  static Future<dynamic> getMyTraningListing(id) async {
    try {
      var url = "${AppUrls.baseUrl}${AppUrls.gettraning}/$id";
      var res = await BaseClientClass.get(url, "");

      if (res is http.Response) {
        log('${res.body}');
        return getTraningListingResponseFromJson(res.body);
      } else {
        return res;
      }
    } catch (e) {
      return e;
    }
  }
}
