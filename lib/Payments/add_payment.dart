import 'dart:developer';
import '../utils/constants/app_urls.dart';
import '../utils/constants/base_client.dart';
import 'package:http/http.dart' as http;

class AddPaymentRecord {
  // static sddpayment() async {
  //   Map data = {
  //     "amount": '500',
  //     "status": 'complete',
  //     "source": 'no',
  //     "user_id": '123',
  //     "horse_id": '12',
  //   };
  //   try {
  //     var url = "${AppUrls.baseUrl}${AppUrls.adPayment}";
  //     var res = await BaseClientClass.post(url, data);

  //     if (res is http.Response) {
  //       return (res.body);
  //     } else {
  //       return res;
  //     }
  //   } catch (e) {
  //     return e;
  //   }
  // }

  static Future<dynamic> addPayment(
      {int? userId,
      String? horseid,
      String? sellerid,
      String? invoceid,
      String? invicestatus,
      String? invcereference,
      String? customerreference,
      String? createdate,
      String? expirydate,
      String? invocevalue,
      String? customername,
      String? mobiele,
      String? invoicedisplayvalue,
      String? invoiceitem,
      String? transactiondate,
      String? paymentgateway,
      String? referrenceid,
      String? trackid,
      String? transationid,
      String? paymentid,
      String? authorizationid,
      String? transactionstatus,
      String? transactionvalue,
      String? customerservicecharge,
      String? duevalue,
      String? paidcurency,
      String? paidcurencyvalue,
      String? curency,
      String? error,
      String? cardnumber,
      String? errorcode,
      String? suplier,
      String? amount,
      String? source,
      String? status,
      String? delivertome,
      String? dropoff,
      String? deliveryfee,
      transport}) async {
    Map data = {
      "userId": userId,
      "horseId": horseid,
      "sellerId": sellerid,
      "InvoiceId": invoceid,
      "InvoiceStatus": invicestatus,
      "InvoiceReference": invcereference,
      "CustomerReference": customerreference,
      "CreatedDate": createdate,
      "ExpiryDate": expirydate,
      "InvoiceValue": invocevalue,
      "CustomerName": customername,
      "CustomerMobile": mobiele,
      "InvoiceDisplayValue": invoicedisplayvalue,
      "InvoiceItems": invoiceitem,
      "TransactionDate": transactiondate,
      "PaymentGateway": paymentgateway,
      "ReferenceId": referrenceid,
      "TrackId": trackid,
      "TransactionId": transationid,
      "PaymentId": paymentid,
      "AuthorizationId": authorizationid,
      "TransactionStatus": transactionstatus,
      "TransationValue": transactionvalue,
      "CustomerServiceCharge": customerservicecharge,
      "DueValue": duevalue,
      "PaidCurrency": paidcurency,
      "PaidCurrencyValue": paidcurencyvalue,
      "Currency": curency,
      "Error": error,
      "CardNumber": cardnumber,
      "ErrorCode": errorcode,
      "Suppliers": suplier,
      "amount": duevalue,
      "status": transactionstatus,
      "source": 'purchase',
      "deliveryToMe": transport,
      "dropoff": dropoff,
      "Fee": deliveryfee,
      "transport": transport
    };
    try {
      var url = "${AppUrls.baseUrl}${AppUrls.adPayment}";
      var res = await BaseClientClass.post(url, data);

      if (res is http.Response) {
        log(res.body);
        return (res.body);
      } else {
        return res;
      }
    } catch (e) {
      return e;
    }
  }
  /////add payment in wallet............

