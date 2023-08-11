import 'package:http/http.dart' as http;
import 'package:obaiah_mobile_app/screens/user/home/favourites/model/delete_horse_response.dart';
import 'package:obaiah_mobile_app/screens/user/home/favourites/model/get_my_favourite_response.dart';
import 'package:obaiah_mobile_app/utils/constants/app_urls.dart';
import 'package:obaiah_mobile_app/utils/constants/base_client.dart';

class GetMyFavouriteService {
  static Future<dynamic> getMyFavourites(int uid) async {
    try {
      var url = "${AppUrls.baseUrl}${AppUrls.getWishList}/$uid";
      var res = await BaseClientClass.get(url, "");

      if (res is http.Response) {
        return getMyFavouriteResponseFromJson(res.body);
      } else {
        return res;
      }
    } catch (e) {
      return e;
    }
  }

  static Future<dynamic> deleteHorse(int horseId, int uid) async {
    Map data = {"horseId": horseId, "userId": uid};
    try {
      var url = "${AppUrls.baseUrl}${AppUrls.reomoveFromWishlist}";
      var res = await BaseClientClass.post(url, data);

      if (res is http.Response) {
        return 'true';
      } else {
        return 'false';
      }
    } catch (e) {
      return e;
    }
  }
}
