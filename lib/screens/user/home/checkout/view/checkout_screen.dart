import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:obaiah_mobile_app/utils/constants/app_urls.dart';
import 'package:obaiah_mobile_app/utils/constants/custom_error.dart';
import 'package:obaiah_mobile_app/utils/constants/no_data_message.dart';
import '../../../../../reusable_widgets/reusable_dropdown_formfield.dart';
import '../../../../../reusable_widgets/reusable_payment_action.dart';
import '../../../../../reusable_widgets/reusable_appbar.dart';
import '../../../../../reusable_widgets/reusable_text.dart';
import '../../../../../utils/colors/colors.dart';
import '../../../../../utils/spacing/gaps.dart';
import '../../../../../utils/spacing/padding.dart';
import '../../../../../utils/text_styles/textstyles.dart';
import '../component/checkout_component.dart';
import '../controller/checkout_controller.dart';
import 'package:obaiah_mobile_app/screens/user/home/regular_listing/model/get_horse_detail_model.dart';

class CheckoutScreen extends StatefulWidget {
  final HorseDetailsResponse homeModel;

  CheckoutScreen({Key? key, required this.homeModel}) : super(key: key);

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  var totalPaid = '';
  var transfervaluy = 0;
  addTransport(price, commission, transport, opnion) {
    log(int.parse(price).toString());

    totalPaid =
        (int.parse(price) + int.parse(commission) + int.parse(opnion) + 500)
            .toString();

    setState(() {
      totalPaid = totalPaid;
      transfervaluy = 500;
    });
  }

  removeTransport(price, commission, transport, opnion) {
    totalPaid = (int.parse(price) + int.parse(opnion) + int.parse(commission))
        .toString();
    setState(() {
      totalPaid = totalPaid;
      transfervaluy = 0;
    });
  }

  mintialvalue() {
    var mprice = widget.homeModel.data!.price;
    var openion = widget.homeModel.data!.expertOpinionPrice;
    var comission = widget.homeModel.data!.siteCommision;
    totalPaid =
        (int.parse(mprice!) + int.parse(openion!) + int.parse('$comission'))
            .toString();
  }

  final checkoutController = Get.find<CheckoutController>();

