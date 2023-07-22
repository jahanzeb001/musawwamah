import 'package:obaiah_mobile_app/screens/user/home/regular_listing/model/add_to_fav_respose.dart';
import 'package:obaiah_mobile_app/screens/user/home/regular_listing/model/get_horse_detail_model.dart';
import 'package:obaiah_mobile_app/utils/constants/app_urls.dart';
import 'package:obaiah_mobile_app/utils/constants/base_client.dart';
import 'package:http/http.dart' as http;

class GetHorseDetailsService {
  static Future<dynamic> getHorseDetail(int Id) async {
    try {
      var url = "${AppUrls.baseUrl}${AppUrls.getHorseDetails}/$Id";
      var res = await BaseClientClass.get(url, "");

      if (res is http.Response) {
        return horseDetailsResponseFromJson(res.body);
      } else {
        return res;
      }
    } catch (e) {
      return e;
    }
  }

///////////////////////////////////////add to fav
  static Future<dynamic> addToFav(int uId, int hid) async {
    Map data = {"horseId": hid, "userId": uId};
    try {
      var url = "${AppUrls.baseUrl}${AppUrls.addToFavourite}";
      var res = await BaseClientClass.post(url, data);

      if (res is http.Response) {
        return addToFavouriteResponseFromJson(res.body);
      } else {
        return res;
      }
    } catch (e) {
      return e;
    }
  }
}
