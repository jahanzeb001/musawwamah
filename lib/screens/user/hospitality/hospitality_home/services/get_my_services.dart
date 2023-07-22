import 'dart:developer';

import '../../../../../utils/constants/app_urls.dart';
import '../../../../../utils/constants/base_client.dart';
import 'package:http/http.dart' as http;

import '../models/hospitality_model.dart';

class GetMyHospitalityService {
  static Future<dynamic> getMyTraning() async {
    try {
      var url = "${AppUrls.baseUrl}${AppUrls.gettraning}";
      var res = await BaseClientClass.get(url, "");

      if (res is http.Response) {
        log('${res.body}');
        return getTraningResponseFromJson(res.body);
      } else {
        return res;
      }
    } catch (e) {
      return e;
    }
  }
}