  @override
  void initState() {
    mintialvalue();
    checkoutController.checkNeedTransportServices(value: false);
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final checkoutController = Get.find<CheckoutController>();

    return Scaffold(
        appBar: ReusableAppBar(
            titleText: "checkout",
            onPressFunction: () {},
            textStyle: const TextStyle(
                fontFamily: "Tajawal",
                color: cOnyxColor,
                fontSize: 18,
                fontWeight: FontWeight.w700)),
        body: Container(
          padding: padA10,
          height: context.height * 1,
          width: context.width * 1,
          child: SingleChildScrollView(
            child: Column(
              children: [
                //Component 1
                Container(
                  padding: padA15,
                  width: context.width * 1,
                  decoration: BoxDecoration(
                    color: cWhiteColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "owner".tr,
                              style: const TextStyle(
                                  color: cPrimaryColor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              " : ${widget.homeModel.data!.user!.fullname}",
                              style: const TextStyle(
                                  color: cPrimaryColor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                      gapH10,
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "type".tr,
                                style: homePageHeading,
                              ),
                              gapH5,
                              Text(
                                widget.homeModel.data!.type ?? "",
                                style: homePageValue,
                              ),
                              gapH10,
                              Text(
                                "color".tr,
                                style: homePageHeading,
                              ),
                              gapH5,
                              Text(
                                widget.homeModel.data!.color ?? "",
                                style: homePageValue,
                              ),
                              gapH10,
                              Text(
                                "age".tr,
                                style: homePageHeading,
                              ),
                              gapH5,
                              Text(
                                widget.homeModel.data!.age.toString(),
                                style: homePageValue,
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "name".tr,
                                style: homePageHeading,
                              ),
                              gapH5,
                              Text(
                                widget.homeModel.data!.nameOfHorse ?? "",
                                style: homePageValue,
                              ),
                              gapH10,
                              Text(
                                "height".tr,
                                style: homePageHeading,
                              ),
                              gapH5,
                              Text(
                                widget.homeModel.data!.height.toString(),
                                style: homePageValue,
                              ),
                              gapH10,
                              Text(
                                "site".tr,
                                style: homePageHeading,
                              ),
                              gapH5,
                              Text(
                                widget.homeModel.data!.city ?? "",
                                style: homePageValue,
                              ),
                            ],
                          ),
                          ClipPath(
                            clipper: const ShapeBorderClipper(
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)))),
                            child: Container(
                              height: 170,
                              width: 155,
                              decoration: const BoxDecoration(
                                border: Border(
                                  right: BorderSide(
                                      width: 3.0, color: cPrimaryColor),
                                  bottom: BorderSide(
                                      width: 3.0, color: cPrimaryColor),
                                ),
                              ),
                              child: CachedNetworkImage(
                                imageUrl:
                                    "${AppUrls.ImagebaseUrl}${widget.homeModel.data!.horseFrontView ?? ""}",
                                imageBuilder: (context, imageProvider) =>
                                    Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      //image size fill
                                      image: imageProvider,
                                      fit: BoxFit.fitWidth,
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
                              //     "${AppUrls.ImagebaseUrl}${widget.homeModel.data!.horseFrontView ?? ""}",
                              //     fit: BoxFit.cover),
                            ),
                          ),
                        ],
                      ),
                      gapH10,
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "price".tr,
                                style: romanSilver408,
                              ),
                              Row(
                                children: [
                                  Text(
                                    widget.homeModel.data!.totalPrice
                                        .toString(),
                                    style: homePagePrice,
                                  ),
                                  Text(
                                    "riyal".tr,
                                    style: homePagePrice,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const Spacer(),
                          gapW25
                        ],
                      ),
                    ],
                  ),
                ),
                gapH15,
                //Component 2
                Obx(() => checkoutController.loadingUser.value
                    ? Center(
                        child: CircularProgressIndicator(
                          color: cPrimaryColor,
                        ),
                      )
                    : checkoutController.errorGettingUser.value != ""
                        ? Center(
                            child: Custom_Error(
                                onpressed: () {
                                  checkoutController
                                      .getUser(checkoutController.userId);
                                },
                                error:
                                    checkoutController.errorGettingUser.value),
                          )
                        : checkoutController.getUserModel.data == null
                            ? NoDataMessage(message: "No User Found")
                            : Container(
                                padding: padA15,
                                width: context.width * 1,
                                decoration: BoxDecoration(
                                  color: cCulturedWhiteColor,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    CheckOutTextFormComponent(
                                        labelText: "card name",
                                        textController: checkoutController
                                            .cardHolderNameController),
                                    gapH20,
                                    CheckOutTextFormComponent(
                                        labelText: "mobile number",
                                        textController: checkoutController
                                            .mobileNumberController),
                                    gapH20,
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Expanded(
                                          child:
                                              ReusableRegionDropDownFormField(
                                                  labelAlignment:
                                                      FloatingLabelAlignment
                                                          .center),
                                        ),
                                        gapW5,
                                        Expanded(
                                          child: CheckOutTextFormComponent(
                                              labelText: "city/province",
                                              textController: checkoutController
                                                  .cityProvinceController),
                                        ),
                                      ],
                                    ),
                                    gapH20,
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Expanded(
                                          child:
                                              ReusableBankDropDownFormField(),
                                        ),
                                        gapW5,
                                        Expanded(
                                          flex: 2,
                                          child: CheckOutTextFormComponent(
                                              labelText: "iban no",
                                              textController: checkoutController
                                                  .ibanNoController),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              )),
                gapH15,
                //Component 3
                Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "horse transport".tr,
                            style: primary511,
                          ),
                          Text(
                            "one of our representatives will by transferring the horse to your site"
                                .tr,
                            textAlign: TextAlign.center,
                            style: onyx508,
                          ),
                          gapH5,
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              gapW4,
                              Expanded(
                                child: Container(
                                  height: 35,
                                  decoration: BoxDecoration(
                                      color: cCheckBackground,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.shade600,
                                          spreadRadius: 1,
                                          blurRadius: 5,
                                          offset: const Offset(0, 5),
                                        ),
                                      ],
                                      borderRadius: BorderRadius.circular(10)),
                                  alignment: Alignment.center,
                                  child: Transform.scale(
                                    scale: 1.5,
                                    child: Obx(() {
                                      return Checkbox(
                                          value: checkoutController
                                              .needTransportServices.value,
                                          checkColor: cPrimaryColor,
                                          fillColor:
                                              const MaterialStatePropertyAll(
                                                  cCheckBackground),
                                          overlayColor:
                                              const MaterialStatePropertyAll(
                                                  cCheckBackground),
                                          side: const BorderSide(
                                              color: cCheckBackground),
                                          onChanged: (val) {
                                            checkoutController
                                                .checkNeedTransportServices(
                                                    value: val!);

                                            if (val) {
                                              var price =
                                                  widget.homeModel.data!.price;
                                              var commission = widget.homeModel
                                                  .data!.siteCommision;
                                              var transport = '500';
                                              var opnion = widget.homeModel
                                                  .data!.expertOpinionPrice;
                                              addTransport(price, commission,
                                                  transport, opnion);
                                            } else {
                                              var price =
                                                  widget.homeModel.data!.price;
                                              var commission = widget.homeModel
                                                  .data!.siteCommision;
                                              var transport = '500';
                                              var opnion = widget.homeModel
                                                  .data!.expertOpinionPrice;
                                              removeTransport(price, commission,
                                                  transport, opnion);
                                            }
                                            log('$val');
                                          });
                                    }),
                                  ),
                                ),
                              ),
                              gapW5,
                              Expanded(
                                flex: 2,
                                child: Text(
                                  "yes please move it before you".tr,
                                  textAlign: TextAlign.center,
                                  style: onyx507,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    gapW10,
                    Expanded(
                      flex: 2,
                      child: SizedBox(
                        height: 100,
                        child: Stack(children: [
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              padding: padA20,
                              height: 91,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Expanded(
                                      child: RecommendationComponent(
                                    recommendationServiceName: "from",
                                    recommendationServiceValue:
                                        widget.homeModel.data!.city ?? "",
                                  )),
                                  Expanded(
                                    child: Obx(
                                      () => RecommendationComponent(
                                        recommendationServiceName: "to me",
                                        recommendationServiceValue:
                                            '${checkoutController.tome.value}',
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                      child: RecommendationComponent(
                                          recommendationServiceName: "price",
                                          recommendationServiceValue:
                                              ('${int.parse(widget.homeModel.data!.price.toString()) + int.parse(widget.homeModel.data!.expertOpinionPrice.toString())}'))),
                                ],
                              ),
                            ),
                          ),
                          Align(
                              alignment: Alignment.topCenter,
                              child: Text(
                                "it's recommended!".tr,
                                style: auctionMediumPrimaryTextStyle,
                              )),
                        ]),
                      ),
                    ),
                  ],
                ),
                gapH20,
                //Component 4
                Container(
                  padding: padA15,
                  width: context.width * 1,
                  decoration: BoxDecoration(
                    color: cCulturedWhiteColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: padA10,
                        width: context.width * 1,
                        decoration: BoxDecoration(
                          color: cWhiteColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              padding: padA20,
                              child: Table(
                                children: [
                                  TableRow(children: [
                                    Text(
                                      'total'.tr,
                                      style: homePageGridHeading,
                                    ),
                                    gapW10,
                                    ReUsableText(
                                        text:
                                            ('${int.parse(widget.homeModel.data!.price.toString()) + int.parse(widget.homeModel.data!.expertOpinionPrice.toString())}')
                                                .tr,
                                        textStyle: homePageGridHeading)
                                  ]),
                                  tableVerticalSpacer,
                                  TableRow(children: [
                                    Text(
                                      'site commission'.tr,
                                      style: homePageGridHeading,
                                    ),
                                    gapW10,
                                    ReUsableText(
                                        text: widget
                                            .homeModel.data!.siteCommision
                                            .toString()
                                            .tr,
                                        textStyle: homePageGridHeading)
                                  ]),
                                  tableVerticalSpacer,
                                  TableRow(children: [
                                    Text(
                                      'Transfer Value'.tr,
                                      style: homePageGridHeading,
                                    ),
                                    gapW10,
                                    ReUsableText(
                                        text: transfervaluy.toString(),
                                        textStyle: homePageGridHeading)
                                  ]),
                                  tableVerticalSpacer,
                                  TableRow(children: [
                                    Text(
                                      'final total'.tr,
                                      style: homePageGridHeading,
                                    ),
                                    gapW10,
                                    ReUsableText(
                                        text: "$totalPaid",
                                        textStyle: homePageGridHeading)
                                  ]),
                                ],
                              ),
                            ),
                            gapH10,
                            Container(
                              padding: padA15,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: cPrimaryColor,
                              ),
                              child: Table(
                                children: [
                                  TableRow(children: [
                                    FittedBox(
                                      child: Text(
                                        'to be paid now'.tr,
                                        style: homePageHeading,
                                      ),
                                    ),
                                    gapW5,
                                    ReUsableText(
                                        text: totalPaid,
                                        textStyle: homePageHeading)
                                  ]),
                                ],
                              ),
                            ),
                            gapH10,
                            Text(
                              "You will pay 10% of the total to reserve the horse, then you will transfer the entire amount to one of the site's bank accounts, and after completing the purchase, the amount will be returned to you."
                                  .tr,
                              textAlign: TextAlign.justify,
                              style: homePageGridHeading,
                            ),
                          ],
                        ),
                      ),
                      gapH15,
                      Obx(
                        () => checkoutController.loading3.value
                            ? Center(
                                child: CircularProgressIndicator(
                                color: Colors.black,
                              ))
                            : ReusablePaymentActionWidget(
                                visaMasterCardPaymentFunction: () {
                                  checkoutController.buyHorse(
                                      checkoutController.userId,
                                      widget.homeModel.data!.user!.id ?? 0,
                                      widget.homeModel.data!.id ?? 0,
                                      "Al Thuqbah Makkah St., Al Thuqbah",
                                      "Dammam City  Bareed Dist., City, Bareed Dist.");
                                },
                                madaPaymentFunction: () {},
                                applePaymentFunction: () {},
                                width: context.width * 0.7,
                                userid: checkoutController.userId,
                                horseid: widget.homeModel.data!.id.toString(),
                                sellerid: widget.homeModel.data!.userId,
                                totalprice: totalPaid,
                                role: 'payment',
                              ),
                      ),
                      gapH15,
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
/*

 */
