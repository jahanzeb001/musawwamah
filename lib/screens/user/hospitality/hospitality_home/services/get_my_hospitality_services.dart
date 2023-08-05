import 'dart:developer';

import 'package:obaiah_mobile_app/screens/user/hospitality/hospitality_home/models/hospitality_advance-filter-response.dart';

import '../../../../../utils/constants/app_urls.dart';
import '../../../../../utils/constants/base_client.dart';
import 'package:http/http.dart' as http;

import '../models/hospitality_model.dart';

class GetMyHospitalityService {
  static Future<dynamic> getMyHospitalities(
      {int? filter,
      String? servicetype,
      String? region,
      String? price,
      String? sortBy}) async {
    try {
      var url = "${AppUrls.baseUrl}${AppUrls.gethospitalities}?sort_by=$sortBy";
      var url2 =
          "${AppUrls.baseUrl}${AppUrls.gethospitalities}?filter=$filter&region=$region&price=$price&service_type=$servicetype";

      var res = await BaseClientClass.get(filter == 1 ? url2 : url, "");

      if (res is http.Response) {
        log('${res.body}');
        return getHospitalityResponseFromJson(res.body);
      } else {
        return res;
      }
    } catch (e) {
      return e;
    }
  }

  /////////////////////////////////////

  static Future<dynamic> getMyHospitalitiesAdvanceFilter() async {
    try {
      var url = "${AppUrls.baseUrl}${AppUrls.hospitalityAdvanceFilter}";
      var res = await BaseClientClass.get(url, "");

      if (res is http.Response) {
        log('${res.body}');
        return hospitalityAdvanceFilterResponseFromJson(res.body);
      } else {
        return res;
      }
    } catch (e) {
      return e;
    }
  }
}
