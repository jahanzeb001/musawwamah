import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:obaiah_mobile_app/reusable_widgets/reusable_text.dart';
import 'package:obaiah_mobile_app/utils/colors/colors.dart';
import 'package:obaiah_mobile_app/utils/spacing/gaps.dart';

import '../../../../../Payments/fatoorah_Custom.dart';
import '../../../../../reusable_widgets/reusable_dropdown_formfield.dart';
import '../../../../../reusable_widgets/reusable_payment_action.dart';
import '../../../../../utils/spacing/padding.dart';
import '../../../../../utils/text_styles/textstyles.dart';
import '../controller/wallet_portfolio_controller.dart';
import '../service/refund_balance.dart';

class OperationHistoryTile extends StatelessWidget {
  final String entryType, date, amount, method;

  const OperationHistoryTile(
      {Key? key,
      required this.entryType,
      required this.date,
      required this.amount,
      required this.method})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width * 1,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: entryType == "credit"
            ? cOnyxColor24Opacity
            : cPrimaryColor24Opacity,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                date.tr,
                style: black512,
              ),
              Text(
                entryType.tr,
                style: black512,
              ),
            ],
          ),
          gapH10,
          ReUsableText(text: amount, textStyle: black824),
          gapH2,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                entryType == "credit" ? "order number #".tr : "via".tr,
                style: black410,
              ),
              Text(
                method,
                style: black410,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class BottomButtonComponent extends StatelessWidget {
  final String assetName;
  final Color? backGroundColor;
  final Function()? onPressFunction;
  final String text;

  const BottomButtonComponent(
      {Key? key,
      required this.assetName,
      required this.text,
      required this.backGroundColor,
      required this.onPressFunction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: SvgPicture.asset(assetName),
      style: ElevatedButton.styleFrom(
          backgroundColor: backGroundColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
      onPressed: onPressFunction,
      label: Text(
        text.tr,
        style: black712,
      ),
    );
  }
}

//Component BidAdditionDialog
class AddAmountDialog extends StatelessWidget {
  final TextEditingController ibanNoController;
  const AddAmountDialog({Key? key, required this.ibanNoController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final walletPortfolioController = Get.find<WalletPortfolioController>();

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
                    child: WalletPortfolioTextFormComponent(
                        text: "enter balance",
                        textController: ibanNoController),
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
              ReusablePaymentActionWidget(
                  visaMasterCardPaymentFunction: () {
                    Navigator.pop(context);
                  },
                  madaPaymentFunction: () {},
                  applePaymentFunction: () {},
                  width: context.width * 0.5,
                  userid: walletPortfolioController.userId,
                  horseid: '',
                  sellerid: '',
                  totalprice: ibanNoController.text.trim(),
                  role: 'addwalet'),
              gapH15,
              ElevatedButton(
                  onPressed: () {
                    print(ibanNoController.text);
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

//Amount Recovery Alert Dialog
class AmountRecoveryDialog extends StatefulWidget {
  final TextEditingController bankNameController;
  final TextEditingController ibanNoController;
  var accountBalance;
  var userid;

  AmountRecoveryDialog({
    required this.bankNameController,
    required this.ibanNoController,
    required this.accountBalance,
    required this.userid,
    Key? key,
  }) : super(key: key);

  @override
  State<AmountRecoveryDialog> createState() => _AmountRecoveryDialogState();
}

class _AmountRecoveryDialogState extends State<AmountRecoveryDialog> {
  TextEditingController amount = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        scrollable: true,
        backgroundColor: cScaffoldBackground,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        content: Form(
          key: _formKey,
          child: Container(
            // height: 170,
            width: 330,
            decoration: const BoxDecoration(color: cScaffoldBackground),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  "refund request".tr,
                  style: homePageOnyxGridPrice,
                ),
                gapH20,
                Row(
                  children: [
                    Expanded(
                      child: AmountAdditionBoxComponent(
                          text: "${widget.accountBalance}",
                          headerText: "current balance",
                          color: Colors.grey.withOpacity(0.5)),
                    ),
                    // Expanded(
                    //   flex: 2,
                    //   child: SizedBox(
                    //     height: 54,
                    //     child: Stack(
                    //       children: [
                    //         Align(
                    //           alignment: Alignment.bottomCenter,
                    //           child: Container(
                    //             height: 50,
                    //             padding: padA10,
                    //             decoration: BoxDecoration(
                    //                 color: cWhiteColor,
                    //                 borderRadius: const BorderRadius.all(
                    //                     Radius.circular(10))),
                    //             child: TextFormField(
                    //               controller: amount,
                    //               textAlign: TextAlign.center,
                    //               style: const TextStyle(
                    //                   fontFamily: "Tajawal",
                    //                   fontWeight: FontWeight.w700,
                    //                   fontSize: 14),
                    //               decoration: InputDecoration(
                    //                 filled: true,
                    //                 labelStyle: const TextStyle(
                    //                   fontFamily: "Tajawal",
                    //                   fontWeight: FontWeight.w700,
                    //                   fontSize: 12,
                    //                   color: cOnyxColor,
                    //                 ),
                    //                 floatingLabelBehavior:
                    //                     FloatingLabelBehavior.always,
                    //                 fillColor: cWhiteColor,
                    //                 border: OutlineInputBorder(
                    //                     borderRadius:
                    //                         BorderRadius.circular(15.0),
                    //                     borderSide: BorderSide.none),
                    //               ),
                    //               validator: (value) {
                    //                 if (value == null || value.isEmpty) {
                    //                   return 'Please enter some amount';
                    //                 }
                    //                 var accountBal =
                    //                     int.parse(widget.accountBalance);
                    //                 var val = int.parse(amount.text);
                    //                 if (accountBal < val) {
                    //                   return 'Enter less then $accountBal';
                    //                 }
                    //                 return null;
                    //               },
                    //             ),
                    //           ),
                    //         ),
                    //         Align(
                    //             alignment: Alignment.topCenter,
                    //             child: Text(
                    //               'the amount to be returned',
                    //               style: homePageGridHeading,
                    //             )),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                    Expanded(
                      flex: 2,
                      child: TextFormField(
                        controller: amount,
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
                          label: Center(
                              child: Text('the amount to be returned'.tr)),
                          fillColor: cWhiteColor,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              borderSide: BorderSide.none),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some amount';
                          }
                          var accountBal = int.parse(widget.accountBalance);
                          var val = int.parse(amount.text);
                          if (accountBal < val) {
                            return 'Enter less then $accountBal';
                          }
                          return null;
                        },
                      ),
                    ),
                    // Expanded(
                    //   child: AmountAdditionBoxComponent(
                    //       text: "500",
                    //       headerText: "the amount to be returned",
                    //       color: cWhiteColor),
                    // ),
                  ],
                ),
                gapH20,
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: ReusableBankDropDownFormField(
                          controller: widget.bankNameController),
                    ),
                    gapW5,
                    Expanded(
                      flex: 2,
                      child: WalletPortfolioTextFormComponent(
                          text: "iban no",
                          textController: widget.ibanNoController),
                    ),
                  ],
                ),
                gapH10,
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        flex: 2,
                        child: WalletAlertDialogButtonComponent(
                          text: "confirm your return request",
                          backGroundColor: cPrimaryColor,
                          onPressedFunction: () {
                            if (_formKey.currentState!.validate()) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Processing Data')),
                              );
                              ReFundBalance.recoverbalance(
                                  widget.bankNameController.text,
                                  widget.ibanNoController.text,
                                  amount.text,
                                  widget.userid);
                            }
                          },
                        ),
                      ),
                      gapW10,
                      Expanded(
                        child: WalletAlertDialogButtonComponent(
                          text: "close",
                          backGroundColor: cRomanSilverColor,
                          onPressedFunction: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

class AmountAdditionBoxComponent extends StatelessWidget {
  final String text;
  final Color color;
  final String headerText;

  const AmountAdditionBoxComponent(
      {Key? key,
      required this.text,
      required this.color,
      required this.headerText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 58,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
                height: 50,
                padding: padA10,
                decoration: BoxDecoration(
                    color: color,
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
                child: ReUsableText(
                  text: text,
                  textStyle: textStyle913,
                )),
          ),
          Align(
              alignment: Alignment.topCenter,
              child: Text(
                headerText.tr,
                style: homePageGridHeading,
              )),
        ],
      ),
    );
  }
}

