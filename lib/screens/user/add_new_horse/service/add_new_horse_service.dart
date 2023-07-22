import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:obaiah_mobile_app/screens/user/add_new_horse/model/add_new_horse_model.dart';
import 'package:obaiah_mobile_app/screens/user/add_new_horse/model/upload_images_response.dart';
import 'package:obaiah_mobile_app/utils/constants/app_urls.dart';
import 'package:obaiah_mobile_app/utils/constants/base_client.dart';

import '../model/expert_opinion_data_model.dart';

class AddNewHorseService {
  /////////////////////////////method for adding fixed price horse
  static Future<dynamic> addFixedPriceHorse({
    int? userId,
    String? nameOfHorse,
    String? type,
    String? fathersName,
    String? mothersName,
    String? monthOfBirth,
    String? yearOfBirth,
    String? color,
    String? casuality,
    String? originality,
    String? region,
    String? city,
    int? expertOpinionChosen,
    int? expertOpinionAdviceUserId,
    String? expertOpinion,
    int? price,
    int? siteCommision,
    int? expertOpinionPrice,
    int? totalPrice,
    String? additionalDescription,
    String? bankName,
    String? ibanNumber,
    String? isVaccinated,
    String? haveEvidence,
    String? horseBackView,
    String? horseFrontView,
    String? horseImageFromLeft,
    String? horseImageFromRight,
    List<dynamic>? moreImages,
    String? horseVideo,
  }) async {
    Map data = {
      "userId": userId,
      "horseSellingType": "Fixed",
      "nameOfHorse": nameOfHorse,
      "type": type,
      "fathersName": fathersName,
      "mothersName": mothersName,
      "monthOfBirth": monthOfBirth,
      "yearOfBirth": yearOfBirth,
      "color": color,
      "casuality": casuality,
      "originality": originality,
      "region": "abc",
      "city": city,
      "expertOpinionChosen": expertOpinionChosen,
      "expertOpinionAdviceUserID": expertOpinionAdviceUserId,
      "expert_opinion": expertOpinion,
      "price": price,
      "siteCommision": siteCommision,
      "expertOpinionPrice": expertOpinionPrice,
      "totalPrice": totalPrice,
      "additionalDescription": additionalDescription,
      "bankName": "saudi bank",
      "IbanNumber": ibanNumber,
      "isVaccinated": isVaccinated,
      "haveEvidence": haveEvidence,
      "horseBackView": horseBackView,
      "horseFrontView": horseFrontView,
      "horseImageFromLeft": horseImageFromLeft,
      "horseImageFromRight": horseImageFromRight,
      "moreImages": moreImages,
      "horseVideo": horseVideo,
    };
    try {
      var url = "${AppUrls.baseUrl}${AppUrls.addNewHorse}";
      var res = await BaseClientClass.post(url, data);

      if (res is http.Response) {
        return addNewHorseResponseFromJson(res.body);
      } else {
        return res;
      }
    } catch (e) {
      return e;
    }
  }

  /////////////////////////////method for adding  biding horse

  static Future<dynamic> addBiddingHorse({
    int? userId,
    String? nameOfHorse,
    String? type,
    String? fathersName,
    String? mothersName,
    String? monthOfBirth,
    String? yearOfBirth,
    String? color,
    String? casuality,
    String? originality,
    String? region,
    String? city,
    int? expertOpinionChosen,
    int? expertOpinionAdviceUserId,
    String? expertOpinion,
    int? price,
    int? siteCommision,
    int? expertOpinionPrice,
    // dynamic? totalPrice,
    String? additionalDescription,
    String? bankName,
    String? ibanNumber,
    String? isVaccinated,
    String? haveEvidence,
    dynamic timeForAuction,
    dynamic dateForAution,
    String? horseBackView,
    String? horseFrontView,
    String? horseImageFromLeft,
    String? horseImageFromRight,
    List<dynamic>? moreImages,
    String? horseVideo,
  }) async {
    Map data = {
      "userId": userId,
      "horseSellingType": "Bidding",
      "nameOfHorse": nameOfHorse,
      "type": type,
      "fathersName": fathersName,
      "mothersName": mothersName,
      "monthOfBirth": monthOfBirth,
      "yearOfBirth": yearOfBirth,
      "color": color,
      "casuality": casuality,
      "originality": originality,
      "region": region,
      "city": city,
      "expertOpinionChosen": expertOpinionChosen,
      "expertOpinionAdviceUserID": expertOpinionAdviceUserId,
      "expert_opinion": expertOpinion,
      "price": price,
      "siteCommision": siteCommision,
      "expertOpinionPrice": expertOpinionPrice,
      //   "totalPrice": totalPrice,
      "additionalDescription": additionalDescription,
      "bankName": bankName,
      "IbanNumber": ibanNumber,
      "isVaccinated": isVaccinated,
      "haveEvidence": haveEvidence,
      "dateForAution": dateForAution,
      "timeForAuction": timeForAuction,
      "horseBackView": horseBackView,
      "horseFrontView": horseFrontView,
      "horseImageFromLeft": horseImageFromLeft,
      "horseImageFromRight": horseImageFromRight,
      "moreImages": moreImages,
      "horseVideo": horseVideo,
    };
    try {
      var url = "${AppUrls.baseUrl}${AppUrls.addNewHorse}";
      var res = await BaseClientClass.post(url, data);

      if (res is http.Response) {
        return addNewHorseResponseFromJson(res.body);
      } else {
        return res;
      }
    } catch (e) {
      return e;
    }
  }

