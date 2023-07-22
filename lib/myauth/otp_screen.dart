import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

import '../screens/user/home/home/view/home_screen_view.dart';
import '../utils/colors/colors.dart';

// ignore: must_be_immutable
class PinputExample extends StatefulWidget {
  String number;
  PinputExample({Key? key, required this.number}) : super(key: key);

  @override
  State<PinputExample> createState() => _PinputExampleState();
}

class _PinputExampleState extends State<PinputExample> {
  // FirebaseService myservices = FirebaseService();
  final pinController = TextEditingController();
  final focusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  @override
  void initState() {
    sendotp();
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    pinController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  String userId = '';
  var verId = '';
  int? resendTokenId;
  bool phoneAuthcheck = false;
  dynamic credentials;
  void sendotp() async {
    try {
      credentials = null;
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: widget.number,
        timeout: const Duration(seconds: 60),
        verificationCompleted: (PhoneAuthCredential credential) async {
          log('completed');
          credentials = credential;
          await FirebaseAuth.instance.signInWithCredential(credential);
        },
        forceResendingToken: resendTokenId,
        verificationFailed: (FirebaseAuthException e) {
          log('failed');
          if (e.code == 'invalid-phone-number') {
            log('invalid phone number');
          }
        },
        codeSent: (String verificationId, int? resendToken) async {
          log('Code send');
          verId = verificationId;
          resendTokenId = resendToken;
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    } catch (e) {
      log("Error Eccoured $e");
    }
  }

  verifiedOtp(String otpnumber) async {
    PhoneAuthCredential credential =
        PhoneAuthProvider.credential(verificationId: verId, smsCode: otpnumber);
    log('Logedin');
    Get.snackbar(
      'success'.tr,
      'successfullyloggedin'.tr,
      snackPosition: SnackPosition.BOTTOM,
    );
    await FirebaseAuth.instance
        .signInWithCredential(credential)
        .whenComplete(() {
      setState(() {
        //myservices.islogin = true;
      });
      //myservices.deciderout(context);
      Get.offAll(const HomeScreenView());
    });
  }

  @override
  Widget build(BuildContext context) {
    const focusedBorderColor = Colors.white;
    const fillColor = Color.fromRGBO(243, 246, 249, 0);
    const borderColor = Colors.white;

    final defaultPinTheme = PinTheme(
      height: 50,
      width: 335,
      textStyle: const TextStyle(
          fontFamily: "Tajawal",
          fontSize: 30,
          fontWeight: FontWeight.w700,
          color: cBlackColor),
      decoration: const BoxDecoration(color: cScaffoldBackground),
    );

    /// Optionally you can use form to validate the Pinput
    return Scaffold(
      backgroundColor: cScaffoldBackground,
      body: SafeArea(
        child: Column(children: [
          FittedBox(
            child: Text(
              "please enter the verification code sent to the number ${widget.number}"
                  .tr,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontFamily: "Tajawal",
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                  color: cBlackColor),
            ),
          ),
          Center(
            child: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Please Check Your Number For SMS Code ',
                      style: const TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Directionality(
                        // Specify direction if desired
                        textDirection: TextDirection.ltr,

                        child: Pinput(
                          controller: pinController,
                          length: 6,

                          focusNode: focusNode,
                          androidSmsAutofillMethod:
                              AndroidSmsAutofillMethod.smsUserConsentApi,
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
                            verifiedOtp(pin);
                          },
                          onChanged: (value) {
                            debugPrint('onChanged: $value');
                          },
                          cursor: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(bottom: 9),
                                width: 22,
                                height: 1,
                                color: focusedBorderColor,
                              ),
                            ],
                          ),
                          focusedPinTheme: defaultPinTheme.copyWith(
                            decoration: defaultPinTheme.decoration!.copyWith(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: focusedBorderColor),
                            ),
                          ),
                          submittedPinTheme: defaultPinTheme.copyWith(
                            decoration: defaultPinTheme.decoration!.copyWith(
                              color: fillColor,
                              borderRadius: BorderRadius.circular(19),
                              border: Border.all(color: focusedBorderColor),
                            ),
                          ),
                          errorPinTheme: defaultPinTheme.copyBorderWith(
                            border: Border.all(color: Colors.redAccent),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
