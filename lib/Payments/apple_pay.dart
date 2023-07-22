// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myfatoorah_flutter/embeddedapplepay/MFApplePayButton.dart';
import 'package:myfatoorah_flutter/myfatoorah_flutter.dart';
import 'package:myfatoorah_flutter/utils/MFCountry.dart';
import 'package:myfatoorah_flutter/utils/MFEnvironment.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

final String mAPIKey =
    "rLtt6JWvbUHDDhsZnfpAhpYk4dxYDQkbcPTyGaKp2TYqQgG7FGZ5Th_WD53Oq8Ebz6A53njUoo1w3pjU1D4vs_ZMqFiz_j0urb_BH9Oq9VZoKFoJEDAbRZepGcQanImyYrry7Kt6MnMdgfG5jn4HngWoRdKduNNyP4kzcp3mRv7x00ahkm9LAK7ZRieg7k1PDAnBIOG3EyVSJ5kK4WLMvYr7sCwHbHcu4A5WwelxYK0GMJy37bNAarSJDFQsJ2ZvJjvMDmfWwDVFEVe_5tOomfVNt6bOg9mexbGjMrnHBnKnZR1vQbBtQieDlQepzTZMuQrSuKn-t5XZM7V6fCW7oP-uXGX-sMOajeX65JOf6XVpk29DP6ro8WTAflCDANC193yof8-f5_EYY-3hXhJj7RBXmizDpneEQDSaSz5sFk0sV5qPcARJ9zGG73vuGFyenjPPmtDtXtpx35A-BVcOSBYVIWe9kndG3nclfefjKEuZ3m4jL9Gg1h2JBvmXSMYiZtp9MR5I6pvbvylU_PP5xJFSjVTIz7IQSjcVGO41npnwIxRXNRxFOdIUHn0tjQ-7LwvEcTXyPsHXcMD8WtgBh-wxR8aKX7WPSsT1O8d8reb2aR7K3rkV3K82K_0OgawImEpwSvp9MNKynEAJQS6ZHe_J_l77652xwPNxMRTMASk1ZsJL";

class ApplePay extends StatefulWidget {
  @override
  State<ApplePay> createState() => _ApplePayState();
}

class _ApplePayState extends State<ApplePay> {
  String _response = '';

  void initState() {
    super.initState();

    if (mAPIKey.isEmpty) {
      setState(() {
        _response =
            "Missing API Token Key.. You can get it from here: https://myfatoorah.readme.io/docs/test-token";
      });
      return;
    }

    // TODO, don't forget to init the MyFatoorah Plugin with the following line
    MFSDK.init(mAPIKey, MFCountry.KUWAIT, MFEnvironment.TEST);
    initiateSession();
    // (Optional) un comment the following lines if you want to set up properties of AppBar.

//    MFSDK.setUpAppBar(
//      title: "MyFatoorah Payment",
//      titleColor: Colors.white,  // Color(0xFFFFFFFF)
//      backgroundColor: Colors.lightBlue, // Color(0xFF000000)
//      isShowAppBar: true); // For Android platform only

    // (Optional) un comment this line, if you want to hide the AppBar.
    // Note, if the platform is iOS, this line will not affected

    MFSDK.setUpAppBar(isShowAppBar: false);
  }

  MFApplePayButton? mfApplePayButton;
  createApplePayButton() {
    mfApplePayButton = MFApplePayButton();
    return mfApplePayButton;
  }

  void initiateSession() {
    /**
      * If you want to use saved card option with embedded payment, send the parameter
      * "customerIdentifier" with a unique value for each customer. This value cannot be used
      * for more than one Customer.
      */
    // var request = MFInitiateSessionRequest("12332212");

    /**
      * If not, then send null like this.
      */
    MFSDK.initiateSession(
        null,
        (MFResult<MFInitiateSessionResponse> result) => {
              if (result.isSuccess())
                {
                  // This for embedded payment view
                  //mfPaymentCardView.load(result.response)

                  /// This used for Apple Pay in iOS only.
                  print("yes in first success"),
                  loadApplePay(result.response!)
                }
              else
                {
                  setState(() {
                    print("Response: " +
                        result.error!.toJson().toString().toString());
                    _response = result.error!.message!;
                  })
                }
            });
  }

  void loadApplePay(MFInitiateSessionResponse mfInitiateSessionResponse) {
    var request = MFExecutePaymentRequest.constructorForApplyPay(
        0.100, MFCurrencyISO.KUWAIT_KWD);

    mfApplePayButton!.load(mfInitiateSessionResponse, request, MFAPILanguage.EN,
        (String invoiceId, MFResult<MFPaymentStatusResponse> result) {
      if (result.isSuccess()) {
        print("yes its successful");
        Alert(
          context: context,
          type: AlertType.success,
          title: "success".tr,
          desc: "thankyoupaymentsuccessful".tr,
          buttons: [
            DialogButton(
              child: Text(
                "Okay",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () {
                // context.read<DocumentRefrenceProvider>().clearAppointmentList();
                // context.read<DocumentRefrenceProvider>().clearServiceList();
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) =>  HomeScreen()),
                // );

                // setState(() {  Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) =>  HomeScreen()),
                // );
                // });
              },
              width: 120,
            )
          ],
        ).show();
        setState(() {
          print("invoiceId: " + invoiceId);
          print("Response: " + result.response!.toJson().toString());
          _response = result.response!.toJson().toString();
        });
      } else {
        print("not done sir");
        Alert(
          context: context,
          type: AlertType.error,
          title: "Error",
          desc: result.error!.message,
          buttons: [
            DialogButton(
              child: Text(
                "Okay",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () {
                // context.read<DocumentRefrenceProvider>().clearAppointmentList();
                // context.read<DocumentRefrenceProvider>().clearServiceList();
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) =>  HomeScreen()),
                // );

                // setState(() {  Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) =>  HomeScreen()),
                // );
                // });
              },
              width: 120,
            )
          ],
        ).show();
        setState(() {
          print("invoiceId: " + invoiceId);
          print("Error: " + result.error!.toJson().toString());
          print("here in response");
          _response = result.error!.message!;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        createApplePayButton(),
      ],
    ));
  }
}
