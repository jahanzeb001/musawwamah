import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VeriffyOtp {
  final pinController = TextEditingController();
  final focusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  String userId = '';
  var verId = '';
  int? resendTokenId;
  bool phoneAuthcheck = false;
  dynamic credentials;

  void sendotp(phoneNumber) async {
    FirebaseAuth auth = FirebaseAuth.instance;

    try {
      credentials = null;
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        timeout: const Duration(seconds: 60),
        verificationCompleted: (PhoneAuthCredential credential) async {
          log('completed');
        },
        forceResendingToken: resendTokenId,
        verificationFailed: (FirebaseAuthException e) {
          log('varification failed');
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
      log('varification failed');
    }
  }

  void verifyOTP(String otpNumber) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verId,
        smsCode: otpNumber,
      );
      log('varified');
      // Rest of the code remains the same
      // ...
    } catch (e) {
      // Handle verification failure
      print('Error verifying OTP: ${e.toString()}');
      log('faild otp varification');
    }
  }

  // verifiedOtp(String otpnumber) async {
  //   PhoneAuthCredential credential =
  //       PhoneAuthProvider.credential(verificationId: verId, smsCode: otpnumber);
  //   log('Logedin');
  //   Get.snackbar(
  //     'success'.tr,
  //     'successfullyloggedin'.tr,
  //     snackPosition: SnackPosition.BOTTOM,
  //   );
  // }
}