  static Future<dynamic> addInsurence({
    int? userId,
    String? horseid,
    String? invoceid,
    String? invicestatus,
    String? invcereference,
    String? customerreference,
    String? createdate,
    String? expirydate,
    String? invocevalue,
    String? customername,
    String? mobiele,
    String? invoicedisplayvalue,
    String? invoiceitem,
    String? transactiondate,
    String? paymentgateway,
    String? referrenceid,
    String? trackid,
    String? transationid,
    String? paymentid,
    String? authorizationid,
    String? transactionstatus,
    String? transactionvalue,
    String? customerservicecharge,
    String? duevalue,
    String? paidcurency,
    String? paidcurencyvalue,
    String? curency,
    String? error,
    String? cardnumber,
    String? errorcode,
    String? suplier,
    String? amount,
    String? source,
    String? status,
  }) async {
    Map data = {
      "userId": userId,
      "HorseId": horseid,
      "InvoiceId": invoceid,
      "InvoiceStatus": invicestatus,
      "InvoiceReference": invcereference,
      "CustomerReference": customerreference,
      "CreatedDate": createdate,
      "ExpiryDate": expirydate,
      "InvoiceValue": invocevalue,
      "CustomerName": customername,
      "CustomerMobile": mobiele,
      "InvoiceDisplayValue": invoicedisplayvalue,
      "InvoiceItems": invoiceitem,
      "TransactionDate": transactiondate,
      "PaymentGateway": paymentgateway,
      "ReferenceId": referrenceid,
      "TrackId": trackid,
      "TransactionId": transationid,
      "PaymentId": paymentid,
      "AuthorizationId": authorizationid,
      "TransactionStatus": transactionstatus,
      "TransationValue": transactionvalue,
      "CustomerServiceCharge": customerservicecharge,
      "DueValue": duevalue,
      "PaidCurrency": paidcurency,
      "PaidCurrencyValue": paidcurencyvalue,
      "Currency": curency,
      "Error": error,
      "CardNumber": cardnumber,
      "ErrorCode": errorcode,
      "Suppliers": suplier,
      "amount": duevalue,
      "status": transactionstatus,
      "source": '',
    };
    try {
      var url = "${AppUrls.baseUrl}${AppUrls.addInsurance}";
      var res = await BaseClientClass.post(url, data);

      if (res is http.Response) {
        log(res.body);
        return (res.body);
      } else {
        return res;
      }
    } catch (e) {
      return e;
    }
  }

  /////add payment in wallet............

  static Future<dynamic> addWalet({
    int? userId,
    String? horseid,
    String? invoceid,
    String? invicestatus,
    String? invcereference,
    String? customerreference,
    String? createdate,
    String? expirydate,
    String? invocevalue,
    String? customername,
    String? mobiele,
    String? invoicedisplayvalue,
    String? invoiceitem,
    String? transactiondate,
    String? paymentgateway,
    String? referrenceid,
    String? trackid,
    String? transationid,
    String? paymentid,
    String? authorizationid,
    String? transactionstatus,
    String? transactionvalue,
    String? customerservicecharge,
    String? duevalue,
    String? paidcurency,
    String? paidcurencyvalue,
    String? curency,
    String? error,
    String? cardnumber,
    String? errorcode,
    String? suplier,
    String? amount,
    String? source,
    String? status,
  }) async {
    Map data = {
      "userId": userId,
      "HorseId": horseid,
      "InvoiceId": invoceid,
      "InvoiceStatus": invicestatus,
      "InvoiceReference": invcereference,
      "CustomerReference": customerreference,
      "CreatedDate": createdate,
      "ExpiryDate": expirydate,
      "InvoiceValue": invocevalue,
      "CustomerName": customername,
      "CustomerMobile": mobiele,
      "InvoiceDisplayValue": invoicedisplayvalue,
      "InvoiceItems": invoiceitem,
      "TransactionDate": transactiondate,
      "PaymentGateway": paymentgateway,
      "ReferenceId": referrenceid,
      "TrackId": trackid,
      "TransactionId": transationid,
      "PaymentId": paymentid,
      "AuthorizationId": authorizationid,
      "TransactionStatus": transactionstatus,
      "TransationValue": transactionvalue,
      "CustomerServiceCharge": customerservicecharge,
      "DueValue": duevalue,
      "PaidCurrency": paidcurency,
      "PaidCurrencyValue": paidcurencyvalue,
      "Currency": curency,
      "Error": error,
      "CardNumber": cardnumber,
      "ErrorCode": errorcode,
      "Suppliers": suplier,
      "amount": duevalue,
      "status": transactionstatus,
      "source": '',
    };
    try {
      var url = "${AppUrls.baseUrl}${AppUrls.addwallet}";
      var res = await BaseClientClass.post(url, data);

      if (res is http.Response) {
        log(res.body);
        return (res.body);
      } else {
        return res;
      }
    } catch (e) {
      return e;
    }
  }

