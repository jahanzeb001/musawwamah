import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../../reusable_widgets/reusable_appbar.dart';
import '../../../../reusable_widgets/reusable_text.dart';
import '../../../../utils/colors/colors.dart';
import '../../../../utils/constants/app_urls.dart';
import '../../../../utils/constants/base_client.dart';
import '../../../../utils/constants/custom_error.dart';
import '../../../../utils/constants/no_data_message.dart';
import '../../../../utils/spacing/gaps.dart';
import '../../../../utils/spacing/padding.dart';
import '../../../../utils/text_styles/textstyles.dart';
import '../../../user/settings/wallet_portfolio/components/wallet_portfoio_components.dart';
import '../controller/delivery_wallet_controller.dart';
import 'delivery_controller.dart';

class MyDeliveryWalletScreen extends StatefulWidget {
  var deliveryId;
  MyDeliveryWalletScreen({Key? key, required this.deliveryId})
      : super(key: key);

  @override
  State<MyDeliveryWalletScreen> createState() => _MyDeliveryWalletScreenState();
}

class _MyDeliveryWalletScreenState extends State<MyDeliveryWalletScreen> {
  DeliveryController walletDetailPortfolioController =
      Get.put(DeliveryController());

  @override
  void initState() {
    walletDetailPortfolioController.getMyAccountDetail(widget.deliveryId);
    //walletPortfolioController.getUserId();
    // TODO: implement initState
    super.initState();
    // walletPortfolioController.getMyWallet(walletPortfolioController.userId!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ReusableAppBar(
          titleText: "portfolio2",
          textStyle: black718,
          onPressFunction: () {
            Navigator.pop(context);
          }),
      body: Obx(
        () => walletDetailPortfolioController.loading.value
            ? Center(
                child: CircularProgressIndicator(
                color: cPrimaryColor,
              ))
            : walletDetailPortfolioController.error.value != ""
                ? Center(
                    child: Custom_Error(
                        onpressed: () {
                          walletDetailPortfolioController
                              .getMyAccountDetail(widget.deliveryId);
                        },
                        error: walletDetailPortfolioController.error.value),
                  )
                // : walletPortfolioController.myWalletModel.data?.length == 0
                //     ? Center(
                //         child: NoDataMessage(
                //         message: "No Data Found",
                //       ))
                : SingleChildScrollView(
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text("your balance is".tr, style: onyx612),
                                gapH5,
                                ReUsableText(
                                    text: 'dControllr.userBalance',
                                    textStyle: onyx824),
                              ],
                            ),
                          ),
                        ),
                        gapH30,
                        Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              "operations history:".tr,
                              style: black512,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: Flexible(
                              child: ListView.separated(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: walletDetailPortfolioController
                                .myDeleveryWalletDetailModel.data!
                                .toJson()
                                .length,
                            separatorBuilder:
                                (BuildContext context, int index) => gapH20,
                            itemBuilder: (BuildContext context, int index) {
                              // WidgetsBinding.instance.addPostFrameCallback((_) {
                              //   var total =
                              //       dControllr.userBalance.value + int.parse(amount);
                              //   dControllr.setTotal(total);
                              // });

                              return Container(
                                width: context.width * 1,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                decoration: BoxDecoration(
                                  color: cPrimaryColor24Opacity,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '${walletDetailPortfolioController.myDeleveryWalletDetailModel.data!.date}',
                                          style: black512,
                                        ),
                                        Text(
                                          'via',
                                          style: black512,
                                        ),
                                      ],
                                    ),
                                    gapH10,
                                    ReUsableText(
                                        text: 'amount', textStyle: black824),
                                    gapH2,
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          '',
                                          style: black410,
                                        ),
                                        Text(
                                          '',
                                          style: black410,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            },
                          )),
                        ),
                        gapH80,
                      ],
                    ),
                  ),
      ),

      // ListView.builder(
      //     itemCount: data.length,
      //     itemBuilder: (context, index) {
      //       final transaction = data[index];
      //       final transactionId = transaction['id'];
      //       final amount = transaction['amount'];

      //       return ListTile(
      //         title: Text('Transaction ID: $transactionId'),
      //         subtitle: Text('Amount: $amount'),
      //       );
      //     }),
    );
  }
}
