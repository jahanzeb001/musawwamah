// ignore_for_file: must_be_immutable

import 'dart:developer';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:obaiah_mobile_app/reusable_widgets/reusable_appbar.dart';
import 'package:obaiah_mobile_app/utils/colors/colors.dart';
import 'package:obaiah_mobile_app/utils/constants/app_urls.dart';
import 'package:obaiah_mobile_app/utils/spacing/gaps.dart';
import 'package:obaiah_mobile_app/utils/spacing/padding.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pinput/pinput.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';
import 'package:video_player/video_player.dart';
import 'dart:ui' as ui;
import '../../../../reusable_widgets/reusable_alertDialog.dart';
import '../../../../reusable_widgets/reusable_button.dart';
import '../../../../utils/text_styles/textstyles.dart';
import '../../../user/add_new_horse/components/add_new_horse_components.dart';
import '../../../user/home/auction_listing/components/auction_components.dart';
import '../../../user/home/regular_listing/view/regular_listing_screen.dart';
import '../../delivery_confirm_pickup/components/delivery_confirm_pickup_components.dart';
import '../../delivery_confirm_pickup/controller/delivery_confirm_pickup_controller.dart';
import '../../delivery_confirm_pickup/services/veriffy_otp.dart';
import '../controller/delivery_confirm_dropoff_controller.dart';
import 'package:obaiah_mobile_app/screens/user/home/regular_listing/model/get_horse_detail_model.dart';

class DeliveryConfirmDropOffScreen extends StatefulWidget {
  final HorseDetailsResponse homePageModel;
  final int horseId;
  var purchaserNumber;
  var aglino;

  DeliveryConfirmDropOffScreen(
      {Key? key,
      required this.homePageModel,
      required this.horseId,
      required this.purchaserNumber,
      required this.aglino})
      : super(key: key);

  @override
  State<DeliveryConfirmDropOffScreen> createState() =>
      _DeliveryConfirmDropOffScreenState();
}

class _DeliveryConfirmDropOffScreenState
    extends State<DeliveryConfirmDropOffScreen> {
  final deliveryConfirmDropOffController =
      Get.find<DeliveryConfirmDropOffController>();
////////////////////////////////////////////////////

  File? _pickedVideo;
  File? horseBackView;
  File? horseFrontView;
  File? horseLeftView;
  File? horseRightView;
  File? horseNotesView;
  bool isLoading = false;
  bool sendOtp = false;

  //////////////////horse back view
  VideoPlayerController? _videoPlayerController;

  Future<void> _getHorseBackImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    setState(() {
      horseBackView = File(pickedFile!.path);
    });
  }

  //////////////////horse front view
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

///////////////////pic notes
  Future<void> _getHorseNotesImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    setState(() {
      horseNotesView = File(pickedFile!.path);
    });
  }

//////////////////pick video
  Future<void> _pickVideo(ImageSource source) async {
    final ImagePicker _picker = ImagePicker();

    final pickedFile = await _picker.getVideo(source: source);
    setState(() {
      _pickedVideo = File(pickedFile!.path);
    });
    _videoPlayerController = VideoPlayerController.file(_pickedVideo!)
      ..initialize().then((_) {
        setState(() {});

        _videoPlayerController!.play();
      });
  }

  /////////////////////take signature image
  ///
  File? signature;

  Future<File?> captureSignatureAsFile(
      GlobalKey<SfSignaturePadState> signaturePadKey) async {
    try {
      final signaturePadState = signaturePadKey.currentState;
      if (signaturePadState == null) {
        print("Signature pad key's state is null");
        return null;
      }

      // Capture the signature as an image (ByteData)
      final signatureData = await signaturePadState.toImage(pixelRatio: 3.0);
      final byteData =
          await signatureData.toByteData(format: ui.ImageByteFormat.png);

      if (byteData == null) {
        print("Error converting image to ByteData");
        return null;
      }

      // Get the temporary directory path
      Directory tempDir = await getTemporaryDirectory();
      String tempPath = tempDir.path;

      // Create a new temporary file
      File tempFile = File('$tempPath/signature.png');

      // Write the signature data to the file
      await tempFile.writeAsBytes(byteData.buffer.asUint8List());

      return tempFile;
    } catch (e) {
      print("Error capturing signature as file: $e");
      return null;
    }
  }

