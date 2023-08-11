// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:obaiah_mobile_app/screens/user/support/supportScreenetails.dart';

import '../../../reusable_widgets/reusable_appbar.dart';
import '../../../utils/colors/colors.dart';
import '../../../utils/text_styles/textstyles.dart';
import 'userLiveScupport.dart';

class UserSupportScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ReusableAppBar(
        onPressFunction: () {},
        titleText: "Help",
        textStyle: onyx520,
      ),
      floatingActionButton: Container(
        height: 54,
        width: 136,
        decoration: BoxDecoration(
          color: cPrimaryColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: FloatingActionButton(
          elevation: 0,
          backgroundColor: cPrimaryColor,
          onPressed: () {
            Get.to(() => UserliveSupport());
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'help'.tr,
              style: TextStyle(
                  fontFamily: "Tajawal",
                  color: cWhiteColor,
                  fontSize: 13,
                  fontWeight: FontWeight.w400),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 10),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              SupportContainer(
                ontap: () {},
                containerdata:
                    'When will I have my total income transferred to my  bank account?',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SupportContainer extends StatelessWidget {
  SupportContainer({
    required this.containerdata,
    required this.ontap,
  });

  String containerdata;
  VoidCallback ontap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => SupportScreenDetils());
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Container(
          height: 64,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
            child: Text(
              containerdata,
              style: TextStyle(
                  fontFamily: "Tajawal",
                  color: cBlackColor,
                  fontSize: 13,
                  fontWeight: FontWeight.w400),
              maxLines: 2,
              textAlign: TextAlign.justify,
            ),
          ),
        ),
      ),
    );
  }
}
