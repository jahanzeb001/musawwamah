import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import '../screens/user/home/home/view/home_screen_view.dart';
import '../utils/colors/colors.dart';
import '../utils/spacing/gaps.dart';
import 'firebase_services.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

FirebaseService service = FirebaseService();

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String userId = '';
  var verId = '';
  int? resendTokenId;
  bool phoneAuthcheck = false;
  dynamic credentials;

  void sendOTP() async {
    String phone = '+92' + email.text;
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phone,
      timeout: const Duration(seconds: 60),
      codeSent: (verificationId, resendToken) {
        log('Code send');
        Get.snackbar(
          'success'.tr,
          'codesent'.tr,
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.white,
        );
        mycustomAlert('+92' + email.text, verificationId);
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
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.indigo,
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

  // final countryPicker = const FlCountryCodePicker();
  // CountryCode counterycode =
  //     const CountryCode(name: 'Pakistan', code: "PK", dialCode: "+92");
  bool isLoading = false;
  // void sendotp(number) async {
  //   try {
  //     credentials = null;
  //     await FirebaseAuth.instance.verifyPhoneNumber(
  //       phoneNumber: number,
  //       timeout: const Duration(seconds: 60),
  //       verificationCompleted: (PhoneAuthCredential credential) async {
  //         log('completed');
  //         credentials = credential;
  //         await FirebaseAuth.instance.signInWithCredential(credential);
  //       },
  //       forceResendingToken: resendTokenId,
  //       verificationFailed: (FirebaseAuthException e) {
  //         log('failed');
  //         if (e.code == 'invalid-phone-number') {
  //           log('invalid phone number');
  //         }
  //       },
  //       codeSent: (String verificationId, int? resendToken) async {
  //         log('Code send');
  //         verId = verificationId;
  //         resendTokenId = resendToken;
  //       },
  //       codeAutoRetrievalTimeout: (String verificationId) {},
  //     );
  //   } catch (e) {
  //     log("Error Eccoured $e");
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 100),
              const CircleAvatar(
                backgroundColor: Colors.white,
                radius: 70,
                child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 60,
                    child: Icon(Icons.face)),
              ),
              const SizedBox(height: 10),
              //Image.asset('images/google1.png'),
              const Text(
                'Well Come Here ',
                style: TextStyle(fontSize: 25, color: Colors.white),
              ),
              const SizedBox(height: 30.0),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    // Container(
                    // height: 65,
                    // decoration: BoxDecoration(
                    // borderRadius: BorderRadius.circular(8),
                    // color: Colors.white,
                    // boxShadow: [
                    // BoxShadow(
                    // color: Colors.black12.withOpacity(0.5),
                    // spreadRadius: 3,
                    // blurRadius: 3,
                    // ),
                    // ],
                    // ),
                    // padding: const EdgeInsets.only(
                    // left: 15, top: 5, bottom: 5, right: 5),
                    // child: TextFormField(
                    // validator: (value) {
                    // if (value!.isEmpty) {
                    // return 'please enter email';
                    // }
                    // return null;
                    // },
                    // keyboardType: TextInputType.emailAddress,
                    // controller: phone,
                    // decoration: const InputDecoration(
                    // hintText: "Enter email",
                    // hintStyle: TextStyle(
                    // color: Colors.black45,
                    // fontSize: 18,
                    // ),
                    // border: InputBorder.none,
                    // ),
                    // ),
                    // ),
                    // const SizedBox(height: 10),
                    // Container(
                    // height: 65,
                    // decoration: BoxDecoration(
                    // borderRadius: BorderRadius.circular(8),
                    // color: Colors.white,
                    // boxShadow: [
                    // BoxShadow(
                    // color: Colors.black12.withOpacity(0.5),
                    // spreadRadius: 3,
                    // blurRadius: 3,
                    // ),
                    // ],
                    // ),
                    // padding: const EdgeInsets.only(
                    // left: 15, top: 5, bottom: 5, right: 5),
                    // child: TextFormField(
                    // validator: (value) {
                    // if (value!.isEmpty) {
                    // return 'please enter your password';
                    // }
                    // return null;
                    // },
                    // keyboardType: TextInputType.phone,
                    // controller: password,
                    // decoration: const InputDecoration(
                    // hintText: "Enter password",
                    // hintStyle: TextStyle(
                    // color: Colors.black45,
                    // fontSize: 18,
                    // ),
                    // border: InputBorder.none,
                    // ),
                    // ),
                    // ),
                    // const SizedBox(height: 10),
                    Container(
                      height: 65,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.indigoAccent.withOpacity(0.5),
                            spreadRadius: 3,
                            blurRadius: 3,
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          // Expanded(
                          //   flex: 1,
                          //   child: InkWell(
                          //     onTap: () async {
                          //       final code = await countryPicker.showPicker(
                          //           context: context);
                          //       if (code != null) counterycode = code;
                          //       setState(() {});
                          //     },
                          //     child: Row(
                          //       children: [
                          //         const SizedBox(width: 2),
                          //         Expanded(
                          //             child: Container(
                          //           child: counterycode.flagImage,
                          //         )),
                          //         const SizedBox(width: 5),
                          //         Text(
                          //           counterycode.dialCode,
                          //           style:
                          //               const TextStyle(color: Colors.black45),
                          //         ),
                          //         const SizedBox(width: 5),
                          //         const Icon(Icons.expand_more,
                          //             color: Colors.black45),
                          //       ],
                          //     ),
                          //   ),
                          // ),
                          Container(
                            width: 1,
                            height: 65,
                            color: Colors.black12,
                          ),
                          Expanded(
                            flex: 3,
                            child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              child: TextFormField(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'pleaseenterphonenumber'.tr;
                                  }
                                  return null;
                                },
                                keyboardType: TextInputType.phone,
                                controller: email,
                                decoration: const InputDecoration(
                                  hintText: "Enter phone number",
                                  hintStyle: TextStyle(
                                    color: Colors.black45,
                                    fontSize: 18,
                                  ),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15.0),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: TextButton(
                        style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.all(
                            Colors.indigo,
                          ),
                          backgroundColor: MaterialStateProperty.all(
                            Colors.white,
                          ),
                        ),
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            //registerNewUser(context);
                            // Get.to(() =>
                            //     PinputExample(number: '+92' + email.text));
                            sendOTP();

                            // Get.snackbar(
                            //   'Error',
                            //   'No SMS Key Available',
                            //   colorText: Colors.white,
                            //   snackPosition: SnackPosition.BOTTOM,
                            //   backgroundColor: Colors.indigo,
                            // );
                          }
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(Icons.phone),
                            SizedBox(width: 8),
                            Text(
                              'Login With Phone',
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    // SizedBox(
                    //   width: double.infinity,
                    //   height: 50,
                    //   child: ElevatedButton(
                    //     style: ButtonStyle(
                    //       foregroundColor: MaterialStateProperty.all(
                    //         Colors.indigo,
                    //       ),
                    //       backgroundColor: MaterialStateProperty.all(
                    //         Colors.white,
                    //       ),
                    //     ),
                    //     child: Row(
                    //       mainAxisAlignment: MainAxisAlignment.center,
                    //       children: [
                    //         isLoading == true
                    //             ? Container(
                    //                 padding: const EdgeInsets.all(5),
                    //                 child: const CircularProgressIndicator(
                    //                     color: Colors.indigo),
                    //               )
                    //             : Icon(Icons.add_a_photo),
                    //         const SizedBox(width: 8),
                    //         const Text('Login With Google'),
                    //       ],
                    //     ),
                    //     onPressed: () async {
                    //       setState(() {
                    //         isLoading = true;
                    //       });
                    //       try {} catch (e) {
                    //         if (e is FirebaseAuthException) {
                    //           // ignore: avoid_print
                    //           print(e.message!);
                    //         }
                    //       }
                    //       setState(() {
                    //         isLoading = false;
                    //       });
                    //     },
                    //   ),
                    // ),

                    const SizedBox(height: 5),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  void registerNewUser(BuildContext context) async {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return CircularProgressIndicator();
        });
    try {
      final credential = (await _firebaseAuth.createUserWithEmailAndPassword(
        email: phone.text,
        password: password.text,
      ))
          .user;
      if (credential != null) {
        log('Congratulation user successfuly created');

        // ignore: use_build_context_synchronously
        Navigator.pop(context);

        // ignore: use_build_context_synchronously
        // Navigator.of(context).pushAndRemoveUntil(
        //     MaterialPageRoute(builder: (context) => const HomePage()),
        //     (Route<dynamic> route) => false);
      } else {}
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        log('weak password please enter strong password');
        Navigator.pop(context);
      } else if (e.code == 'email-already-in-use') {
        log('The account already exists for that email.');
        Navigator.pop(context);
      }
    } catch (e) {
      log('$e');
      Navigator.pop(context);
    }
  }

  Future mycustomAlert(number, verid) {
    log('alertcall');
    final pinController = TextEditingController();
    final focusNode = FocusNode();
    GlobalKey<FormState> otpformKey = GlobalKey<FormState>();

    Future<bool> verifyOTP(String otp) async {
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
            backgroundColor: Colors.white,
          );
          // OTP verification successful
          Get.offAll(const HomeScreenView());
          return true;
        } else {
          Get.snackbar(
            'errorwrongotp'.tr,
            'pleaseentercorrectotp'.tr,
            colorText: Colors.white,
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.indigo,
          );
          // OTP verification failed
          return false;
        }
      } catch (e) {
        Get.snackbar(
          'errorwrongotp'.tr,
          'failedloggedin'.tr,
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.white,
        );
        // Error occurred during OTP verification
        print('Error verifying OTP: $e');
        return false;
      }
    }

    // verifiedOtp(String otpnumber) async {
    //   log('verifiedOtp call');
    //   PhoneAuthCredential credential = PhoneAuthProvider.credential(
    //       verificationId: verid, smsCode: otpnumber);
    //   // log('Logedin');
    //   // Get.snackbar(
    //   //   'Success',
    //   //   'Successfully loged in',
    //   //   colorText: Colors.white,
    //   //   snackPosition: SnackPosition.BOTTOM,
    //   //   backgroundColor: Colors.indigo,
    //   // );
    //   UserCredential checkstatus =
    //       await FirebaseAuth.instance.signInWithCredential(credential);

    //   //myservices.deciderout(context);

    //   //Get.offAll(const HomeScreenView());

    //   if (checkstatus == true) {
    //     log('success');
    //     setState(() {});
    //   } else {
    //     setState(() {});
    //     log('fail');
    //   }
    //   log('your status   ${checkstatus}');
    // }

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
    const focusedBorderColor = Colors.white;
    const fillColor = Color.fromRGBO(243, 246, 249, 0);
    const borderColor = Colors.white;
    return Get.defaultDialog(
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Text(
              //   'Please Check Your Number For SMS Code ',
              //   style: const TextStyle(fontSize: 20, color: Colors.white),
              // ),
              // const SizedBox(height: 10),
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
                    onClipboardFound: (value) {
                      debugPrint('onClipboardFound: $value');
                      pinController.setText(value);
                    },
                    hapticFeedbackType: HapticFeedbackType.lightImpact,
                    onCompleted: (pin) {
                      debugPrint('onCompleted: $pin');
                      verifyOTP(pin);
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
    ]));
  }
}