////////////////////////////////////////////////////
  VeriffyOtp verifyotpcontroller = VeriffyOtp();
  String userId = '';
  var verId = '';
  int? resendTokenId;
  bool phoneAuthcheck = false;
  dynamic credentials;
  void sendOTP(number) async {
    log('otppNumber  $number');
    String phone = number;
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phone,
      timeout: const Duration(seconds: 60),
      codeSent: (verificationId, resendToken) {
        verId = verificationId;
        resendTokenId = resendToken;

        log('Code send');
        Get.snackbar(
          'success'.tr,
          'codesent'.tr,
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.white,
        );

        // Get.to(() => PinputExample(

        //     number: email.text));
      },
      verificationCompleted: (credential) async {
        log('completed');
        Get.snackbar(
          'success'.tr,
          'completed'.tr,
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.white,
        );
        credentials = credential;
        await FirebaseAuth.instance.signInWithCredential(credential);
      },
      verificationFailed: (ex) {
        log('failed');
        Get.snackbar(
          'Error',
          'failed!',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.white,
        );
        if (ex.code == 'invalid-phone-number') {
          log('invalid phone number');
          Get.snackbar(
            'Error',
            'invalid phone number',
            snackPosition: SnackPosition.TOP,
            backgroundColor: Colors.white,
          );
        }
        log(ex.code.toString());
      },
      codeAutoRetrievalTimeout: (verificationId) {},
    );
  }

  verifyOTP(String otp) async {
    try {
      final credential = PhoneAuthProvider.credential(
        verificationId: verId,
        smsCode: otp,
      );

      final authResult =
          await FirebaseAuth.instance.signInWithCredential(credential);

      if (authResult.user != null) {
        Get.snackbar(
          'success'.tr,
          'Conformed'.tr,
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.white,
        );
        // OTP verification successful
        setState(() {
          sendOtp = true;
        });
        return true;
      } else {
        Get.snackbar(
          'errorwrongotp'.tr,
          'pleaseentercorrectotp'.tr,
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.white,
        );
        // OTP verification failed
        return false;
      }
    } catch (e) {
      Get.snackbar(
        'errorwrongotp'.tr,
        'pleaseentercorrectotp'.tr,
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.white,
      );
      // Error occurred during OTP verification
      print('Error verifying OTP: $e');
      return false;
    }
  }

  final defaultPinTheme = PinTheme(
    height: 50,
    width: 335,
    textStyle: TextStyle(
      fontFamily: "Tajawal",
      fontSize: 30,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    ),
    decoration: BoxDecoration(
      color: Colors.white,
      border: Border.all(color: Colors.black26),
      borderRadius: BorderRadius.circular(5),
    ),
  );
  void defaultDialoug() {
    Get.defaultDialog(content: Center(child: CircularProgressIndicator()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ReusableAppBar(
          titleText: "my connections",
          onPressFunction: () {
            Navigator.pop(context);
          },
          textStyle: black718),
      body: Container(
        padding: padA10,
        width: context.width * 1,
        height: context.height * 1,
        child: Container(
          padding: padA10,
          width: context.width * 1,
          height: context.height * 1,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: cScaffoldBackground,
            boxShadow: const <BoxShadow>[
              BoxShadow(
                color: Colors.black54,
                blurRadius: 100.0,
                spreadRadius: 30,
                offset: Offset(0.0, 0.75),
              )
            ],
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                //Component 1
                gapH10,
                Text(
                  "delivery confirmation".tr,
                  style: primary728,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "allegiance no".tr,
                      style: onyx716,
                    ),
                    Text(
                      "# ${widget.aglino}".tr,
                      style: onyx716,
                    ),
                  ],
                ),
                gapH20,
                //Component 2
                Container(
                  padding: padA10,
                  width: context.width * 1,
                  decoration: BoxDecoration(
                      color: cWhiteColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: SizedBox(
                    height: 290,
                    width: context.width * 1,
                    child: Stack(
                      children: [
                        CarouselSlider.builder(
                            controller: deliveryConfirmDropOffController
                                .sliderController,
                            unlimitedMode: true,
                            slideBuilder: (index) {
                              return ClipPath(
                                clipper: const ShapeBorderClipper(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)))),
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border(
                                      right: BorderSide(
                                          width: 6.0,
                                          color: Colors.black.withOpacity(0.1)),
                                      bottom: BorderSide(
                                          width: 6.0,
                                          color: Colors.black.withOpacity(0.1)),
                                    ),
                                  ),
                                  child: CachedNetworkImage(
                                    imageUrl:
                                        "${AppUrls.ImagebaseUrl}${widget.homePageModel.data!.horseFrontView ?? ""}",
                                    imageBuilder: (context, imageProvider) =>
                                        Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
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
                                    // errorWidget: (context, url, error) =>
                                    //     Image.asset(
                                    //         "assets/images/home_images/horse_image_large.jpg"),
                                    //show no iamge availalbe image on error laoding
                                  ),

                                  // Image.network(
                                  //     "${AppUrls.ImagebaseUrl}${homePageModel.data!.horseFrontView ?? ""}",
                                  //     fit: BoxFit.cover),
                                ),
                              );
                            },
                            slideTransform: const CubeTransform(),
                            itemCount: images.length),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  ImageSliderComponent(),
                                  gapW5,
                                  ImageSliderComponent(),
                                  gapW5,
                                  ImageSliderComponent(),
                                ],
                              ),
                              gapH15,
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                gapH20,
                //Component 3
                SizedBox(
                  height: 289,
                  width: context.width * 1,
                  child: Stack(children: [
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 5),
                        height: 280,
                        width: context.width * 1,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Expanded(
                                    child: Text(
                                      "type".tr,
                                      style: auctionHeadingTextStyle,
                                    ),
                                  ),
                                  gapH5,
                                  Expanded(
                                    child: Text(
                                      widget.homePageModel.data?.type ?? "",
                                      style: auctionValueTextStyle,
                                    ),
                                  ),
                                  gapH25,
                                  Expanded(
                                    child: Text(
                                      "color".tr,
                                      style: auctionHeadingTextStyle,
                                    ),
                                  ),
                                  gapH5,
                                  Expanded(
                                    child: Text(
                                        widget.homePageModel.data?.color ?? "",
                                        style: auctionValueTextStyle),
                                  ),
                                  gapH25,
//Repeat
                                  Expanded(
                                    child: Text(
                                      "name of the father".tr,
                                      style: auctionHeadingTextStyle,
                                    ),
                                  ),
                                  gapH5,
                                  Expanded(
                                    child: Text(
                                      widget.homePageModel.data?.fathersName ??
                                          "",
                                      style: auctionValueTextStyle,
                                    ),
                                  ),
                                  gapH25,
                                  Expanded(
                                    child: Text(
                                      "mother name".tr,
                                      style: auctionHeadingTextStyle,
                                    ),
                                  ),
                                  gapH5,
                                  Expanded(
                                    child: Text(
                                        widget.homePageModel.data
                                                ?.mothersName ??
                                            "",
                                        style: auctionValueTextStyle),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Expanded(
                                    child: Text(
                                      "name".tr,
                                      style: auctionHeadingTextStyle,
                                    ),
                                  ),
                                  gapH5,
                                  Expanded(
                                    child: Text(
                                      widget.homePageModel.data?.nameOfHorse ??
                                          "",
                                      style: auctionValueTextStyle,
                                    ),
                                  ),
                                  gapH25,
                                  Expanded(
                                    child: Text(
                                      "height".tr,
                                      style: auctionHeadingTextStyle,
                                    ),
                                  ),
                                  gapH5,
                                  Expanded(
                                    child: Text(
                                        widget.homePageModel.data?.height ?? "",
                                        style: auctionValueTextStyle),
                                  ),
                                  gapH25,
                                  Expanded(
                                    child: Text(
                                      "weight".tr,
                                      style: auctionHeadingTextStyle,
                                    ),
                                  ),
                                  gapH5,
                                  Expanded(
                                    child: Text(
                                      widget.homePageModel.data?.weight
                                              .toString() ??
                                          "",
                                      style: auctionValueTextStyle,
                                    ),
                                  ),
                                  gapH25,
                                  Expanded(
                                    child: Text(
                                      "originality".tr,
                                      style: auctionHeadingTextStyle,
                                    ),
                                  ),
                                  gapH5,
                                  Expanded(
                                    child: Text(
                                        widget.homePageModel.data
                                                ?.originality ??
                                            "",
                                        style: auctionValueTextStyle),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Expanded(
                                    child: Text(
                                      "age".tr,
                                      style: auctionHeadingTextStyle,
                                    ),
                                  ),
                                  gapH5,
                                  Expanded(
                                    child: Text(
                                      widget.homePageModel.data?.age
                                              .toString() ??
                                          "",
                                      style: auctionValueTextStyle,
                                    ),
                                  ),
                                  gapH25,
                                  Expanded(
                                    child: Text(
                                      "safety".tr,
                                      style: auctionHeadingTextStyle,
                                    ),
                                  ),
                                  gapH5,
                                  Expanded(
                                    child: Text(
                                        widget.homePageModel.data?.casuality ??
                                            "",
                                        style: auctionValueTextStyle),
                                  ),
                                  gapH25,
                                  Expanded(
                                    child: Text(
                                      "site".tr,
                                      style: auctionHeadingTextStyle,
                                    ),
                                  ),
                                  gapH5,
                                  Expanded(
                                    child: Text(
                                      widget.homePageModel.data?.city ?? "",
                                      style: auctionValueTextStyle,
                                    ),
                                  ),
                                  gapH25,
                                  Expanded(
                                    child: Text(
                                      "did he complete his vaccinations?".tr,
                                      style: auctionHeadingTextStyle,
                                    ),
                                  ),
                                  gapH5,
                                  Expanded(
                                    child: Text(
                                        widget.homePageModel.data
                                                    ?.isVaccinated ==
                                                '1'
                                            ? 'Yes'
                                            : 'no',
                                        style: auctionValueTextStyle),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                        alignment: Alignment.topRight,
                        child: Row(
                          children: [
                            gapW20,
                            Text(
                              "horse details".tr,
                              style: auctionMediumPrimaryTextStyle,
                            ),
                          ],
                        )),
                  ]),
                ),
                gapH20,
                //Component 4
                InkWell(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) => const ShowDescriptionDialog(
                              titleText: "additional description",
                              descriptionText:
                                  "Lorem Ipsum is a virtual model that is placed in the designs to be presented to the client to visualize the method of placing texts in the designs, whether they are printed designs. Brochure or flyer, for example. or website templates. Upon the client's initial approval of the design, this text is removed from the design and the final texts are placed",
                            ));
                  },
                  child: SizedBox(
                    height: context.isPortrait ? 140 : 100,
                    width: context.width * 1,
                    child: Stack(children: [
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          padding: padA20,
                          height: context.isPortrait ? 131 : 91,
                          width: context.width * 1,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          child: Text(
                            "Lorem Ipsum is a virtual model that is placed in the designs to be presented to the client to visualize the method of placing texts in the designs, whether they are printed designs. Brochure or flyer, for example. or website templates. Upon the client's initial approval of the design, this text is removed from the design and the final texts are placed"
                                .tr,
                            textAlign: TextAlign.justify,
                            maxLines: context.isPortrait ? 8 : 5,
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                            style: auctionDescriptionTextStyle,
                          ),
                        ),
                      ),
                      Align(
                          alignment: Alignment.topRight,
                          child: Row(
                            children: [
                              gapW20,
                              Text(
                                "additional description".tr,
                                style: auctionMediumPrimaryTextStyle,
                              ),
                            ],
                          )),
                    ]),
                  ),
                ),
                gapH20,
                //Component 5
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: cWhiteColor),
                  child: Column(children: [
                    gapH10,
                    Row(
                      children: [
                        gapW15,
                        Text(
                          "notes".tr,
                          textAlign: TextAlign.center,
                          style: black714,
                        ),
                        gapW5,
                        Text(
                          "(is mandatory)".tr,
                          textAlign: TextAlign.center,
                          style: primary709,
                        ),
                      ],
                    ),
                    ConfirmPickupAndDropMaxLinesIncreasedTextFormFieldComponent(
                        hintText:
                            "Here you can write the additional description that you want to write, noting that it is forbidden to put any external links, phone numbers, or any data that violates the terms and conditions of the site.",
                        textController: deliveryConfirmDropOffController
                            .compulsoryNotesController),
                  ]),
                ),
                gapH20,
                //Component 6
                Container(
                  padding: padA20,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: cCulturedWhiteColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      gapH10,
                      Row(
                        children: [
                          gapW15,
                          Text(
                            "pictures and video".tr,
                            textAlign: TextAlign.center,
                            style: black714,
                          ),
                          gapW5,
                          Text(
                            "(is mandatory)".tr,
                            textAlign: TextAlign.center,
                            style: primary709,
                          ),
                        ],
                      ),
                      gapH10,
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          gapW30,
                          Expanded(
                              child: CustomContainerComponent(
                            onTapFunction: () {
                              _getHorseBackImage(ImageSource.camera);
                            },
                            text: "horse back view",
                            image: horseBackView,
                          )),
                          gapW40,
                          Expanded(
                            child: CustomContainerComponent(
                                onTapFunction: () {
                                  _getHorseFrontImage(ImageSource.camera);
                                },
                                text: "horse image from front",
                                image: horseFrontView),
                          ),
                          gapW30,
                        ],
                      ),
                      gapH20,
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          gapW30,
                          Expanded(
                              child: CustomContainerComponent(
                                  onTapFunction: () {
                                    _getHorseLeftImage(ImageSource.camera);
                                  },
                                  text: "horse image from left",
                                  image: horseLeftView)),
                          gapW40,
                          Expanded(
                            child: CustomContainerComponent(
                                onTapFunction: () {
                                  _getHorseRightImage(ImageSource.camera);
                                },
                                text: "picture of the horse from the right",
                                image: horseRightView),
                          ),
                          gapW30,
                        ],
                      ),
                      gapH20,
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          gapW30,
                          Expanded(
                            child: MediaButton(
                                text: "pictures for notes",
                                onPressFunction: () {
                                  deliveryConfirmDropOffController
                                          .isNotesImagePlaceShowed.value =
                                      !deliveryConfirmDropOffController
                                          .isNotesImagePlaceShowed.value;
                                  //  _getHorseNotesImage(ImageSource.gallery);
                                }),
                          ),
                          gapW40,
                          Expanded(
                            child: MediaButton(
                                text: "video from all sides",
                                onPressFunction: () {
                                  deliveryConfirmDropOffController
                                          .isVideoPlaceShowed.value =
                                      !deliveryConfirmDropOffController
                                          .isVideoPlaceShowed.value;
                                  //  _pickVideo(ImageSource.camera);
                                }),
                          ),
                          gapW30,
                        ],
                      )
                    ],
                  ),
                ),

                gapH20,

                Obx(
                  () => deliveryConfirmDropOffController
                          .isVideoPlaceShowed.value
                      ? Container(
                          height: 200,
                          padding: padA10,
                          decoration: BoxDecoration(
                            color: cCulturedWhiteColor,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            children: [
                              Container(
                                height: 300,
                                width: 200,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20)),
                                child: _pickedVideo != null
                                    ? AspectRatio(
                                        aspectRatio: _videoPlayerController!
                                            .value.aspectRatio,
                                        child: VideoPlayer(
                                          _videoPlayerController!,
                                        ),
                                      )
                                    : Center(
                                        child: IconButton(
                                            onPressed: () {
                                              _pickVideo(ImageSource.camera);
                                            },
                                            icon: Icon(Icons.add)),
                                      ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: MediaButton(
                                    text: "Done",
                                    onPressFunction: () {
                                      deliveryConfirmDropOffController
                                          .isVideoPlaceShowed.value = false;
                                      //  _pickVideo(ImageSource.camera);
                                    }),
                              ),
                              SizedBox(
                                width: 10,
                              )
                            ],
                          ),
                        )
                      : deliveryConfirmDropOffController
                              .isNotesImagePlaceShowed.value
                          ? Container(
                              height: 200,
                              padding: padA10,
                              decoration: BoxDecoration(
                                color: cCulturedWhiteColor,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    height: 300,
                                    width: 200,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: horseNotesView != null
                                        ? Image.file(horseNotesView!)
                                        : Center(
                                            child: IconButton(
                                                onPressed: () {
                                                  _getHorseNotesImage(
                                                      ImageSource.gallery);
                                                  _pickVideo(
                                                      ImageSource.camera);
                                                },
                                                icon: Icon(Icons.add)),
                                          ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: MediaButton(
                                        text: "Done",
                                        onPressFunction: () {
                                          deliveryConfirmDropOffController
                                              .isNotesImagePlaceShowed
                                              .value = false;
                                          //_pickVideo(ImageSource.camera);
                                        }),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  )
                                ],
                              ),
                            )
                          : SizedBox(),
                ),

                gapH20,
                //Component 7
                Container(
                  padding: padA10,
                  decoration: BoxDecoration(
                    color: cCulturedWhiteColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              gapW15,
                              Text(
                                "verification code".tr,
                                textAlign: TextAlign.center,
                                style: black714,
                              ),
                              gapW5,
                              Text(
                                "(is mandatory)".tr,
                                textAlign: TextAlign.center,
                                style: primary709,
                              ),
                            ],
                          ),
                          ElevatedButton(
                              onPressed: () {
                                var selerphone = widget.purchaserNumber;
                                log(selerphone);
                                defaultDialoug();
                                sendOTP(selerphone);
                                Get.back();
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: cPrimaryColor,
                              ),
                              child: FittedBox(
                                child: Text(
                                  "send the code".tr,
                                  style: black714,
                                ),
                              ))
                        ],
                      ),
                      gapH20,
                      Text(
                        "enter the secret code sent to the customer".tr,
                        style: black512,
                      ),
                      gapH20,
                      Directionality(
                        // Specify direction if desired
                        textDirection: TextDirection.ltr,

                        child: Pinput(
                          controller: verifyotpcontroller.pinController,
                          length: 6,

                          focusNode: verifyotpcontroller.focusNode,
                          // androidSmsAutofillMethod:
                          //     AndroidSmsAutofillMethod.smsUserConsentApi,
                          listenForMultipleSmsOnAndroid: true,
                          defaultPinTheme: defaultPinTheme,
                          validator: (value) {
                            return null;
                          },
                          // onClipboardFound: (value) {
                          //   debugPrint('onClipboardFound: $value');
                          //   pinController.setText(value);
                          // },
                          hapticFeedbackType: HapticFeedbackType.lightImpact,
                          onCompleted: (pin) {
                            debugPrint('onCompleted: $pin');
                            verifyOTP(pin);
                          },
                          onChanged: (value) {
                            debugPrint('onChanged: $value');
                          },
                          cursor: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 20,
                                width: 2,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black26),
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.blue,
                                ),
                              ),
                            ],
                          ),
                          focusedPinTheme: defaultPinTheme.copyWith(
                            decoration: defaultPinTheme.decoration!.copyWith(
                              border: Border.all(color: Colors.blue),
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white,
                            ),
                          ),
                          submittedPinTheme: defaultPinTheme.copyWith(
                            decoration: defaultPinTheme.decoration!.copyWith(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: Colors.black12),
                            ),
                          ),
                          errorPinTheme: defaultPinTheme.copyBorderWith(
                            border: Border.all(color: Colors.redAccent),
                          ),
                        ),
                      ),
                      gapH20,
                    ],
                  ),
                ),
                gapH20,
                //Component 9
                Container(
                  padding: padA10,
                  decoration: BoxDecoration(
                    color: cCulturedWhiteColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              gapW15,
                              Text(
                                "client signature".tr,
                                textAlign: TextAlign.center,
                                style: black714,
                              ),
                              gapW5,
                              Text(
                                "(is mandatory)".tr,
                                textAlign: TextAlign.center,
                                style: primary709,
                              ),
                            ],
                          ),
                          const Spacer(),
                        ],
                      ),
                      gapH20,
                      Container(
                        width: context.height * 1,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 2),
                        decoration: BoxDecoration(
                            color: cPrimaryColor,
                            borderRadius: BorderRadius.circular(4)),
                        child: FittedBox(
                          child: Text(
                            "with my signature below, confirming that I have received the horse in the condition mentioned in the advertisement"
                                .tr,
                            textAlign: TextAlign.center,
                            style: black512,
                          ),
                        ),
                      ),
                      gapH20,
                      PrimaryColorButton(
                        stringText: "click here to open signature pad",
                        onPressFunction: () {
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    alignment: Alignment.center,
                                    scrollable: false,
                                    contentPadding: padA10,
                                    backgroundColor: cWhiteColor,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    content: SizedBox(
                                      height: context.height * 0.45,
                                      width: context.width * 0.8,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          SfSignaturePad(
                                            key:
                                                deliveryConfirmDropOffController
                                                    .signaturePadKey,
                                            minimumStrokeWidth: 5,
                                            maximumStrokeWidth: 5,
                                            strokeColor: cBlackColor,
                                            backgroundColor: cWhiteColor,
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Expanded(
                                                child: MediaButton(
                                                    text: "Done",
                                                    onPressFunction: () async {
                                                      signature = await captureSignatureAsFile(
                                                          deliveryConfirmDropOffController
                                                              .signaturePadKey);

                                                      print(
                                                          " signature is $signature");

                                                      if (signature != null) {
                                                        Navigator.pop(context);
                                                      }
                                                      //  _pickVideo(ImageSource.camera);
                                                    }),
                                              ),
                                              SizedBox(
                                                width: 20,
                                              ),
                                              Expanded(
                                                child: MediaButton(
                                                    text: "Cancel",
                                                    onPressFunction: () {
                                                      Navigator.pop(context);
                                                      //  _pickVideo(ImageSource.camera);
                                                    }),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ));
                        },
                        textStyle: black718,
                        height: 50,
                        width: context.width * 0.8,
                        radius: 8,
                      ),
                      gapH20,
                    ],
                  ),
                ),
                gapH20,
                //Component 10
                sendOtp == false
                    ? Container()
                    : Obx(
                        () => OutlinedButton(
                            onPressed: () {
                              if (signature == null) {
                                Get.snackbar("notifications",
                                    'Please Pick up Signature');
                              } else {
                                deliveryConfirmDropOffController
                                    .confirmDeliveryDropOff(
                                        hid: widget.homePageModel.data?.id,
                                        horseImageFromLeft: horseLeftView,
                                        horseImageFromRight: horseRightView,
                                        horseBackView: horseBackView,
                                        horseFrontView: horseFrontView,
                                        horseVideo: _pickedVideo,
                                        notesImage: horseNotesView,
                                        notesText:
                                            deliveryConfirmDropOffController
                                                .compulsoryNotesController.text,
                                        signature: signature);
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              shadowColor: cPrimaryColor,
                              foregroundColor: cPrimaryColor,
                              fixedSize: Size(context.width * 0.7, 50),
                              side: const BorderSide(color: cBlackColor),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              elevation: 0.0,
                            ),
                            child: deliveryConfirmDropOffController
                                    .deliveryConfirmDropOffLoading.value
                                ? CircularProgressIndicator(
                                    color: cBlackColor,
                                  )
                                : FittedBox(
                                    child: Text("delivery confirmation".tr,
                                        style: black720),
                                  )),
                      ),
                gapH20,
                OutlinedButton(
                    onPressed: () {
                      var orseid = widget.horseId;
                      log('$orseid');
                      var personid = GetStorage().read("delPerId");
                      DeliveryConfirmPickUpController()
                          .customerRefusedToReceived(
                              personid, widget.horseId, 1);
                    },
                    style: ElevatedButton.styleFrom(
                      shadowColor: cPrimaryColor,
                      foregroundColor: cPrimaryColor,
                      fixedSize: Size(context.width * 0.7, 50),
                      side: const BorderSide(color: cBlackColor),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 0.0,
                    ),
                    child: FittedBox(
                      child: Text("the customer refused to receive it".tr,
                          style: red820),
                    )),
                gapH40,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
