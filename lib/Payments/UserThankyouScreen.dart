// ignore_for_file: must_be_immutable, unused_local_variable, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../reusable_widgets/reusable_appbar.dart';
import '../utils/colors/colors.dart';

class UserThankyouScreen extends StatefulWidget {
  // String SaloonId;
  // String totaldiscount;
  // String totalamount;
  // String discountvalue;
  // String appoinmentId;
  // String customername;
  // String subcriptionid;

  UserThankyouScreen();
  // {required this.totalamount,
  // required this.totaldiscount,
  // required this.appoinmentId,
  // required this.customername,
  // required this.discountvalue,
  // required this.subcriptionid,
  // required this.SaloonId});

  @override
  State<UserThankyouScreen> createState() => _UserThankyouScreenState();
}

class _UserThankyouScreenState extends State<UserThankyouScreen> {
  String? lat, long = '0.0';
  bool islatlongloaded = false;
  var startTime = '';
  var endTime = '';
  var startdate = '';
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ReusableAppBar(
          titleText: "Thanku",
          onPressFunction: () {},
          textStyle: const TextStyle(
              fontFamily: "Tajawal",
              color: cOnyxColor,
              fontSize: 18,
              fontWeight: FontWeight.w700)),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: CircleAvatar(
              backgroundColor: Colors.black12,
              radius: 70,
              child: Icon(
                Icons.check,
                color: Colors.green,
                size: 50,
              ),
            ),
          ),
          SizedBox(height: 20),
          Center(
              child: Text('thankyoupaymentsuccessful'.tr,
                  style: TextStyle(fontSize: 20))),
        ],
      ),
    );
  }
}
