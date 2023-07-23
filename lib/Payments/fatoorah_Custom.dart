// ignore_for_file: unused_field, override_on_non_overriding_member, unused_local_variable

import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_credit_card/credit_card_brand.dart';
import 'package:flutter_credit_card/credit_card_form.dart';

import 'package:flutter_credit_card/credit_card_model.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:flutter_credit_card/custom_card_type_icon.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:myfatoorah_flutter/myfatoorah_flutter.dart';
import 'package:myfatoorah_flutter/utils/MFCountry.dart';
import 'package:myfatoorah_flutter/utils/MFEnvironment.dart';
import 'package:obaiah_mobile_app/utils/colors/colors.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import '../screens/user/settings/my_orders/view/my_orders_screen.dart';
import '../utils/constants/constants.dart';
import 'add_payment.dart';
import 'color_manager.dart';

final String mAPIKey =
    "rLtt6JWvbUHDDhsZnfpAhpYk4dxYDQkbcPTyGaKp2TYqQgG7FGZ5Th_WD53Oq8Ebz6A53njUoo1w3pjU1D4vs_ZMqFiz_j0urb_BH9Oq9VZoKFoJEDAbRZepGcQanImyYrry7Kt6MnMdgfG5jn4HngWoRdKduNNyP4kzcp3mRv7x00ahkm9LAK7ZRieg7k1PDAnBIOG3EyVSJ5kK4WLMvYr7sCwHbHcu4A5WwelxYK0GMJy37bNAarSJDFQsJ2ZvJjvMDmfWwDVFEVe_5tOomfVNt6bOg9mexbGjMrnHBnKnZR1vQbBtQieDlQepzTZMuQrSuKn-t5XZM7V6fCW7oP-uXGX-sMOajeX65JOf6XVpk29DP6ro8WTAflCDANC193yof8-f5_EYY-3hXhJj7RBXmizDpneEQDSaSz5sFk0sV5qPcARJ9zGG73vuGFyenjPPmtDtXtpx35A-BVcOSBYVIWe9kndG3nclfefjKEuZ3m4jL9Gg1h2JBvmXSMYiZtp9MR5I6pvbvylU_PP5xJFSjVTIz7IQSjcVGO41npnwIxRXNRxFOdIUHn0tjQ-7LwvEcTXyPsHXcMD8WtgBh-wxR8aKX7WPSsT1O8d8reb2aR7K3rkV3K82K_0OgawImEpwSvp9MNKynEAJQS6ZHe_J_l77652xwPNxMRTMASk1ZsJL";

class FatoorahCustom extends StatefulWidget {
  int userid;
  var horseid;
  var sellerid;
  var totalprice;
  var role;
  FatoorahCustom({
    Key? key,
    required this.userid,
    required this.horseid,
    required this.sellerid,
    required this.totalprice,
    required this.role,
  }) : super(key: key);
  @override
  State<FatoorahCustom> createState() => _FatoorahCustomState();
}

class _FatoorahCustomState extends State<FatoorahCustom> {
  String cardnumber = '';
  String expirydate = '';
  String cardholderName = '';
  String cvvcode = '';
  bool isCvvFocused = false;
  var _response;

  TextEditingController number = TextEditingController();
  TextEditingController start = TextEditingController();
  TextEditingController end = TextEditingController();
  TextEditingController cvv = TextEditingController();
  TextEditingController name = TextEditingController();

  OutlineInputBorder? border;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  MFPaymentCardView? mfPaymentCardView;

