// ignore_for_file: must_be_immutable, unused_local_variable, unnecessary_null_comparison

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../reusable_widgets/reusable_appbar.dart';
import '../utils/colors/colors.dart';
import '../utils/constants/app_urls.dart';
import '../utils/constants/constants.dart';
import '../utils/spacing/gaps.dart';
import '../utils/spacing/padding.dart';
import '../utils/text_styles/textstyles.dart';

class UserThankyouScreen extends StatefulWidget {
  String aliganceno;
  String horsename;
  String totalamount;
  String location;
  String imgurl;

  UserThankyouScreen({
    required this.aliganceno,
    required this.horsename,
    required this.totalamount,
    required this.location,
    required this.imgurl,
  });

  @override
  State<UserThankyouScreen> createState() => _UserThankyouScreenState();
}

class _UserThankyouScreenState extends State<UserThankyouScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("Thankyou",
            style: TextStyle(
                fontFamily: "Tajawal",
                color: cPrimaryColor,
                fontSize: 25,
                fontWeight: FontWeight.bold)),
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
          height: context.height * 1,
          width: context.width * 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  "Confirmed".tr,
                  style: const TextStyle(
                      fontFamily: "Tajawal",
                      fontWeight: FontWeight.w700,
                      fontSize: 18),
                ),
              ),
              Container(
                  child:
                      Text('# ${widget.aliganceno}', style: homePageHeading)),
              SizedBox(height: 10),
              Container(
                padding: padA10,
                height: 300,
                width: context.width * 1,
                decoration: BoxDecoration(
                    color: cWhiteColor,
                    borderRadius: BorderRadius.circular(10)),
                child: ClipPath(
                  clipper: const ShapeBorderClipper(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)))),
                  child: Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        right: BorderSide(width: 3.0, color: cPrimaryColor),
                        bottom: BorderSide(width: 3.0, color: cPrimaryColor),
                      ),
                    ),
                    child: CachedNetworkImage(
                      imageUrl: "${AppUrls.ImagebaseUrl}${widget.imgurl}",
                      imageBuilder: (context, imageProvider) => Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            //image size fill
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      placeholder: (context, url) => Container(
                        alignment: Alignment.center,
                        child: CircularProgressIndicator(
                          color: cPrimaryColor,
                        ), // you can add pre loader iamge as well to show loading.
                      ), //show progress  while loading image
                      errorWidget: (context, url, error) => Container(
                        alignment: Alignment.center,
                        child: CircularProgressIndicator(
                          color: cPrimaryColor,
                        ), // you can add pre loader iamge as well to show loading.
                      ), //s
                      //show no iamge availalbe image on error laoding
                    ),

                    // Image.network(
                    //     "${AppUrls.ImagebaseUrl}${homePageModel![index].horseFrontView}",
                    //     fit: BoxFit.cover),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: padA15,
                width: context.width * 1,
                decoration: BoxDecoration(
                  color: cWhiteColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            gapH10,
                            Text(
                              "Horse Name".tr,
                              style: homePageHeading,
                            ),
                            gapH10,
                            Text(
                              "Location".tr,
                              style: homePageHeading,
                            ),
                            gapH10,
                            Text(
                              "price".tr,
                              style: homePageHeading,
                            ),
                            gapH10
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            gapH10,
                            Text(
                              "${widget.horsename}".tr,
                              style: homePageValue,
                            ),
                            gapH10,
                            Text(
                              "${widget.location}".tr,
                              style: homePageValue,
                            ),
                            gapH10,
                            Row(
                              children: [
                                Text(
                                  '${widget.totalamount}',
                                  style: homePagePrice,
                                ),
                                Text(
                                  "riyal".tr,
                                  style: homePagePrice,
                                ),
                              ],
                            ),
                            gapH10
                          ],
                        ),
                      ],
                    ),
                    gapH10,
                    Container(
                      height: 50,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              homeScreen, (Route<dynamic> route) => false);
                        },
                        child: Container(
                          padding: padA10,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              border:
                                  Border.all(width: 1, color: cPrimaryColor),
                              borderRadius: BorderRadius.circular(6)),
                          child: Text(
                            "Go To Home".tr,
                            style: onyx810,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
