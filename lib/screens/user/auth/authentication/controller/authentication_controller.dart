import 'dart:async';
import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:obaiah_mobile_app/reusable_widgets/reusable_alertDialog.dart';
import 'package:obaiah_mobile_app/screens/user/auth/authentication/model/login_model.dart';
import 'package:obaiah_mobile_app/screens/user/auth/authentication/model/signup_model.dart';
import 'package:obaiah_mobile_app/screens/user/auth/authentication/services/auth_service.dart';
import 'package:obaiah_mobile_app/screens/user/auth/authentication/view/login.dart';
import 'package:obaiah_mobile_app/screens/user/home/home/view/home_screen_view.dart';
import 'package:obaiah_mobile_app/utils/colors/colors.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
import 'package:pinput/pinput.dart';
import '../../../../../utils/spacing/gaps.dart';

class AuthenticationController extends GetxController {
  TextEditingController mobileFieldController = TextEditingController();
  OtpFieldController otpController = OtpFieldController();
  RxBool loading = false.obs;
  RxString error = "".obs;
  RxBool isPhoneValid = false.obs;
  BuildContext? buildContext;
  var signupModel = SignUpResponse();
  final box = GetStorage();

  changeLanguage({required String languageCode, required String countryCode}) {
    var locale = Locale(languageCode, countryCode);
    Get.updateLocale(locale);
    log("Changing Language");
  }

  @override
  void onClose() {
    log('disposing controllers');
    mobileFieldController.dispose();

    super.onClose();
  }

  //////////////////check phone is valid or not

  bool isMobileValid(String value) {
    String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = RegExp(patttern);
    if (!regExp.hasMatch(value)) {
      isPhoneValid.value = false;
      return false;
    } else {
      isPhoneValid.value = true;
      return true;
    }
  }

  bool isMobileValidd(String phoneNumber) {
    // Define regex pattern for phone number validation with country code
    final pattern = r'^0\d{9}$'; // Matches 0 followed by 9 digits

    // Check if the phone number matches the pattern and has a valid length
    return RegExp(pattern).hasMatch(phoneNumber) &&
        phoneNumber.length == 10; // Phone number should have 10 digits
  }

  ///////////////////////validate phone

  ////////////////////login
  RxBool verifyingPhone = false.obs;
  RxString errorVerifyingPhone = "".obs;
  var loginModel = LoginResponse();

  void validatePhone(
    String phone,
  ) async {
    errorVerifyingPhone.value = "";
    verifyingPhone.value = true;

    if (isMobileValid(phone)) {
      var res = await AuthService.login(phone);
      verifyingPhone.value = false;

      if (res is LoginResponse) {
        loginModel = res;
        if (res.message.toString() == "NO user found") {
          Get.snackbar(
            'error'.tr,
            'failedloggedin'.tr,
            snackPosition: SnackPosition.TOP,
          );
        }
        saveUserData(
            loginModel.data!.user?.id ?? 0,
            int.parse(loginModel.data!.user?.accountBalance.toString() ?? ""),
            loginModel.data!.deliveryAccount!.id ?? 0,
            loginModel.data!.deliveryAccount!.fullname);

        loginModel.message == "No user found" ? null : verifyPhone(phone);

        // Get.snackbar("Message", loginModel.message.toString(),
        //     colorText: Colors.black, backgroundColor: cPrimaryColor);

        // showDialog(
        //    context: context,
        //    builder: (BuildContext context) {
        //      return CustomAlertDialog(
        //        onPressFunction: () {
        //          Navigator.pop(context);
        //          Navigator.pushNamed(context, homeScreen);
        //        },
        //        phoneNumber: mobileFieldController.text,
        //        otpController: otpController,
        //      );
        //    });
      } else {
        verifyingPhone.value = false;

        errorVerifyingPhone.value = res.toString();
      }
    } else {
      Get.snackbar(
        'error'.tr,
        'pleaseentervalidphonenumber'.tr,
        snackPosition: SnackPosition.TOP,
      );
      //errorVerifyingPhone.value = 'Please enter valid phone number';
      verifyingPhone.value = false;
    }
  }