  static Future<dynamic> addHospitality({
    int? userId,
    String? hospitality_id,
    String? months,
    String? invoceid,
    String? invicestatus,
    String? invcereference,
    String? customerreference,
    String? createdate,
    String? expirydate,
    String? invocevalue,
    String? customername,
    String? mobiele,
    String? invoicedisplayvalue,
    String? invoiceitem,
    String? transactiondate,
    String? paymentgateway,
    String? referrenceid,
    String? trackid,
    String? transationid,
    String? paymentid,
    String? authorizationid,
    String? transactionstatus,
    String? transactionvalue,
    String? customerservicecharge,
    String? duevalue,
    String? paidcurency,
    String? paidcurencyvalue,
    String? curency,
    String? error,
    String? cardnumber,
    String? errorcode,
    String? suplier,
    String? amount,
    String? source,
    String? status,
  }) async {
    Map data = {
      "userId": userId,
      "hospitality_id": hospitality_id,
      "months": months,
      "InvoiceId": invoceid,
      "InvoiceStatus": invicestatus,
      "InvoiceReference": invcereference,
      "CustomerReference": customerreference,
      "CreatedDate": createdate,
      "ExpiryDate": expirydate,
      "InvoiceValue": invocevalue,
      "CustomerName": customername,
      "CustomerMobile": mobiele,
      "InvoiceDisplayValue": invoicedisplayvalue,
      "InvoiceItems": invoiceitem,
      "TransactionDate": transactiondate,
      "PaymentGateway": paymentgateway,
      "ReferenceId": referrenceid,
      "TrackId": trackid,
      "TransactionId": transationid,
      "PaymentId": paymentid,
      "AuthorizationId": authorizationid,
      "TransactionStatus": transactionstatus,
      "TransationValue": transactionvalue,
      "CustomerServiceCharge": customerservicecharge,
      "DueValue": duevalue,
      "PaidCurrency": paidcurency,
      "PaidCurrencyValue": paidcurencyvalue,
      "Currency": curency,
      "Error": error,
      "CardNumber": cardnumber,
      "ErrorCode": errorcode,
      "Suppliers": suplier,
      "amount": duevalue,
      "status": transactionstatus,
      "source": '',
    };
    try {
      var url = "${AppUrls.baseUrl}${AppUrls.purchasehospitalitie}";
      var res = await BaseClientClass.post(url, data);

      if (res is http.Response) {
        log(res.body);
        return (res.body);
      } else {
        return res;
      }
    } catch (e) {
      return e;
    }
  }

  static Future<dynamic> addTraning({
    int? userId,
    String? service_id,
    String? training_id,
    String? months,
    String? invoceid,
    String? invicestatus,
    String? invcereference,
    String? customerreference,
    String? createdate,
    String? expirydate,
    String? invocevalue,
    String? customername,
    String? mobiele,
    String? invoicedisplayvalue,
    String? invoiceitem,
    String? transactiondate,
    String? paymentgateway,
    String? referrenceid,
    String? trackid,
    String? transationid,
    String? paymentid,
    String? authorizationid,
    String? transactionstatus,
    String? transactionvalue,
    String? customerservicecharge,
    String? duevalue,
    String? paidcurency,
    String? paidcurencyvalue,
    String? curency,
    String? error,
    String? cardnumber,
    String? errorcode,
    String? suplier,
    String? amount,
    String? source,
    String? status,
  }) async {
    Map data = {
      "userId": userId,
      "service_id": service_id,
      "training_id": training_id,
      "shares": months,
      "InvoiceId": invoceid,
      "InvoiceStatus": invicestatus,
      "InvoiceReference": invcereference,
      "CustomerReference": customerreference,
      "CreatedDate": createdate,
      "ExpiryDate": expirydate,
      "InvoiceValue": invocevalue,
      "CustomerName": customername,
      "CustomerMobile": mobiele,
      "InvoiceDisplayValue": invoicedisplayvalue,
      "InvoiceItems": invoiceitem,
      "TransactionDate": transactiondate,
      "PaymentGateway": paymentgateway,
      "ReferenceId": referrenceid,
      "TrackId": trackid,
      "TransactionId": transationid,
      "PaymentId": paymentid,
      "AuthorizationId": authorizationid,
      "TransactionStatus": transactionstatus,
      "TransationValue": transactionvalue,
      "CustomerServiceCharge": customerservicecharge,
      "DueValue": duevalue,
      "PaidCurrency": paidcurency,
      "PaidCurrencyValue": paidcurencyvalue,
      "Currency": curency,
      "Error": error,
      "CardNumber": cardnumber,
      "ErrorCode": errorcode,
      "Suppliers": suplier,
      "amount": duevalue,
      "status": transactionstatus,
      "source": '',
    };
    try {
      var url = "${AppUrls.baseUrl}${AppUrls.purchasetraning}";
      var res = await BaseClientClass.post(url, data);

      if (res is http.Response) {
        log(res.body);
        return (res.body);
      } else {
        return res;
      }
    } catch (e) {
      return e;
    }
  }
}
