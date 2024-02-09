// ignore_for_file: file_names

import 'dart:convert';
import 'dart:io';
import 'package:pj_demoflutterapp/data/app_exceptions.dart';
import 'package:pj_demoflutterapp/data/network/base_api_services.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NetworkApiServices extends BaseApiServices {
  dynamic responseJson;
  @override
  Future getGetApiResponse(String url) async {

    try {
      final response = await http.get(Uri.parse(url), headers: {
        "Content-Type": "application/json",
        'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImptaXBvMiIsIm5iZiI6MTcwNzQ4MTY4MCwiZXhwIjoxNzA3NDgzNDgwLCJpYXQiOjE3MDc0ODE2ODB9.FROTEWpcONs6snnxnRRF5lxjWkZsau0xltkv7ZE66FA'
      });
      responseJson = returnResponse(response);
      debugPrint(response.body.toString());
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }

    return responseJson;
  }

  @override
  Future getPostApiResponse(String url, dynamic data) async {
    dynamic responseJson;

    try {
      http.Response response = await http
          .post(Uri.parse(url), body: data)
          .timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }

    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 404:
        throw BadRequestException(response.body.toString());
      case 500:
        throw BadRequestException(response.body.toString());
      default:
        throw FetchDataException(
            "Error accourded while communicating with server with status code ${response.statusCode}");
    }
  }
}
