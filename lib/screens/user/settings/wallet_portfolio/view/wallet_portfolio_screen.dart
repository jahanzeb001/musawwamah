import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:obaiah_mobile_app/generated/assets.dart';
import 'package:obaiah_mobile_app/reusable_widgets/reusable_appbar.dart';
import 'package:obaiah_mobile_app/utils/colors/colors.dart';
import 'package:obaiah_mobile_app/utils/constants/custom_error.dart';
import 'package:obaiah_mobile_app/utils/spacing/gaps.dart';
import 'package:obaiah_mobile_app/utils/text_styles/textstyles.dart';

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
                                                  builder: (context) => AddAmountDialog(
                                                      ibanNoController:
                                                          walletPortfolioController
                                                              .bankNameController));
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
