import 'dart:developer';
import '../../../../../utils/constants/app_urls.dart';
import '../../../../../utils/constants/base_client.dart';
import 'package:http/http.dart' as http;

import '../models/hospitality_listing_model.dart';

class GetMyHospitalityListingService {
  static Future<dynamic> getMyHospitalityListing(id) async {
    try {
      var url = "${AppUrls.baseUrl}${AppUrls.gethospitalities}/$id";
      var res = await BaseClientClass.get(url, "");

      if (res is http.Response) {
        log('${res.body}');
        return getHospitalityListingResponseFromJson(res.body);
      } else {
        return res;
      }
    } catch (e) {
      return e;
    }
  }
}
