import 'package:obaiah_mobile_app/screens/user/home/home/models/get_all_propertise_list_response.dart';
import 'package:obaiah_mobile_app/screens/user/home/home/models/get_approved_horses_response.dart';
import 'package:obaiah_mobile_app/utils/constants/app_urls.dart';
import 'package:obaiah_mobile_app/utils/constants/base_client.dart';
import 'package:http/http.dart' as http;

class GetApprovedHorseService {
  static Future<dynamic> getApprovedHorse(
      {int? filter,
      String? horseType,
      String? region,
      int? age,
      String? color,
      String? safety,
      String? originality,
      String? sortby}) async {
    try {
      Map data = {
        //"filter": 1,
        "horse_type": horseType,
        "region": region,
        "age": age,
        "color": color,
        "safety": safety,
        "originality": originality,
        "sort_by": sortby
      };
      var url = "${AppUrls.baseUrl}${AppUrls.getApprovedHorses}";
      var res = await BaseClientClass.post(url, data);

      if (res is http.Response) {
        return getApprovedHorsesResponseFromJson(res.body);
      } else {
        return res;
      }
    } catch (e) {
      return e;
    }
  }

  static Future<dynamic> getList() async {
    try {
      var url = "${AppUrls.baseUrl}${AppUrls.getPropertiseList}";
      var res = await BaseClientClass.get(url, "");

      if (res is http.Response) {
        return getFilterPropertiseResponseFromJson(res.body);
      } else {
        return res;
      }
    } catch (e) {
      return e;
    }
  }
}
