import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:obaiah_mobile_app/generated/assets.dart';
import 'package:obaiah_mobile_app/reusable_widgets/reusable_appbar.dart';
import 'package:obaiah_mobile_app/utils/colors/colors.dart';
import 'package:obaiah_mobile_app/utils/constants/custom_error.dart';
import 'package:obaiah_mobile_app/utils/spacing/gaps.dart';
import 'package:obaiah_mobile_app/utils/text_styles/textstyles.dart';

import '../../../../../Payments/fatoorah_Custom.dart';
import '../../../../../reusable_widgets/reusable_payment_action.dart';
import '../../../../../reusable_widgets/reusable_text.dart';
import '../../../../../utils/spacing/padding.dart';
import '../components/wallet_portfoio_components.dart';
import '../controller/wallet_portfolio_controller.dart';

class WalletPortfolioScreen extends StatefulWidget {
  WalletPortfolioScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<WalletPortfolioScreen> createState() => _WalletPortfolioScreenState();
}

class _WalletPortfolioScreenState extends State<WalletPortfolioScreen> {
  final walletPortfolioController = Get.find<WalletPortfolioController>();
  @override
  void initState() {
    walletPortfolioController.getUserId();
    // TODO: implement initState
    super.initState();
    walletPortfolioController.getMyWallet(walletPortfolioController.userId!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: ReusableAppBar(
            titleText: "portfolio",
            textStyle: black718,
            onPressFunction: () {
              Navigator.pop(context);
            }),
        body: Obx(
          () => walletPortfolioController.loading.value
              ? Center(
                  child: CircularProgressIndicator(
                  color: cPrimaryColor,
                ))
              : walletPortfolioController.error.value != ""
                  ? Center(
                      child: Custom_Error(
                          onpressed: () {
                            walletPortfolioController
                                .getMyWallet(walletPortfolioController.userId!);
                          },
                          error: walletPortfolioController.error.value),
                    )
                  // : walletPortfolioController.myWalletModel.data?.length == 0
                  //     ? Center(
                  //         child: NoDataMessage(
                  //         message: "No Data Found",
                  //       ))
                  : Container(
                      padding: padA10,
                      height: context.height * 1,
                      width: context.width * 1,
                      child: Stack(
                        children: [
                          SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Center(
                                  child: Container(
                                    padding: padA20,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      color: cPrimaryColor,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text("your balance is".tr,
                                            style: onyx612),
                                        gapH5,
                                        ReUsableText(
                                            text: walletPortfolioController
                                                .myWalletModel.accountBalance
                                                .toString(),
                                            textStyle: onyx824),
                                      ],
                                    ),
                                  ),
                                ),
                                gapH30,
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    "operations history:".tr,
                                    style: black512,
                                  ),
                                ),
                                Flexible(
                                    child: ListView.separated(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: walletPortfolioController
                                      .myWalletModel.data!.length,
                                  separatorBuilder:
                                      (BuildContext context, int index) =>
                                          gapH20,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    String dateString =
                                        walletPortfolioController
                                            .myWalletModel.data![index].date
                                            .toString();
                                    DateTime dateTime =
                                        DateTime.parse(dateString);
                                    return OperationHistoryTile(
                                        entryType: walletPortfolioController
                                                .myWalletModel
                                                .data![index]
                                                .transactionType ??
                                            "",
                                        date:
                                            "${dateTime.year}-${dateTime.month}-${dateTime.day}",
                                        amount: walletPortfolioController
                                            .myWalletModel.data![index].amount
                                            .toString(),
                                        method: walletPortfolioController
                                                .myWalletModel
                                                .data![index]
                                                .transactionType ??
                                            "");
                                  },
                                )),
                                gapH80,
                              ],
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Expanded(
                                        child: BottomButtonComponent(
                                            assetName: Assets
                                                .walletPortfolioImagesAddIcon,
                                            text: "add",
                                            backGroundColor: cPrimaryColor,
                                            onPressFunction: () {
                                              showDialog(
                                                  context: context,
                                                  builder: (context) =>
                                                      AddAmountDialogg());
                                            }),
                                      ),
                                      gapW30,
                                      Expanded(
                                        child: BottomButtonComponent(
                                            assetName: Assets
                                                .walletPortfolioImagesRevertIcon,
                                            text: "recovery",
                                            backGroundColor: cOnyxColor5Opacity,
                                            onPressFunction: () {
                                              var accountbalance =
                                                  walletPortfolioController
                                                      .myWalletModel
                                                      .accountBalance;
                                              showDialog(
                                                  context: context,
                                                  builder: (context) => AmountRecoveryDialog(
                                                      bankNameController:
                                                          walletPortfolioController
                                                              .bankNameController,
                                                      ibanNoController:
                                                          walletPortfolioController
                                                              .ibanNoController,
                                                      accountBalance:
                                                          accountbalance,
                                                      userid:
                                                          walletPortfolioController
                                                              .userId));
                                            }),
                                      ),
                                    ],
                                  ),
                                  gapH30,
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
        ));
  }
}

