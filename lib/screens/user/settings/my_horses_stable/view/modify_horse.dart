// ignore_for_file: must_be_immutable

import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:obaiah_mobile_app/reusable_widgets/reusable_appbar.dart';
import 'package:obaiah_mobile_app/screens/user/settings/my_horses_stable/controller/my_horses_stable_controller.dart';
import 'package:obaiah_mobile_app/utils/colors/colors.dart';
import 'package:obaiah_mobile_app/utils/spacing/gaps.dart';
import 'package:obaiah_mobile_app/utils/spacing/padding.dart';
import 'package:obaiah_mobile_app/utils/text_styles/textstyles.dart';

import '../../../../../utils/constants/app_urls.dart';

class ModifiyStableHorse extends StatefulWidget {
  String? image;
  int? horseId;
  String? nameOfHorse;
  String? type;
  String? fathersName;
  String? mothersName;
  String? monthOfBirth;
  String? yearOfBirth;
  dynamic age;
  String? color;
  String? casuality;
  String? originality;
  dynamic region;
  String? city;

  dynamic siteCommision;
  dynamic expertOpinionPrice;
  dynamic totalPrice;
  String? ibanNumber;

  ModifiyStableHorse({
    super.key,
    this.image,
    this.horseId,
    this.nameOfHorse,
    this.type,
    this.fathersName,
    this.mothersName,
    this.monthOfBirth,
    this.yearOfBirth,
    this.age,
    this.color,
    this.casuality,
    this.originality,
    this.region,
    this.city,
    this.siteCommision,
    this.expertOpinionPrice,
    this.totalPrice,
    this.ibanNumber,
  });

  @override
  State<ModifiyStableHorse> createState() => _ModifiyStableHorseState();
}

class _ModifiyStableHorseState extends State<ModifiyStableHorse> {
  final myHorsesStableController = Get.find<MyHorsesStableController>();
  File? horseBackView;
  File? horseFrontView;
  File? horseLeftView;
  File? horseRightView;
  var nameOfHorse = TextEditingController();
  var type = TextEditingController();
  var fathersName = TextEditingController();
  var mothersName = TextEditingController();
  var monthOfBirth = TextEditingController();
  var yearOfBirth = TextEditingController();
  var age = TextEditingController();
  var color = TextEditingController();
  var casuality = TextEditingController();
  var region = TextEditingController();
  var city = TextEditingController();
  var siteCommision = TextEditingController();
  var expertOpinionPrice = TextEditingController();
  var totalPrice = TextEditingController();
  var ibanNumber = TextEditingController();
  var orignality = TextEditingController();