class WalletAlertDialogButtonComponent extends StatelessWidget {
  final Function()? onPressedFunction;
  final String text;
  final Color backGroundColor;
  bool? loading;

  WalletAlertDialogButtonComponent(
      {Key? key,
      required this.text,
      required this.backGroundColor,
      required this.onPressedFunction,
      this.loading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressedFunction,
        style: ElevatedButton.styleFrom(
            backgroundColor: backGroundColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
        child: FittedBox(
          child: loading == true
              ? SizedBox(
                  height: 25,
                  width: 25,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                )
              : Text(
                  text.tr,
                  style: auctionDescriptionBoldTextStyle,
                ),
        ));
  }
}

class WalletPortfolioTextFormComponent extends StatelessWidget {
  final TextEditingController textController;
  final String text;

  const WalletPortfolioTextFormComponent(
      {Key? key, required this.textController, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textController,
      textAlign: TextAlign.center,
      style: const TextStyle(
          fontFamily: "Tajawal", fontWeight: FontWeight.w700, fontSize: 14),
      decoration: InputDecoration(
        filled: true,
        labelStyle: const TextStyle(
          fontFamily: "Tajawal",
          fontWeight: FontWeight.w700,
          fontSize: 12,
          color: cOnyxColor,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        label: Center(child: Text(text.tr)),
        fillColor: cWhiteColor,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide.none),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Enter IBAN no  ';
        }

        return null;
      },
    );
  }
}
