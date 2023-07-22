// ignore_for_file: avoid_print, constant_identifier_names

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

class BaseClientClass {
  static const int TIME_OUT_DURATION = 30;

  static Future<dynamic> get(String url, String params) async {
    print('url: ${url + params}');
    http.Response response;
    try {
      response = await http.get(
        Uri.parse(url + params),
        headers: {
          "Content-Type": "application/json",
          //'Authorization': 'Bearer ${SessionController().token}',
        },
      ).timeout(const Duration(seconds: TIME_OUT_DURATION));
      print('Got response');
      print('Status Code: ${response.statusCode}');
      print('Body: ${response.body}');
      // return response;
      switch (response.statusCode) {
        case 200:
          return response;
        case 400:
          return 'Bad request';
        case 401:
          return 'Unauthorized';
        case 404:
          return 'Not found';
        case 500:
          return 'Internal Server Error';
        default:
          return 'Something went wrong';
      }
    } on SocketException {
      print('No internet connection');
      return 'No internet connection';
    } on TimeoutException {
      print('Connection timed out');
      return 'Connection timed out';
    }
  }

/////////////////////////////////////////////delete method

  static Future<dynamic> delete(String url, String params) async {
    print('url: ${url + params}');
    print('deleted method called');

    http.Response response;
    try {
      response = await http.delete(
        Uri.parse(url + params),
        headers: {
          "Content-Type": "application/json",
          //'Authorization': 'Bearer ${SessionController().token}',
        },
      ).timeout(const Duration(seconds: TIME_OUT_DURATION));
      print('Got response');
      print('Status Code: ${response.statusCode}');
      print('Body: ${response.body}');
      switch (response.statusCode) {
        case 200:
          return response;
        case 400:
          return 'Bad request';
        case 401:
          return 'Unauthorized';
        case 404:
          return 'Not found';
        case 500:
          return 'Internal Server Error';
        default:
          return 'Something went wrong';
      }
    } on SocketException {
      print('No internet connection');
      return 'No internet connection';
    } on TimeoutException {
      print('Connection timed out');
      return 'Connection timed out';
    }
  }

  ////////////////////////////////////////////////////////
  static Future<dynamic> post(String url, data) async {
    print('Url: $url');
    print(data);
    http.Response response;
    try {
      response = await http
          .post(
            Uri.parse(url),
            body: json.encode(data),
            headers: {
              "Content-Type": "application/json",
              //  'Authorization': 'Bearer ${SessionController().token}',
            },
            encoding: Encoding.getByName('utf-8'),
          )
          .timeout(const Duration(seconds: TIME_OUT_DURATION));
      print('Got response');
      print('Status Code: ${response.statusCode}');
      print('Body: ${response.body}');
      switch (response.statusCode) {
        case 200:
          return response;
        case 400:
          return 'Bad request';
        case 401:
          return 'Unauthorized';
        case 404:
          return 'Not found';
        case 500:
          return 'Internal Server Error';
        default:
          return 'Something went wrong';
      }
    } on SocketException {
      print('No internet connection');
      return 'No internet connection';
    } on TimeoutException {
      print('Connection timed out');
      return 'Connection timed out';
    }
  }

  static Future<dynamic> put(String url, data) async {
    print('Url: $url');
    print(data);
    http.Response response;
    try {
      response = await http
          .put(
            Uri.parse(url),
            body: json.encode(data),
            headers: {
              "Content-Type": "application/json",
              //  'Authorization': 'Bearer ${SessionController().token}',
            },
            encoding: Encoding.getByName('utf-8'),
          )
          .timeout(const Duration(seconds: TIME_OUT_DURATION));
      print('Got response');
      print('Status Code: ${response.statusCode}');
      print('Body: ${response.body}');
      // return response;

      switch (response.statusCode) {
        case 200:
          return response;
        case 400:
          return 'Bad request';
        case 401:
          return 'Unauthorized';
        case 404:
          return 'Not found';
        case 500:
          return 'Internal Server Error';
        default:
          return 'Something went wrong';
      }
    } on SocketException {
      print('No internet connection');
      return 'No internet connection';
    } on TimeoutException {
      print('Connection timed out');
      return 'Connection timed out';
    }
  }

  static Future<bool> isInternetConnected() async {
    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      }
    } on SocketException catch (_) {
      return false;
    }
    return false;
  }
}