  Future<void> _getHorseBackImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    setState(() {
      horseBackView = File(pickedFile!.path);
    });
  }

  ////////////////horse front view
  Future<void> _getHorseFrontImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    setState(() {
      horseFrontView = File(pickedFile!.path);
    });
  }

  //////////////////horse left view
  Future<void> _getHorseLeftImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    setState(() {
      horseLeftView = File(pickedFile!.path);
    });
  }

  //////////////////horse right view
  Future<void> _getHorseRightImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    setState(() {
      horseRightView = File(pickedFile!.path);
    });
  }

  @override
  void initState() {
    super.initState();

    setState(() {
      nameOfHorse.text = widget.nameOfHorse ?? "";
      type.text = widget.type ?? "";
      fathersName.text = widget.fathersName ?? "";
      mothersName.text = widget.mothersName ?? "";
      monthOfBirth.text = widget.monthOfBirth ?? "";
      yearOfBirth.text = widget.yearOfBirth ?? "";
      age.text = widget.age ?? "";
      color.text = widget.color ?? "";
      casuality.text = widget.casuality ?? "";
      orignality.text = widget.originality ?? "";
      region.text = widget.region ?? "";
      city.text = widget.city ?? "";
      siteCommision.text = widget.siteCommision ?? "";

      expertOpinionPrice.text = widget.expertOpinionPrice ?? "";
      totalPrice.text = widget.totalPrice ?? "";
      ibanNumber.text = widget.ibanNumber ?? "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ReusableAppBar(
          titleText: widget.nameOfHorse ?? "",
          onPressFunction: () {
            Navigator.pop(context);
          },
          textStyle: black718),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Container(
            //   margin: EdgeInsets.symmetric(horizontal: 12),
            //   alignment: Alignment.center,
            //   decoration: BoxDecoration(
            //       color: cCulturedWhiteColor,
            //       borderRadius: BorderRadius.circular(10)),
            //   child: Padding(
            //     padding: const EdgeInsets.symmetric(vertical: 10),
            //     child: Column(
            //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //         mainAxisSize: MainAxisSize.min,
            //         children: [
            //           Row(
            //             mainAxisSize: MainAxisSize.min,
            //             children: [
            //               gapW30,
            //               Expanded(
            //                   child: CustomContainerComponent2(
            //                 onTapFunction: () {
            //                   _showBottomSheetMenu(context);
            //                 },
            //                 text: "horse back view",
            //                 image: horseBackView,
            //               )),
            //               gapW40,
            //               Expanded(
            //                 child: CustomContainerComponent2(
            //                     onTapFunction: () {
            //                       _horseFrontViewMenu(context);
            //                     },
            //                     image: horseFrontView,
            //                     text: "horse image from front"),
            //               ),
            //               gapW30,
            //             ],
            //           ),
            //           gapH20,
            //           Row(
            //             mainAxisSize: MainAxisSize.min,
            //             children: [
            //               gapW30,
            //               Expanded(
            //                   child: CustomContainerComponent2(
            //                       onTapFunction: () {
            //                         _horseLeftViewMenu(context);
            //                       },
            //                       image: horseLeftView,
            //                       text: "horse image from left")),
            //               gapW40,
            //               Expanded(
            //                 child: CustomContainerComponent2(
            //                     onTapFunction: () {
            //                       _horseRightViewMenu(context);
            //                     },
            //                     image: horseRightView,
            //                     text: "picture of the horse from the right"),
            //               ),
            //               gapW30,
            //             ],
            //           ),
            //         ]),
            //   ),
            // ),

            gapH20,
            Container(
              margin: EdgeInsets.symmetric(horizontal: 12),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: cCulturedWhiteColor,
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              buildText("name of horse"),
                              CustomTextField(controller: nameOfHorse)
                            ],
                          ),
                        ),
                        gapW10,
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              buildText("name of the father"),
                              CustomTextField(controller: fathersName)
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              buildText("mother name"),
                              CustomTextField(controller: mothersName)
                            ],
                          ),
                        ),
                        gapW10,
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              buildText("type"),
                              CustomTextField(controller: type)
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              buildText("month (not mandatory)"),
                              CustomTextField(controller: monthOfBirth)
                            ],
                          ),
                        ),
                        gapW10,
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              buildText("year"),
                              CustomTextField(controller: yearOfBirth)
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              buildText("age"),
                              CustomTextField(controller: age)
                            ],
                          ),
                        ),
                        gapW10,
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              buildText("color"),
                              CustomTextField(controller: color)
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            gapH20,
            Container(
              margin: EdgeInsets.symmetric(horizontal: 12),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: cCulturedWhiteColor,
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              buildText("Casuality"),
                              CustomTextField(controller: casuality)
                            ],
                          ),
                        ),
                        gapW10,
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              buildText("originality"),
                              CustomTextField(controller: orignality)
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              buildText("Region"),
                              CustomTextField(controller: region)
                            ],
                          ),
                        ),
                        gapW10,
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              buildText("city"),
                              CustomTextField(controller: city)
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              buildText("site commission"),
                              CustomTextField(controller: siteCommision)
                            ],
                          ),
                        ),
                        gapW10,
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              buildText("Expert Opinion Price"),
                              CustomTextField(controller: orignality)
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              buildText("Total Price"),
                              CustomTextField(controller: totalPrice)
                            ],
                          ),
                        ),
                        gapW10,
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              buildText("iban no"),
                              CustomTextField(controller: ibanNumber)
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            gapH20,
            Container(
              margin: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              width: double.infinity,
              height: 45,
              child: Obx(() => ElevatedButton(
                  onPressed: () {
                    myHorsesStableController.modifyHorse(
                        hid: widget.horseId,
                        nameOfHorse: nameOfHorse.text,
                        fathersName: fathersName.text,
                        mothersName: mothersName.text,
                        type: type.text,
                        monthOfBirth: monthOfBirth.text,
                        yearOfBirth: yearOfBirth.text,
                        age: age.text,
                        color: color.text,
                        casuality: casuality.text,
                        originality: orignality.text,
                        region: region.text,
                        city: city.text,
                        siteCommision: siteCommision.text,
                        expertOpinionPrice: expertOpinionPrice.text,
                        totalPrice: totalPrice.text,
                        ibanNumber: ibanNumber.text,
                        context: context);
                  },
                  style: ElevatedButton.styleFrom(
                    shadowColor: cPrimaryColor,
                    foregroundColor: cPrimaryColor,
                    backgroundColor: cPrimaryColor,
                    // fixedSize: Size(width, height),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 0.0,
                  ),
                  child: myHorsesStableController.loading3.value
                      ? SizedBox(
                          height: 25,
                          width: 25,
                          child: Center(
                            child: CircularProgressIndicator(
                              color: cBlackColor,
                            ),
                          ),
                        )
                      : Text("add".tr, style: onyx718))),
            )
          ],
        ),
      ),
    );
  }

  Text buildText(String text) => Text(
        text.tr,
        style: onyx410,
      );

  //////////////////for horse back view
  void _showBottomSheetMenu(BuildContext context) {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          return Container(
            decoration: BoxDecoration(
                color: cCheckBackground,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10))),
            child: Row(
              children: [
                gapW60,
                IconButton(
                    onPressed: () {
                      _getHorseBackImage(ImageSource.camera);
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.camera)),
                Spacer(),
                IconButton(
                    onPressed: () {
                      _getHorseBackImage(ImageSource.gallery);
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.photo_album)),
                gapW60,
              ],
            ),
          );
        });
  }

  //////////////////for front  view
  void _horseFrontViewMenu(BuildContext context) {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          return Container(
            decoration: BoxDecoration(
                color: cCheckBackground,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10))),
            child: Row(
              children: [
                gapW60,
                IconButton(
                    onPressed: () {
                      _getHorseFrontImage(ImageSource.camera);
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.camera)),
                Spacer(),
                IconButton(
                    onPressed: () {
                      _getHorseFrontImage(ImageSource.gallery);
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.photo_album)),
                gapW60,
              ],
            ),
          );
        });
  }

