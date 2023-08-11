import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../reusable_widgets/reusable_appbar.dart';
import '../../../../reusable_widgets/reusable_text.dart';
import '../../../../utils/colors/colors.dart';
import '../../../../utils/constants/custom_error.dart';
import '../../../../utils/spacing/gaps.dart';
import '../../../../utils/spacing/padding.dart';
import '../../../../utils/text_styles/textstyles.dart';
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
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              margin: EdgeInsets.only(left: 10, top: 5),
                              padding: padA20,
                              height: 100,
                              decoration: BoxDecoration(
                                color: cPrimaryColor24Opacity,
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
                                      text:
                                          '${walletDetailPortfolioController.myDeleveryWalletDetailModel.data![0].accountBalance}',
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
                            child: ListView.separated(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: walletDetailPortfolioController
                                  .myDeleveryWalletDetailModel.data!.length,
                              separatorBuilder:
                                  (BuildContext context, int index) => gapH20,
                              itemBuilder: (BuildContext context, int index) {
                                // WidgetsBinding.instance.addPostFrameCallback((_) {
                                //   var total =
                                //       dControllr.userBalance.value + int.parse(amount);
                                //   dControllr.setTotal(total);
                                // });
                                var tranctiontype =
                                    walletDetailPortfolioController
                                        .myDeleveryWalletDetailModel
                                        .data![index]
                                        .transactionType;

                                return tranctiontype != 'credit'
                                    ? Container(
                                        width: context.width * 1,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 10),
                                        decoration: BoxDecoration(
                                          color: cOnyxColor24Opacity,
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  '',
                                                  style: black512,
                                                ),
                                                Text(
                                                  '${walletDetailPortfolioController.myDeleveryWalletDetailModel.data![index].transactionType}',
                                                  style: black512,
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: GestureDetector(
                                                    onTap: () {},
                                                    child: Container(
                                                      padding:
                                                          EdgeInsets.all(10),
                                                      decoration: BoxDecoration(
                                                        color:
                                                            cPrimaryColor, // Set the background color here
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                7), // Set the border radius
                                                      ),
                                                      child: Center(
                                                        child: Text(
                                                          'Transfer image',
                                                          style: black512,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: ReUsableText(
                                                      text:
                                                          '${walletDetailPortfolioController.myDeleveryWalletDetailModel.data![index].amount}',
                                                      textStyle: black824),
                                                ),
                                                Expanded(child: Text('')),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'Order No.',
                                                  style: black410,
                                                ),
                                                Text(
                                                  '#1544208',
                                                  style: black410,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      )
                                    : Container(
                                        width: context.width * 1,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 10),
                                        decoration: BoxDecoration(
                                          color: cPrimaryColor24Opacity,
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  '',
                                                  style: black512,
                                                ),
                                                Text(
                                                  '${walletDetailPortfolioController.myDeleveryWalletDetailModel.data![index].transactionType}',
                                                  style: black512,
                                                ),
                                              ],
                                            ),
                                            gapH10,
                                            ReUsableText(
                                                text:
                                                    '${walletDetailPortfolioController.myDeleveryWalletDetailModel.data![index].amount}',
                                                textStyle: black824),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'Order No.',
                                                  style: black410,
                                                ),
                                                Text(
                                                  '#1544208',
                                                  style: black410,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      );
                              },
                            ),
                          ),
                          gapH80,
                        ],
                      ),
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