class AddAmountDialogg extends StatefulWidget {
  const AddAmountDialogg({
    Key? key,
  }) : super(key: key);

  @override
  State<AddAmountDialogg> createState() => _AddAmountDialoggState();
}

class _AddAmountDialoggState extends State<AddAmountDialogg> {
  TextEditingController _balanceController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final walletPortfolioController = Get.find<WalletPortfolioController>();

    var totalBalance = '';
    return AlertDialog(
        scrollable: true,
        backgroundColor: cScaffoldBackground,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        content: Container(
          // height: 170,
          width: 330,
          decoration: const BoxDecoration(color: cScaffoldBackground),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                "add creditss".tr,
                style: homePageOnyxGridPrice,
              ),
              gapH20,
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _balanceController,
                      onChanged: (value) {
                        totalBalance = value;
                        log('$totalBalance');
                      },
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontFamily: "Tajawal",
                          fontWeight: FontWeight.w700,
                          fontSize: 14),
                      decoration: InputDecoration(
                        filled: true,
                        labelStyle: const TextStyle(
                          fontFamily: "Tajawal",
                          fontWeight: FontWeight.w700,
                          fontSize: 12,
                          color: cOnyxColor,
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        label: Center(child: Text('enter balance'.tr)),
                        fillColor: cWhiteColor,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: BorderSide.none),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter Balance  ';
                        }

                        return null;
                      },
                    ),
                  ),
                  Expanded(
                    child: AmountAdditionBoxComponent(
                        text: walletPortfolioController
                            .myWalletModel.accountBalance
                            .toString(),
                        headerText: "your new balance amount",
                        color: Colors.grey),
                  ),
                ],
              ),
              gapH10,
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconsDisplayCardWidget(
                        onTapFunction: () {
                          Navigator.pop(context);

                          Get.to(() => FatoorahCustom(
                                userid: int.parse(
                                    '${walletPortfolioController.userId}'),
                                horseid: '',
                                sellerid: '',
                                totalprice: _balanceController.text,
                                role: 'addwalet',
                              ));
                        },
                        beforeLogoAssetString: Assets.paymentImagesMadaLogo,
                        afterLogoAssetString: Assets.paymentImagesMadaTextIcon,
                      ),
                      IconsDisplayCardWidget(
                        onTapFunction: () {
                          Navigator.pop(context);
                          //Get.to(() => PaymentScreen());
                          Get.to(() => FatoorahCustom(
                                userid: int.parse(
                                    '${walletPortfolioController.userId}'),
                                horseid: '',
                                sellerid: '',
                                totalprice: _balanceController.text,
                                role: 'addwalet',
                              ));
                        },
                        beforeLogoAssetString: Assets.paymentImagesVisaIcon,
                        afterLogoAssetString:
                            Assets.paymentImagesMasterCardLogo,
                      ),
                    ],
                  ),
                  gapH15,
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);

                      Get.to(() => FatoorahCustom(
                            userid: int.parse(
                                '${walletPortfolioController.userId}'),
                            horseid: '',
                            sellerid: '',
                            totalprice: _balanceController.text,
                            role: 'addwalet',
                          ));
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: cBlackColor,
                        fixedSize: Size(200, 40),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            "assets/images/apple_icon/apple_icon.png",
                            //Assets.appleIconAppleIcon,

                            alignment: Alignment.center,
                          ),
                          gapW5,
                          Text(
                            "Pay",
                            style: TextStyle(
                                fontFamily: "Tajawal",
                                color: cWhiteColor,
                                fontWeight: FontWeight.w800,
                                fontSize: 27),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              // ReusablePaymentActionWidget(
              //     visaMasterCardPaymentFunction: () {},
              //     madaPaymentFunction: () {},
              //     applePaymentFunction: () {},
              //     width: context.width * 0.5,
              //     userid: walletPortfolioController.userId,
              //     horseid: '',
              //     sellerid: '',
              //     totalprice:
              //         walletPortfolioController.amountNoController.text,
              //     role: 'addwalet'),
              gapH15,
              ElevatedButton(
                  onPressed: () {
                    print(_balanceController.text);
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: cRomanSilverColor,
                      shape: const StadiumBorder()),
                  child: Text(
                    "cancel".tr,
                    style: auctionDescriptionBoldTextStyle,
                  ))
            ],
          ),
        ));
  }
}

class IconsDisplayCardWidget extends StatelessWidget {
  final Function()? onTapFunction;
  final String beforeLogoAssetString, afterLogoAssetString;

  const IconsDisplayCardWidget(
      {Key? key,
      required this.onTapFunction,
      required this.beforeLogoAssetString,
      required this.afterLogoAssetString})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapFunction,
      child: Container(
        padding: padA10,
        decoration: BoxDecoration(
            color: cWhiteColor, borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              afterLogoAssetString,
              height: 30,
            ),
            gapW5,
            Image.asset(
              beforeLogoAssetString,
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
