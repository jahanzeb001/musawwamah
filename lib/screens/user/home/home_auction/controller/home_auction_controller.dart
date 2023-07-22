import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:obaiah_mobile_app/screens/user/home/home_auction/model/get_bidding_horse_response.dart';
import 'package:obaiah_mobile_app/screens/user/home/home_auction/service/get_biding_horse_service.dart';

class HomeAuctionController extends GetxController {
  var loading = false.obs;
  var error = "".obs;
  var getBiddingHorseModel = GetBidingHorseResponse();
  var mybalance = ''.obs;
  int? userBalance;
  int? userId;
  RxBool isSearchFieldShow = false.obs;
  var searchTextController = TextEditingController();

  Future<GetBidingHorseResponse> getBiddingHorse() async {
    loading.value = true;
    error.value = "";

    var res = await GetBidingService.getBidingHorse();

    loading.value = false;

    if (res is GetBidingHorseResponse) {
      getBiddingHorseModel = res;
      await Future.delayed(Duration(milliseconds: 300));
      // searchResults = getBiddingHorseModel.data!;
      //print("=============================${searchResults!.length}");
    } else {
      loading.value = false;
      error.value = res.toString();
    }

    return getBiddingHorseModel;
  }

  getUserData() {
    userBalance = GetStorage().read("accbal");

    print("***********************user balace is  ${userBalance} ");
  }

  toggleSearchField() {
    isSearchFieldShow.value = !isSearchFieldShow.value;
  }

  ////////////////////search horse

  List<Datum>? searchResults;

  void search(GetBidingHorseResponse response, String searchKeyword) {
    searchResults = response.data!.where((datum) {
      // Search in the desired properties of the Datum object
      return datum.nameOfHorse
                  ?.toLowerCase()
                  .contains(searchKeyword.toLowerCase()) ==
              true ||
          datum.fathersName
                  ?.toLowerCase()
                  .contains(searchKeyword.toLowerCase()) ==
              true ||
          datum.user!.fullname
                  ?.toLowerCase()
                  .contains(searchKeyword.toLowerCase()) ==
              true ||
          datum.mothersName
                  ?.toLowerCase()
                  .contains(searchKeyword.toLowerCase()) ==
              true;
    }).toList();

    if (searchResults!.isNotEmpty) {
      // Found matching data
      for (var datum in searchResults!) {
        print('Horse Name: ${datum.nameOfHorse}');
        print('Father\'s Name: ${datum.fathersName}');
        print('Mother\'s Name: ${datum.mothersName}');
        print('-------------------------');
      }
    } else {
      // No matching data found
      print('No matching data found.');
    }
  }
}