  /////////////////save images to server

  static Future<dynamic> uploadFiles(File file1, File file2, File file3,
      File file4, List<File> moreimages, File video) async {
    try {
      final url = "${AppUrls.baseUrl}${AppUrls.uplaodImages}";
      final request = http.MultipartRequest('POST', Uri.parse(url));
      print(url);
      request.files
          .add(await http.MultipartFile.fromPath('horseFrontView', file1.path));
      request.files
          .add(await http.MultipartFile.fromPath('horseBackView', file2.path));
      request.files.add(
          await http.MultipartFile.fromPath('horseImageFromLeft', file3.path));
      request.files.add(
          await http.MultipartFile.fromPath('horseImageFromRight', file4.path));

      for (var file in moreimages) {
        request.files
            .add(await http.MultipartFile.fromPath('moreImages[]', file.path));
      }

      request.files
          .add(await http.MultipartFile.fromPath('horseVideo', video.path));

      final response = await request.send().then(http.Response.fromStream);
      print(response);
      if (response is http.Response) {
        return addImagesResponseFromJson(response.body);

        // Handle the response body...
      } else {
        print('File upload failed. Status code: ${response.statusCode}');
        return response;
      }
    } catch (e) {
      return e;
      // Handle the error...
    }
  }

  ////////////////////////get xpert opinion data

  static Future<dynamic> getExpertOpinionData() async {
    try {
      var url = "${AppUrls.baseUrl}${AppUrls.getExpertOpinionData}";
      var res = await BaseClientClass.get(url, "");

      if (res is http.Response) {
        return expertOpinionHorseResponseFromJson(res.body);
      } else {
        return res;
      }
    } catch (e) {
      return e;
    }
  }

////////////////////////add stable horse

  static Future<dynamic> addStableHorse({
    int? userId,
    String? nameOfHorse,
    String? type,
    String? fathersName,
    String? mothersName,
    String? monthOfBirth,
    String? yearOfBirth,
    String? color,
    String? casuality,
    String? originality,
    String? region,
    String? city,
    int? expertOpinionChosen,
    int? expertOpinionAdviceUserId,
    String? expertOpinion,
    int? price,
    int? siteCommision,
    int? expertOpinionPrice,
    int? totalPrice,
    String? additionalDescription,
    String? bankName,
    String? ibanNumber,
    String? isVaccinated,
    String? haveEvidence,
    String? horseBackView,
    String? horseFrontView,
    String? horseImageFromLeft,
    String? horseImageFromRight,
    List<dynamic>? moreImages,
    String? horseVideo,
  }) async {
    Map data = {
      "userId": userId,
      "horseSellingType": "Fixed",
      "nameOfHorse": nameOfHorse,
      "type": type,
      "fathersName": fathersName,
      "mothersName": mothersName,
      "monthOfBirth": monthOfBirth,
      "yearOfBirth": yearOfBirth,
      "color": color,
      "casuality": casuality,
      "originality": originality,
      "region": "abc",
      "city": city,
      "expertOpinionChosen": expertOpinionChosen,
      "expertOpinionAdviceUserID": expertOpinionAdviceUserId,
      "expert_opinion": expertOpinion,
      "price": price,
      "siteCommision": siteCommision,
      "expertOpinionPrice": expertOpinionPrice,
      "totalPrice": totalPrice,
      "additionalDescription": additionalDescription,
      "bankName": "saudi bank",
      "IbanNumber": ibanNumber,
      "isVaccinated": isVaccinated,
      "haveEvidence": haveEvidence,
      "horseBackView": horseBackView,
      "horseFrontView": horseFrontView,
      "horseImageFromLeft": horseImageFromLeft,
      "horseImageFromRight": horseImageFromRight,
      "moreImages": moreImages,
      "horseVideo": horseVideo,
    };
    try {
      var url = "${AppUrls.baseUrl}${AppUrls.addStableHorse}";
      var res = await BaseClientClass.post(url, data);

      if (res is http.Response) {
        return addNewHorseResponseFromJson(res.body);
      } else {
        return res;
      }
    } catch (e) {
      return e;
    }
  }
}
