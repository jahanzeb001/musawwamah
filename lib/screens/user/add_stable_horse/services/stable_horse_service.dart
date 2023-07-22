import 'package:obaiah_mobile_app/screens/user/add_stable_horse/model/delete_horse_model.dart';
import 'package:http/http.dart' as http;
import 'package:obaiah_mobile_app/utils/constants/app_urls.dart';
import 'package:obaiah_mobile_app/utils/constants/base_client.dart';

class StableHorseService {
  static Future<dynamic> deleteHorse(int horseId) async {
    try {
      var url = "${AppUrls.baseUrl}${AppUrls.deleteStableHorse}/$horseId";
      var res = await BaseClientClass.delete(url, "");

      if (res is http.Response) {
        return deleteStableHorseResponseFromJson(res.body);
      } else {
        return res;
      }
    } catch (e) {
      return e;
    }
  }
}