  /////////////////////////////////////////
  void Signup(
    String phone,
  ) async {
    error.value = "";
    loading.value = false;
    var res = await AuthService.signup(phone);
    if (res is SignUpResponse) {
      signupModel = res;
      saveUserData(
          signupModel.data!.user!.id ?? 0,
          int.parse(signupModel.data?.user?.accountBalance.toString() ?? ""),
          signupModel.data!.deliveryAccount!.id ?? 0,
          signupModel.data!.deliveryAccount!.fullname);
      if (isMobileValid(phone)) {
        verifyPhone(phone);
        // Get.snackbar("notification".tr, "sending otp");
        Get.off(() => LoginScreen(),
            duration: Duration(milliseconds: 600),
            transition: Transition.rightToLeft);
        saveLogin(true);
        // Get.snackbar("Message", signupModel.message.toString(),
        //     colorText: Colors.black, backgroundColor: cPrimaryColor);
      } else {
        Get.snackbar(
          'Error',
          'please enter phone number',
          snackPosition: SnackPosition.TOP,
        );
        //errorVerifyingPhone.value = "please enter phone number";
      }

      // showDialog(
      //     context: BuildContext,
      //     builder: (BuildContext context) {
      //       return CustomAlertDialog(
      //         onPressFunction: () {
      //           Navigator.pop(context);
      //           Navigator.pushNamed(context, homeScreen);
      //         },
      //         phoneNumber: mobileFieldController.text,
      //         otpController: otpController,
      //       );
      //});
    } else {
      loading.value = true;
      error.value = res.toString();
      Get.snackbar("Message", error.value,
          colorText: Colors.black, backgroundColor: cPrimaryColor);
    }
  }

///////////////////to save user id to shared prefrences
  void saveUserData(
      int userId, int accBalance, int deliveryPersonId, String? username) {
    final box = GetStorage();
    box.write('userId', userId);
    box.write('accbal', accBalance);
    box.write('delPerId', deliveryPersonId);

    box.write('username', username);

    // box.write('logincount', '0');

    print("*****************************$userId");
  }

  saveLogin(bool val) {
    final box = GetStorage();
    box.write('isLogin', val);
    "************************${box.read("isLogin")}";
    // box.write('logincount', '1');
  }

  ////////////////////////firebase auth////////////////////////////

  firebase_auth.FirebaseAuth _auth = firebase_auth.FirebaseAuth.instance;
  bool isUserSignedIn = false;
  RxBool resending = false.obs;
  int? resendToken;
  String? verificationId;
  String verificationid = '';
  dynamic credentials;

  void signOut() {
    // SharedPrefUtils.clearfun();
    // SessionController().clearData();
    _auth.signOut();

    Get.offAll(() => LoginScreen());
    // if (countries.length == 0) getCountyList();
  }

  void verifyPhone(String phone) {
    print('verifying phone ...');
    verifyingPhone.value = true;
    sendOTP(phone);
    // _auth.verifyPhoneNumber(
    //   phoneNumber: "$phone",
    //   verificationCompleted: _onVerificationCompleted,
    //   verificationFailed: _onVerificationFailed,
    //   codeSent: _onCodeSent,
    //   codeAutoRetrievalTimeout: _onCodeAutoRetrievalTimeout,
    // );
  }