  void initState() {
    super.initState();

    if (mAPIKey.isEmpty) {
      setState(() {
        _response =
            "Missing API Token Key.. You can get it from here: https://myfatoorah.readme.io/docs/test-token";
      });
      return;
    }

    border = OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.grey.withOpacity(0.7),
        width: 2.0,
      ),
    );

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

  void initiateSession() {
    MFSDK.initiateSession(
        null,
        (MFResult<MFInitiateSessionResponse> result) => {
              if (result.isSuccess())
                {
                  // This for embedded payment view
                  mfPaymentCardView!.load(result.response!,
                      onCardBinChanged: (String bin) => {print("Bin: " + bin)}),

                  /// This used for Apple Pay in iOS only.
                }
              else
                {
                  setState(() {
                    // print("Response: " + result.error!.toJson().toString());
                    _response = result.error!.message!;
                  })
                }
            });
    /**
     * If you want to use saved card option with embedded payment, send the parameter
     * "customerIdentifier" with a unique value for each customer. This value cannot be used
     * for more than one Customer.
     */
    var request = new MFInitiatePaymentRequest(
        int.parse(widget.totalprice).toDouble(), MFCurrencyISO.KUWAIT_KWD);

    MFSDK.initiatePayment(
        request,
        MFAPILanguage.EN,
        (MFResult<MFInitiatePaymentResponse> result) => {
              if (result.isSuccess())
                {print(result.response!.toJson().toString())}
              else
                {print(result.error!.message)}
            });
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
                  mfPaymentCardView!.load(result.response!)

                  /// This used for Apple Pay in iOS only.
                  // loadApplePay(result.response!)
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

  makePayment(String cardNumber, String expiryMonth, String expiryYear,
      String securityCode, userid, horseid, totalprice, role) async {
    var request = new MFInitiatePaymentRequest(5.5, MFCurrencyISO.KUWAIT_KWD);

    MFSDK.initiatePayment(
        request,
        MFAPILanguage.EN,
        (MFResult<MFInitiatePaymentResponse> result) => {
              if (result.isSuccess())
                {print(result.response!.toJson().toString())}
              else
                {print(result.error!.message)}
            });
    int paymentMethod = 20;

    var request2 = new MFExecutePaymentRequest(
        paymentMethod, int.parse(widget.totalprice).toDouble());
    var c = "2223000000000007";

    var mfCardInfo = MFCardInfo(
        cardNumber: cardNumber,
        expiryMonth: expiryMonth,
        expiryYear: expiryYear,
        securityCode: securityCode,
        bypass3DS: false,
        saveToken: false,
        cardHolderName: "test test");

    // var mfCardInfo = MFCardInfo(cardNumber: "5453010000095539", expiryMonth:"12", expiryYear: "25", securityCode: "300",
    //     bypass3DS: false, saveToken: false,cardHolderName: "test test"
    // );
    // var mfCardInfo = MFCardInfo(cardNumber: "5297412542005689", expiryMonth: "05", expiryYear: "25", securityCode: "350",
    //     bypass3DS: false, saveToken: false,cardHolderName: "test test"
    // );

    MFSDK.executeDirectPayment(context, request2, mfCardInfo, MFAPILanguage.EN,
        (String invoiceId, MFResult<MFDirectPaymentResponse> result) {
      if (result.isSuccess()) {
        //AddPaymentRecord.sddpayment();

        log("you are successfull");
        // Alert(
        //   context: context,
        //   type: AlertType.success,
        //   title: "Success",
        //   desc: "Thankyou Payment Successful",
        //   buttons: [
        //     DialogButton(
        //       child: Text(
        //         "Okay",
        //         style: TextStyle(color: Colors.white, fontSize: 20),
        //       ),
        //       onPressed: () {
        //         // context.read<DocumentRefrenceProvider>().clearAppointmentList();
        //         // context.read<DocumentRefrenceProvider>().clearServiceList();
        //         // Navigator.push(
        //         //       context,
        //         //       MaterialPageRoute(builder: (context) =>  HomeScreen()),
        //         //     );

        //         setState(() {
        //           Navigator.push(
        //             context,
        //             MaterialPageRoute(
        //                 builder: (context) => UserThankyouScreen()),
        //           );
        //         });
        //       },
        //       width: 120,
        //     )
        //   ],
        // ).show();

        var data = result.response!.toJson();

        //log(data.toString());
        log(data['mfPaymentStatusResponse']['InvoiceId'].toString());
        log(data['mfPaymentStatusResponse']['InvoiceStatus'].toString());
        log(data['mfPaymentStatusResponse']['InvoiceReference'].toString());
        log(data['mfPaymentStatusResponse']['CreatedDate'].toString());
        log('rolllllllllllll$role');
        var userId = widget.userid;
        var horseid = widget.horseid;
        var invoceid = data['mfPaymentStatusResponse']['InvoiceId'].toString();
        var invicestatus =
            data['mfPaymentStatusResponse']['InvoiceStatus'].toString();
        var invcereference =
            data['mfPaymentStatusResponse']['InvoiceReference'].toString();
        var customerreference =
            data['mfPaymentStatusResponse']['customerreference'].toString();
        var createdate =
            data['mfPaymentStatusResponse']['CreatedDate'].toString();
        var expirydate =
            data['mfPaymentStatusResponse']['ExpiryDate'].toString();
        var invocevalue =
            data['mfPaymentStatusResponse']['InvoiceValue'].toString();
        var customername =
            data['mfPaymentStatusResponse']['CustomerName'].toString();
        var mobile =
            data['mfPaymentStatusResponse']['CustomerMobile'].toString();
        var invoicedisplayvalue =
            data['mfPaymentStatusResponse']['InvoiceDisplayValue'].toString();
        var invoiceitem =
            data['mfPaymentStatusResponse']['InvoiceItems'].toString();
        var transactiondate = data['mfPaymentStatusResponse']
                ['InvoiceTransactions'][0]['TransactionDate']
            .toString();
        var paymentgateway = data['mfPaymentStatusResponse']
                ['InvoiceTransactions'][0]['PaymentGateway']
            .toString();
        var referrenceid = data['mfPaymentStatusResponse']
                ['InvoiceTransactions'][0]['ReferenceId']
            .toString();
        var trackid = data['mfPaymentStatusResponse']['InvoiceTransactions'][0]
                ['TrackId']
            .toString();
        var transationid = data['mfPaymentStatusResponse']
                ['InvoiceTransactions'][0]['TransactionId']
            .toString();
        var paymentid = data['mfPaymentStatusResponse']['InvoiceTransactions']
                [0]['PaymentId']
            .toString();
        var authorizationid = data['mfPaymentStatusResponse']
                ['InvoiceTransactions'][0]['AuthorizationId']
            .toString();
        var transactionstatus = data['mfPaymentStatusResponse']
                ['InvoiceTransactions'][0]['TransactionStatus']
            .toString();
        var transactionvalue = data['mfPaymentStatusResponse']
                ['InvoiceTransactions'][0]['TransationValue']
            .toString();
        var customerservicecharge = data['mfPaymentStatusResponse']
                ['InvoiceTransactions'][0]['CustomerServiceCharge']
            .toString();

        var duevalue = data['mfPaymentStatusResponse']['InvoiceTransactions'][0]
                ['DueValue']
            .toString();
        var paidcurency = data['mfPaymentStatusResponse']['InvoiceTransactions']
                [0]['PaidCurrency']
            .toString();
        var paidcurencyvalue = data['mfPaymentStatusResponse']
                ['InvoiceTransactions'][0]['PaidCurrencyValue']
            .toString();
        var curency = data['mfPaymentStatusResponse']['InvoiceTransactions'][0]
                ['Currency']
            .toString();
        var error = '';
        var cardnumber = data['mfPaymentStatusResponse']['InvoiceTransactions']
                [0]['CardNumber']
            .toString();
        var errorcode = '';
        var suplier = '';

        if (widget.role == 'payment') {
          AddPaymentRecord.addPayment(
              userId: userId,
              horseid: horseid,
              sellerid: widget.sellerid,
              invoceid: invoceid,
              invicestatus: invicestatus,
              invcereference: invcereference,
              customerreference: customerreference,
              createdate: createdate,
              expirydate: expirydate,
              invocevalue: invocevalue,
              customername: customername,
              mobiele: mobile,
              invoicedisplayvalue: invoicedisplayvalue,
              invoiceitem: invoiceitem,
              transactiondate: transactiondate,
              paymentgateway: paymentgateway,
              referrenceid: referrenceid,
              trackid: trackid,
              transationid: transationid,
              paymentid: paymentid,
              authorizationid: authorizationid,
              transactionstatus: transactionstatus,
              transactionvalue: transactionvalue,
              customerservicecharge: customerservicecharge,
              duevalue: duevalue,
              paidcurency: paidcurency,
              paidcurencyvalue: paidcurencyvalue,
              curency: curency,
              error: error,
              cardnumber: cardnumber,
              errorcode: errorcode,
              suplier: suplier,
              delivertome: 'Makkah',
              dropoff: 'riyadh',
              deliveryfee: '1',
              transport: '1');
          var dddd = 'sub';
          var bal = int.parse(widget.totalprice).toDouble();
          setBalance(bal, dddd);
        } else if (widget.role == 'traning') {
          var useridd = GetStorage().read("userId");
          AddPaymentRecord.addTraning(
            userId: useridd,
            service_id: '$horseid',
            training_id: '$userId',
            months: widget.sellerid,
            invoceid: invoceid,
            invicestatus: invicestatus,
            invcereference: invcereference,
            customerreference: customerreference,
            createdate: createdate,
            expirydate: expirydate,
            invocevalue: invocevalue,
            customername: customername,
            mobiele: mobile,
            invoicedisplayvalue: invoicedisplayvalue,
            invoiceitem: invoiceitem,
            transactiondate: transactiondate,
            paymentgateway: paymentgateway,
            referrenceid: referrenceid,
            trackid: trackid,
            transationid: transationid,
            paymentid: paymentid,
            authorizationid: authorizationid,
            transactionstatus: transactionstatus,
            transactionvalue: transactionvalue,
            customerservicecharge: customerservicecharge,
            duevalue: duevalue,
            paidcurency: paidcurency,
            paidcurencyvalue: paidcurencyvalue,
            curency: curency,
            error: error,
            cardnumber: cardnumber,
            errorcode: errorcode,
            suplier: suplier,
          );
          var dddd = 'sub';
          var bal = int.parse(widget.totalprice).toDouble();
          setBalance(bal, dddd);
        } else if (widget.role == 'hospitality') {
          var useridd = GetStorage().read("userId");
          log('userid ----- $useridd');
          AddPaymentRecord.addHospitality(
            userId: useridd,
            hospitality_id: '$horseid',
            months: widget.sellerid,
            invoceid: invoceid,
            invicestatus: invicestatus,
            invcereference: invcereference,
            customerreference: customerreference,
            createdate: createdate,
            expirydate: expirydate,
            invocevalue: invocevalue,
            customername: customername,
            mobiele: mobile,
            invoicedisplayvalue: invoicedisplayvalue,
            invoiceitem: invoiceitem,
            transactiondate: transactiondate,
            paymentgateway: paymentgateway,
            referrenceid: referrenceid,
            trackid: trackid,
            transationid: transationid,
            paymentid: paymentid,
            authorizationid: authorizationid,
            transactionstatus: transactionstatus,
            transactionvalue: transactionvalue,
            customerservicecharge: customerservicecharge,
            duevalue: duevalue,
            paidcurency: paidcurency,
            paidcurencyvalue: paidcurencyvalue,
            curency: curency,
            error: error,
            cardnumber: cardnumber,
            errorcode: errorcode,
            suplier: suplier,
          );
          var dddd = 'sub';
          var bal = int.parse(widget.totalprice).toDouble();
          setBalance(bal, dddd);
        } else if (widget.role == 'addinsurence') {
          AddPaymentRecord.addInsurence(
            userId: userId,
            horseid: horseid,
            invoceid: invoceid,
            invicestatus: invicestatus,
            invcereference: invcereference,
            customerreference: customerreference,
            createdate: createdate,
            expirydate: expirydate,
            invocevalue: invocevalue,
            customername: customername,
            mobiele: mobile,
            invoicedisplayvalue: invoicedisplayvalue,
            invoiceitem: invoiceitem,
            transactiondate: transactiondate,
            paymentgateway: paymentgateway,
            referrenceid: referrenceid,
            trackid: trackid,
            transationid: transationid,
            paymentid: paymentid,
            authorizationid: authorizationid,
            transactionstatus: transactionstatus,
            transactionvalue: transactionvalue,
            customerservicecharge: customerservicecharge,
            duevalue: duevalue,
            paidcurency: paidcurency,
            paidcurencyvalue: paidcurencyvalue,
            curency: curency,
            error: error,
            cardnumber: cardnumber,
            errorcode: errorcode,
            suplier: suplier,
          );
          var dddd = 'add';
          var bal = int.parse(widget.totalprice).toDouble();
          setBalance(bal, dddd);
        } else if (widget.role == 'addwalet') {
          AddPaymentRecord.addWalet(
            userId: userId,
            horseid: horseid,
            invoceid: invoceid,
            invicestatus: invicestatus,
            invcereference: invcereference,
            customerreference: customerreference,
            createdate: createdate,
            expirydate: expirydate,
            invocevalue: invocevalue,
            customername: customername,
            mobiele: mobile,
            invoicedisplayvalue: invoicedisplayvalue,
            invoiceitem: invoiceitem,
            transactiondate: transactiondate,
            paymentgateway: paymentgateway,
            referrenceid: referrenceid,
            trackid: trackid,
            transationid: transationid,
            paymentid: paymentid,
            authorizationid: authorizationid,
            transactionstatus: transactionstatus,
            transactionvalue: transactionvalue,
            customerservicecharge: customerservicecharge,
            duevalue: duevalue,
            paidcurency: paidcurency,
            paidcurencyvalue: paidcurencyvalue,
            curency: curency,
            error: error,
            cardnumber: cardnumber,
            errorcode: errorcode,
            suplier: suplier,
          );
          var dddd = 'add';
          var bal = int.parse(widget.totalprice).toDouble();
          setBalance(bal, dddd);
        }

        Alert(
          context: context,
          type: AlertType.success,
          title: "success".tr,
          desc: "thankyoupaymentsuccessful".tr,
          buttons: [
            DialogButton(
              color: cPrimaryColor,
              child: Text(
                "Okay",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () {
                setState(() {
                  //Get.toNamed('/myOrdersScreen');
                  //Get.off(MyOrdersScreen());

                  //Get.off('/myOrdersScreen');

                  Navigator.of(context).pushNamedAndRemoveUntil(
                      profileUser, (Route<dynamic> route) => false);
                });
              },
              width: 120,
            )
          ],
        ).show();
      } else {
        print("you are unsuccessfull");
        Alert(
          context: context,
          type: AlertType.error,
          title: "Alert",
          desc: "There was an error in payment sorry",
          buttons: [
            DialogButton(
              color: cPrimaryColor,
              child: Text(
                "Okay",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () {
                setState(() {
                  Navigator.pop(context);
                });
              },
              width: 120,
            )
          ],
        ).show();
        print(result.error!.message);
      }
    });
  }

  @override
  createPaymentCardView() {
    mfPaymentCardView = MFPaymentCardView(
      language: MFAPILanguage.EN,
      inputColor: Colors.red,
      labelColor: Colors.yellow,
      errorColor: Colors.blue,
      borderColor: Colors.green,
      fontSize: 14,
      borderWidth: 1,
      borderRadius: 10,
      cardHeight: 220,
      cardHolderNameHint: "card holder name hint",
      cardNumberHint: "card number hint",
      expiryDateHint: "expiry date hint",
      cvvHint: "cvv hint",
      showLabels: true,
      cardHolderNameLabel: "card holder name label",
      cardNumberLabel: "card number label",
      expiryDateLabel: "expiry date label",
      cvvLabel: "cvv label",
    );

    return mfPaymentCardView;
  }

  Widget build(BuildContext context) {
    return Scaffold(body: cardView());
    //
    // first()
  }

  Widget first() {
    return SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Card Holder Name",
                    style: TextStyle(
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2),
              child: Container(
                height: 30,
                width: MediaQuery.of(context).size.width,
                child: TextField(
                  controller: name,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      labelText: 'Name On Card',
                      labelStyle: TextStyle(fontSize: 11)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Card Number",
                    style: TextStyle(
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2),
              child: Container(
                height: 30,
                width: MediaQuery.of(context).size.width,
                child: TextField(
                  controller: number,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(16),
                  ],
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    labelText: 'Number',
                    labelStyle: TextStyle(fontSize: 11),
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text("Month"), Text("Year")],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 30,
                    width: 185,
                    child: TextField(
                      controller: start,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(2),
                      ],
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          labelText: 'Month',
                          labelStyle: TextStyle(fontSize: 11)),
                    ),
                  ),
                  Container(
                    height: 30,
                    width: 185,
                    child: TextField(
                      controller: end,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(4),
                      ],
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          labelText: 'Year',
                          labelStyle: TextStyle(fontSize: 11)),
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
              child: Container(
                height: 30,
                width: MediaQuery.of(context).size.width,
                child: TextField(
                  controller: cvv,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(3),
                  ],
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      labelText: 'CCV',
                      labelStyle: TextStyle(fontSize: 11)),
                ),
              ),
            ),
            // createPaymentCardView(),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: SizedBox(
                height: 40,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    makePayment(
                        number.text.trim(),
                        start.text.trim(),
                        end.text.trim(),
                        cvv.text.trim(),
                        widget.userid,
                        widget.horseid,
                        widget.totalprice,
                        widget.role);
                    //print("now getting response ${response.toString()}");
                  },
                  child: Text("Pay Now"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget cardView() {
    return SafeArea(
      child: Container(
          decoration: BoxDecoration(
            color: ColorUtilities.transparant,
            borderRadius: BorderRadius.circular(25),
          ),
          // decoration: const BoxDecoration(
          //   image: DecorationImage(
          //     image: ExactAssetImage('assets/images/card/bg.png'),
          //     fit: BoxFit.fill,
          //   ),
          //   color: Colors.black,
          // ),
          child: SafeArea(
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 30,
                ),
                CreditCardWidget(
                  cardNumber: cardnumber,
                  expiryDate: expirydate,
                  cardHolderName: cardholderName,
                  cvvCode: cvvcode,
                  bankName: 'Visa',
                  showBackView: isCvvFocused,
                  obscureCardNumber: false,
                  obscureCardCvv: false,
                  isHolderNameVisible: true,
                  cardBgColor: cPrimaryColor,
                  //backgroundImage: 'assets/images/card/card_bg.png',
                  isSwipeGestureEnabled: true,
                  onCreditCardWidgetChange:
                      (CreditCardBrand creditCardBrand) {},
                  customCardTypeIcons: <CustomCardTypeIcon>[
                    // CustomCardTypeIcon(
                    //   cardType: CardType.mastercard,
                    //   cardImage: Image.asset(
                    //     'assets/images/card/mastercard.png',
                    //     height: 48,
                    //     width: 48,
                    //   ),
                    // )
                  ],
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        CreditCardForm(
                          formKey: formKey,
                          obscureCvv: false,
                          obscureNumber: false,
                          cardNumber: cardholderName,
                          cvvCode: cvvcode,
                          isHolderNameVisible: true,
                          isCardNumberVisible: true,
                          isExpiryDateVisible: true,
                          cardHolderName: cardholderName,
                          expiryDate: expirydate,
                          themeColor: cBlackColor,
                          textColor: cBlackColor,
                          cardHolderDecoration: InputDecoration(
                            hintStyle: TextStyle(
                              color: cBlackColor.withOpacity(0.1),
                            ),
                            labelStyle: TextStyle(
                              color: cBlackColor,
                            ),
                            focusedBorder: border,
                            enabledBorder: border,
                            labelText: 'Card Holder',
                          ),
                          cardNumberDecoration: InputDecoration(
                            labelText: 'Number',
                            hintText: '0000 0000 0000 0000',
                            hintStyle:
                                TextStyle(color: cBlackColor.withOpacity(0.1)),
                            labelStyle: TextStyle(
                              color: cBlackColor,
                            ),
                            focusedBorder: border,
                            enabledBorder: border,
                          ),
                          expiryDateDecoration: InputDecoration(
                            hintStyle: TextStyle(
                              color: cBlackColor,
                            ),
                            labelStyle: TextStyle(
                              color: cBlackColor,
                            ),
                            focusedBorder: border,
                            enabledBorder: border,
                            labelText: 'Expired Date',
                            hintText: 'MM/YY',
                          ),
                          cvvCodeDecoration: InputDecoration(
                            hintStyle: TextStyle(
                              color: cBlackColor.withOpacity(0.1),
                            ),
                            labelStyle: TextStyle(
                              color: cBlackColor,
                            ),
                            focusedBorder: border,
                            enabledBorder: border,
                            labelText: 'CVV',
                            hintText: '000',
                          ),
                          onCreditCardModelChange: onCreditCardModelChange,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.all(15.0),
                        //   child: SizedBox(
                        //     height: 40,
                        //     width: double.infinity,
                        //     child: ElevatedButton(
                        //       onPressed: () async {
                        //         // print(cardnumber.trim());
                        //         // print(cardholderName.trim());
                        //         // print(cvvcode.trim());
                        //         // print(expirydate.trim());
                        //         // String date = expirydate;

                        //         // List<String> parts = date.split('/');

                        //         // var a = int.parse(parts[0]).toString();
                        //         // var b = int.parse(parts[1]).toString();
                        //         // var str = cardnumber;
                        //         // var numbr = str.replaceAll(' ', '');
                        //         // print('num = $numbr');
                        //         // print('a = $a');
                        //         // print('b = $b');

                        //         // makePayment(
                        //         //     '$numbr',
                        //         //     '$a',
                        //         //     '$b',
                        //         //     '${cvvcode}',
                        //         //     widget.userid,
                        //         //     widget.horseid,
                        //         //     widget.totalprice,
                        //         //     widget.role);
                        //         // _onValidate();
                        //         // makePayment(
                        //         //     number.text.trim(),
                        //         //     start.text.trim(),
                        //         //     end.text.trim(),
                        //         //     cvv.text.trim(),
                        //         //     widget.userid,
                        //         //     widget.horseid,
                        //         //     widget.totalprice,
                        //         //     widget.role);
                        //         //print("now getting response ${response.toString()}");
                        //       },
                        //       child: Text("Pay Now"),
                        //     ),
                        //   ),
                        // ),
                        GestureDetector(
                          onTap: () {
                            print(cardnumber.trim());
                            print(cardholderName.trim());
                            print(cvvcode.trim());
                            print(expirydate.trim());
                            String date = expirydate;

                            List<String> parts = date.split('/');

                            var a = int.parse(parts[0]).toString();
                            var b = int.parse(parts[1]).toString();
                            var str = cardnumber;
                            var numbr = str.replaceAll(' ', '');
                            print('num = $numbr');
                            print('a = $a');
                            print('b = $b');

                            makePayment(
                                '$numbr',
                                '$a',
                                '$b',
                                '${cvvcode}',
                                widget.userid,
                                widget.horseid,
                                widget.totalprice,
                                widget.role);
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            decoration: BoxDecoration(
                              color: cPrimaryColor,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            width: double.infinity,
                            alignment: Alignment.center,
                            child: const Text(
                              'continue',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Tajawal',
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }

  void _onValidate() {
    if (formKey.currentState!.validate()) {
      print('valid!');
    } else {
      print('invalid!');
    }
  }

  void onCreditCardModelChange(CreditCardModel? creditCardModel) {
    setState(() {
      cardnumber = creditCardModel!.cardNumber;
      expirydate = creditCardModel.expiryDate;
      cardholderName = creditCardModel.cardHolderName;
      cvvcode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }
}

void setBalance(balance, status) {
  final box = GetStorage();
  final userbal = box.read('accbal');

  if (status == 'sub') {
    var finalbalance = (userbal - balance.toInt());
    box.write('accbal', finalbalance);
  } else {
    var finalbalance = (userbal + balance.toInt());
    box.write('accbal', finalbalance);
  }
}
