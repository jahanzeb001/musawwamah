import 'dart:developer';

import '../../../../../utils/constants/app_urls.dart';
import '../../../../../utils/constants/base_client.dart';
import 'package:http/http.dart' as http;

import '../models/training_filter_propertise_model.dart';
import '../models/traning_model.dart';

class GetMyTraningService {
  static Future<dynamic> getMyTraning(
      {int? filter,
      String? servicetype,
      String? region,
      String? price,
      String? sex,
      String? sortBy}) async {
    try {
      var url = "${AppUrls.baseUrl}${AppUrls.gettraning}?sort_by=$sortBy";

      var url2 =
          "${AppUrls.baseUrl}${AppUrls.gettraning}?filter=$filter&region=$region&service_type=$servicetype&price=$price&sex=$sex";
      var res = await BaseClientClass.get(filter == 1 ? url2 : url, "");

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

  // static Future<dynamic> getMyTraningListing(id) async {
  //   try {
  //     var url = "${AppUrls.baseUrl}${AppUrls.gettraning}/$id";
  //     var res = await BaseClientClass.get(url, "");

  //     if (res is http.Response) {
  //       log('${res.body}');
  //       return getTraningResponseFromJson(res.body);
  //     } else {
  //       return res;
  //     }
  //   } catch (e) {
  //     return e;
  //   }
  // }

  static Future<dynamic> getMyTraningPropertise() async {
    try {
      var url = "${AppUrls.baseUrl}${AppUrls.trainingPropertise}";
      var res = await BaseClientClass.get(url, "");

      if (res is http.Response) {
        log('${res.body}');
        return trainingFilterPropertiseResponseFromJson(res.body);
      } else {
        return res;
      }
    } catch (e) {
      return e;
    }
  }
}