//////////////////////horse left view

  void _horseLeftViewMenu(BuildContext context) {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          return Container(
            decoration: BoxDecoration(
                color: cCheckBackground,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10))),
            child: Row(
              children: [
                gapW60,
                IconButton(
                    onPressed: () {
                      _getHorseLeftImage(ImageSource.camera);
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.camera)),
                Spacer(),
                IconButton(
                    onPressed: () {
                      _getHorseLeftImage(ImageSource.gallery);
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.photo_album)),
                gapW60,
              ],
            ),
          );
        });
  }

  //////////////////////horse right view

  void _horseRightViewMenu(BuildContext context) {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          return Container(
            decoration: BoxDecoration(
                color: cCheckBackground,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10))),
            child: Row(
              children: [
                gapW60,
                IconButton(
                    onPressed: () {
                      _getHorseRightImage(ImageSource.camera);
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.camera)),
                Spacer(),
                IconButton(
                    onPressed: () {
                      _getHorseRightImage(ImageSource.gallery);
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.photo_album)),
                gapW60,
              ],
            ),
          );
        });
  }
}

class CustomContainerComponent2 extends StatelessWidget {
  final String text;
  final Function()? onTapFunction;
  File? image;
  String? img2;
  CustomContainerComponent2(
      {Key? key,
      required this.text,
      required this.onTapFunction,
      this.image,
      this.img2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapFunction,
      child: Container(
        padding: padA10,
        height: 100,
        width: 120,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: cWhiteColor, borderRadius: BorderRadius.circular(10)),
        child: image == null
            ? Text(
                text.tr,
                textAlign: TextAlign.center,
                style: auctionValueTextStyle,
              )
            : img2 == ""
                ? CachedNetworkImage(
                    imageUrl: "${AppUrls.ImagebaseUrl}${img2 ?? ""}",
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
                  )
                // Image.network(img2 ?? "")
                : Image.file(
                    image!,
                    fit: BoxFit.contain,
                  ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  TextEditingController controller = TextEditingController();

  CustomTextField({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 12),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