  //////////////my code otp///
  void sendOTP(phon) async {
    log('verifying');
    verifyingPhone.value = true;
    String phone = phon;
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phone,
        timeout: const Duration(seconds: 60),
        codeSent: (verificationId, resendToken) {
          verifyingPhone.value = false;
          verificationid = verificationId;
          this.resendToken = resendToken;
          log('Code send');
          Get.snackbar(
            'success'.tr,
            'codesent'.tr,
            snackPosition: SnackPosition.TOP,
          );
          mycustomAlert(phone, verificationId);
        },
        verificationCompleted: (PhoneAuthCredential credential) async {
          verifyingPhone.value = false;
          resending.value = false;

          credentials = credential;
          await FirebaseAuth.instance.signInWithCredential(credential);
          log('completed');
          Get.snackbar(
            'Success',
            'Completed',
            snackPosition: SnackPosition.TOP,
          );
        },
        verificationFailed: _onVerificationFailed,
        codeAutoRetrievalTimeout: _onCodeAutoRetrievalTimeout,
        forceResendingToken: resendToken);
  }

  Future mycustomAlert(number, verid) {
    log('alertcall');
    final pinController = OtpFieldController();
    var varifyotp = '';

    GlobalKey<FormState> otpformKey = GlobalKey<FormState>();

    Future verifyOTP(String otp) async {
      try {
        final credential = PhoneAuthProvider.credential(
          verificationId: verid,
          smsCode: otp,
        );

        final authResult =
            await FirebaseAuth.instance.signInWithCredential(credential);

        if (authResult.user != null) {
          Get.snackbar(
            'success'.tr,
            'successfullyloggedin'.tr,
            snackPosition: SnackPosition.TOP,
          );
          // OTP verification successful
          Get.offAll(const HomeScreenView());
          return true;
        } else {
          Get.snackbar(
            'errorwrongotp'.tr,
            'pleaseentercorrectotp'.tr,
            colorText: Colors.white,
            snackPosition: SnackPosition.TOP,
          );
          // OTP verification failed
        }

        print('otp verified');
        saveLogin(true);
      } catch (e) {
        Get.snackbar(
          'errorwrongotp'.tr,
          'failedloggedin'.tr,
          snackPosition: SnackPosition.TOP,
        );
        // Error occurred during OTP verification
        print('Error verifying OTP: $e');
      }
    }

    final defaultPinTheme = PinTheme(
      height: 40,
      width: 335,
      textStyle: const TextStyle(
          fontFamily: "Tajawal",
          fontSize: 30,
          fontWeight: FontWeight.w700,
          color: cBlackColor),
      decoration: const BoxDecoration(color: cScaffoldBackground),
    );

    return Get.defaultDialog(
        barrierDismissible: false,
        // cancel: Icon(Icons.close),
        title: '',
        titlePadding: EdgeInsets.all(0),
        contentPadding:
            EdgeInsets.only(top: 0, left: 15, right: 15, bottom: 10),
        content: Column(children: [
          FittedBox(
            child: Text(
              "please enter the verification code sent to the number".tr,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontFamily: "Tajawal",
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                  color: cBlackColor),
            ),
          ),
          Text(
            number,
            style: const TextStyle(
                fontFamily: "Tajawal",
                fontWeight: FontWeight.w700,
                fontSize: 14,
                color: cBlackColor),
            textAlign: TextAlign.center,
          ),
          gapH15,
          Center(
              child: Form(
                  key: otpformKey,
                  child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Directionality(
                          textDirection: TextDirection.ltr,
                          child: OTPTextField(
                            controller: pinController,
                            length: 6,
                            width: Get.width,
                            fieldWidth: 35,
                            fieldStyle: FieldStyle.box,
                            style: const TextStyle(
                                fontFamily: "Tajawal",
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: cBlackColor),
                            textFieldAlignment: MainAxisAlignment.center,
                            otpFieldStyle: OtpFieldStyle(
                                backgroundColor: Colors.white.withOpacity(0.7)),
                            keyboardType: TextInputType.number,
                            onCompleted: (pin) {
                              log("Completed: $pin!");
                            },
                            onChanged: (pin) {
                              varifyotp = pin;
                              log("varifyotp pinn $varifyotp");
                            },
                          ),
                        ),
                        gapH15,
                        Container(
                          padding: EdgeInsets.all(15),
                          child: OutlinedButton(
                              style: ElevatedButton.styleFrom(
                                shadowColor: cPrimaryColor,
                                foregroundColor: cPrimaryColor,
                                fixedSize: Size(Get.size.width, 55),
                                side: const BorderSide(color: cBlackColor),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                elevation: 0.0,
                              ),
                              onPressed: () {
                                verifyOTP(varifyotp);
                              },
                              child: Text("realization".tr,
                                  style: const TextStyle(
                                      fontFamily: "Tajawal",
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16,
                                      color: cBlackColor))),
                        ),
                      ])))
        ]));
  }

  void resendCode(String phone) {
    print('resending code ...');
    resending.value = true;
    _auth.verifyPhoneNumber(
        phoneNumber: "$phone",
        verificationCompleted: _onVerificationCompleted,
        verificationFailed: _onVerificationFailed,
        codeSent: _onCodeResent,
        codeAutoRetrievalTimeout: _onCodeAutoRetrievalTimeout,
        forceResendingToken: resendToken);
  }

  void signInWithPhoneNumber(String code) async {
    print('verifying code ...');
    verifyingPhone.value = true;
    try {
      firebase_auth.PhoneAuthCredential credential =
          firebase_auth.PhoneAuthProvider.credential(
              verificationId: verificationId!, smsCode: code);
      await _auth.signInWithCredential(credential);
      print('otp verified');
      saveLogin(true);
      Get.offNamedUntil('/homeScreen', (route) => false);
      //Get.offAll(() => HomeScreenView());
      verifyingPhone.value = false;
    } on firebase_auth.FirebaseAuthException catch (e) {
      verifyingPhone.value = false;
      handleException(e.code);
      print('Verification Failed: ${e.code}');
    } catch (e) {}
  }

  void _onVerificationCompleted(
      firebase_auth.PhoneAuthCredential credential) async {
    verifyingPhone.value = false;
    resending.value = false;
    print('_onVerificationCompleted VerificationCompleted ');
    Get.offNamedUntil('/homeScreen', (route) => false);
    //Get.offAll(() => HomeScreenView());
    // Get.offAll(() => SelectRoleScreen());
    verifyingPhone.value = false;
  }

  void _onVerificationFailed(firebase_auth.FirebaseAuthException exception) {
    handleException(exception.code);
    verifyingPhone.value = false;
    resending.value = false;
    print('Verification Failed: ${exception.code}');
  }

  void _onCodeSent(String vId, int? resendToken) {
    verifyingPhone.value = false;
    verificationId = vId;
    this.resendToken = resendToken;
    print('Code Sent');
    showDialog(
        context: buildContext!,
        builder: (BuildContext context) {
          return CustomAlertDialog(
            onPressFunction: () {
              signInWithPhoneNumber(otpController.toString());
              Navigator.pop(context);
              //Navigator.pushNamed(context, homeScreen);
              Get.offNamedUntil('/homeScreen', (route) => false);
              //Get.offAll(const HomeScreenView());
            },
            phoneNumber: mobileFieldController.text,
            otpController: otpController,
          );
        });
  }

  void _onCodeResent(String vId, int? resendToken) {
    resending.value = false;
    verificationId = vId;
    this.resendToken = resendToken;
    print('Code Sent');
  }

  void _onCodeAutoRetrievalTimeout(String verificationId) {
    verificationId = verificationId;
    print('Code Auto Retrieval Timedout');
  }

  void handleException(String _errorCode) {
    switch (_errorCode) {
      case 'invalid-phone-number':
        errorVerifyingPhone.value = 'Invalid Phone Number';
        break;
      case 'network-request-failed':
        errorVerifyingPhone.value = 'No Internet Connection';
        break;
      case 'too-many-requests':
        errorVerifyingPhone.value = 'Too Many Requests';
        break;
      case 'invalid-verification-code':
        Timer(Duration(seconds: 2), () {
          errorVerifyingPhone.value = "";
        });
        errorVerifyingPhone.value = 'Invalid OTP';
        break;
      default:
        errorVerifyingPhone.value = 'Phone Number Verification Failed';
    }
  }
}
