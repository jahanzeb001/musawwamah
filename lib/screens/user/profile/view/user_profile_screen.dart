import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:obaiah_mobile_app/models/home_model.dart';
import 'package:obaiah_mobile_app/reusable_widgets/reusable_appbar.dart';
import 'package:obaiah_mobile_app/utils/constants/lists.dart';
import 'package:obaiah_mobile_app/utils/spacing/padding.dart';

import '../../../../generated/assets.dart';
import '../../../../utils/colors/colors.dart';
import '../../../../utils/constants/custom_error.dart';
import '../../../../utils/constants/no_data_message.dart';
import '../../../../utils/spacing/gaps.dart';
import '../../../../utils/text_styles/textstyles.dart';
import '../../settings/my_horses_stable/controller/my_horses_stable_controller.dart';
import '../components/user_horses_components.dart';
import '../controller/profile_user_horses_controller.dart';
import 'package:path/path.dart' as path;

class ProfileHorsesScreen extends StatefulWidget {
  const ProfileHorsesScreen({Key? key}) : super(key: key);

  @override
  State<ProfileHorsesScreen> createState() => _ProfileHorsesScreenState();
}

class _ProfileHorsesScreenState extends State<ProfileHorsesScreen> {
  final myHorsesStableController = Get.find<MyHorsesStableController>();
  final profileController = Get.find<ProfileUserHorsesController>();
  File? idBackView;
  Future<void> _getHorseBackImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    idBackView = File(pickedFile!.path);
    setState(() {
      idBackView = File(pickedFile.path);
    });
    fileToString(idBackView!);
  }

  Future<void> fileToString(File idFview) async {
    /////////////////////////////////////////////////////////////
    var img = base64Encode(await idFview.readAsBytes());
    String extension = path.extension(idFview.path);
    var extenshionval = extension.substring(1);
    var sendfile = "data:image/$extenshionval;base64,${img}";
    profileController.updateUserProfile(sendfile);
  }

  @override
  void initState() {
    myHorsesStableController.loadData();
    profileController.getUserReviewRating();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final profileUserHorsesController = Get.find<ProfileUserHorsesController>();
    HomeModel homeModel = homePageList[0];
    return Scaffold(
      appBar: ReusableAppBar(
          titleText: "مربط أجمل",
          textStyle: primary820,
          onPressFunction: () {
            Navigator.pop(context);
          }),
      body: Obx(
        () => Container(
          height: context.height * 1,
          width: context.width * 1,
          padding: padA10,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //Component 1
                Container(
                  padding: padA20,
                  height: 150,
                  width: context.width * 1,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 2,
                        child: SizedBox(
                          child: Stack(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  // _showBottomSheetMenu(context);
                                },
                                child: ClipPath(
                                  clipper: const ShapeBorderClipper(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)))),
                                  child: Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: cWhiteColor,
                                      border: Border.all(
                                          color: cWhiteColor, width: 10),
                                    ),
                                    child: idBackView != null
                                        ? Image.file(
                                            idBackView!,
                                            fit: BoxFit.cover,
                                          )
                                        : Image.asset(
                                            homeModel.horseImage,
                                            fit: BoxFit.cover,
                                          ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: SvgPicture.asset(
                                  Assets.auctionImagesVerified,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                          flex: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        "sales".tr,
                                        style: auctionDescriptionTextStyle,
                                      ),
                                      gapH5,
                                      Text(
                                        homeModel.sales,
                                        style: auctionDescriptionBoldTextStyle,
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        "ratings".tr,
                                        style: auctionDescriptionTextStyle,
                                      ),
                                      gapH5,
                                      Text(
                                        homeModel.rating,
                                        style: auctionDescriptionBoldTextStyle,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              FittedBox(
                                child: Directionality(
                                  textDirection: TextDirection.ltr,
                                  child: RatingBar(
                                      initialRating: 3,
                                      direction: Axis.horizontal,
                                      allowHalfRating: true,
                                      itemCount: 5,
                                      ignoreGestures: true,
                                      onRatingUpdate: (rating) {
                                        log(rating.toString());
                                      },
                                      ratingWidget: RatingWidget(
                                        full: const Icon(
                                          Icons.star_sharp,
                                          color: cPrimaryColor,
                                        ),
                                        half: const Icon(
                                          Icons.star_half_sharp,
                                          color: cPrimaryColor,
                                        ),
                                        empty: const Icon(
                                          Icons.star_border_sharp,
                                          color: cPrimaryColor,
                                        ),
                                      )),
                                ),
                              ),
                            ],
                          ))
                    ],
                  ),
                ),
                gapH20,
                //Component 2
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      gapW10,
                      Expanded(
                        child: Obx(
                          () => SelectContainerComponent(
                            text: "stable",
                            isChecked: profileUserHorsesController
                                .isStableChecked.value,
                            onTapFunction: () {
                              profileUserHorsesController.toggleTypeOfPurchase(
                                  isStableTapped: true);
                            },
                          ),
                        ),
                      ),
                      gapW20,
                      Expanded(
                        child: Obx(
                          () => SelectContainerComponent(
                            text: "ratings",
                            isChecked: profileUserHorsesController
                                .isRatingsChecked.value,
                            onTapFunction: () {
                              profileUserHorsesController.toggleTypeOfPurchase(
                                  isStableTapped: false);
                            },
                          ),
                        ),
                      ),
                      gapW10,
                    ],
                  ),
                ),
                gapH20,
                //Component 3
                myHorsesStableController.loading.value
                    ? Center(
                        child: CircularProgressIndicator(
                        color: cPrimaryColor,
                      ))
                    : myHorsesStableController.error.value != ""
                        ? Center(
                            child: Custom_Error(
                                onpressed: () {
                                  myHorsesStableController.getStableHorse(
                                      myHorsesStableController.uid);
                                },
                                error: myHorsesStableController.error.value),
                          )
                        : myHorsesStableController.stableHorseModel.data == null
                            ? Center(
                                child: NoDataMessage(message: "No Data Found"))
                            : Flexible(child: Obx(() {
                                return profileUserHorsesController
                                        .isStableChecked.value
                                    ? GridView.builder(
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        itemCount: myHorsesStableController
                                            .stableHorseModel.data!.length,
                                        gridDelegate:
                                            const SliverGridDelegateWithFixedCrossAxisCount(
                                                mainAxisExtent: 300,
                                                crossAxisCount: 2,
                                                crossAxisSpacing: 4.0,
                                                mainAxisSpacing: 4.0),
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return ProfileGridViewInfoCard(
                                            homePageModel:
                                                myHorsesStableController
                                                    .stableHorseModel
                                                    .data![index],
                                          );
                                        },
                                      )
                                    : ListView.separated(
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        itemCount: profileController
                                            .getReviewModel.data!.length,
                                        separatorBuilder:
                                            (BuildContext context, int index) =>
                                                gapH15,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return ProfileRatingComponent(
                                            homeModel: profileController
                                                .getReviewModel.data![index],
                                          );
                                        },
                                      );
                              })),
                //Component 4
              ],
            ),
          ),
        ),
      ),
    );
  }

  /////////////////get id front pic
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
                    icon: Icon(Icons.camera_alt_outlined)),
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
}
