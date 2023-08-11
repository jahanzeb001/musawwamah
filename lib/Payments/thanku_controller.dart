import 'package:get/get.dart';

class ThankuScreenController extends GetxController {
  var aliganceno = "";
  var horsename = "";
  var price = "";
  var location = "";
  var imgurl = "";

  void setThankuData(aligancenoo, horsenamee, pricee, locationn, imgurll) {
    aliganceno = aligancenoo;
    horsename = horsenamee;
    price = pricee;
    location = locationn;
    imgurl = imgurll;
  }
}
