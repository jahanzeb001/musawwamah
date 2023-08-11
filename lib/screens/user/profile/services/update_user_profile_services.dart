import 'dart:developer';
import '../../../../../utils/constants/app_urls.dart';
import '../../../../../utils/constants/base_client.dart';
import 'package:http/http.dart' as http;

import '../model/review_model.dart';

class GetMyProfileService {
  static Future<dynamic> updateUserProfile(id, image) async {
    Map data = {
      "profile_image": image,
    };
    try {
      var url = "${AppUrls.baseUrl}${AppUrls.updateUserProfile}/$id";

      var res = await BaseClientClass.put(url, data);

      if (res is http.Response) {
        log('${res.statusCode == '200'}');
        return 'true';
      } else {
        return 'false';
      }
    } catch (e) {
      return e;
    }
  }

  static Future<dynamic> getUserReviewRating(id) async {
    try {
      var url = "${AppUrls.baseUrl}${AppUrls.getUserReviews}/$id";

      var res = await BaseClientClass.get(url, '');

      if (res is http.Response) {
        return getUserReviewResponseFromJson(res.body);
      } else {
        return res;
      }
    } catch (e) {
      return e;
    }
  }
}
