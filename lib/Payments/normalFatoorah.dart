import 'package:flutter/material.dart';
import 'package:my_fatoorah/my_fatoorah.dart';

class NormalFatoorah extends StatefulWidget {
  @override
  State<NormalFatoorah> createState() => _NormalFatoorahState();
}

class _NormalFatoorahState extends State<NormalFatoorah> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            await MyFatoorah.startPayment(
              context: context,
              showServiceCharge: true,
              afterPaymentBehaviour:
                  AfterPaymentBehaviour.AfterCallbackExecution,
              errorChild: Center(child: Text("")),
              // buildAppBar: MyAppBar(),

              request: MyfatoorahRequest.test(
                currencyIso: Country.SaudiArabia,
                successUrl:
                    'https://openjournalsystems.com/file/2017/07/payment-success.png',
                errorUrl: 'https://www.google.com',
                invoiceAmount: 20,
                language: ApiLanguage.English,
                token:
                    "rLtt6JWvbUHDDhsZnfpAhpYk4dxYDQkbcPTyGaKp2TYqQgG7FGZ5Th_WD53Oq8Ebz6A53njUoo1w3pjU1D4vs_ZMqFiz_j0urb_BH9Oq9VZoKFoJEDAbRZepGcQanImyYrry7Kt6MnMdgfG5jn4HngWoRdKduNNyP4kzcp3mRv7x00ahkm9LAK7ZRieg7k1PDAnBIOG3EyVSJ5kK4WLMvYr7sCwHbHcu4A5WwelxYK0GMJy37bNAarSJDFQsJ2ZvJjvMDmfWwDVFEVe_5tOomfVNt6bOg9mexbGjMrnHBnKnZR1vQbBtQieDlQepzTZMuQrSuKn-t5XZM7V6fCW7oP-uXGX-sMOajeX65JOf6XVpk29DP6ro8WTAflCDANC193yof8-f5_EYY-3hXhJj7RBXmizDpneEQDSaSz5sFk0sV5qPcARJ9zGG73vuGFyenjPPmtDtXtpx35A-BVcOSBYVIWe9kndG3nclfefjKEuZ3m4jL9Gg1h2JBvmXSMYiZtp9MR5I6pvbvylU_PP5xJFSjVTIz7IQSjcVGO41npnwIxRXNRxFOdIUHn0tjQ-7LwvEcTXyPsHXcMD8WtgBh-wxR8aKX7WPSsT1O8d8reb2aR7K3rkV3K82K_0OgawImEpwSvp9MNKynEAJQS6ZHe_J_l77652xwPNxMRTMASk1ZsJL",
              ),
            );
          },
          child: Text("pay"),
        ),
      ),
    );
  }
}
