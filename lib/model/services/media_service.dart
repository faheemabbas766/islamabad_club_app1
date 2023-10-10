import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../apis/app_exception.dart';
import 'base_service.dart';

class MediaService extends BaseService {

  showLoading(String text, BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: Stack(
            children: [
              Opacity(
                opacity: 0.2,
                child: SizedBox(
                  width: double.maxFinite,
                  height: double.maxFinite,
                ),
              ),
              Center(
                child: SizedBox(
                  width: double.maxFinite / 2,
                  height: double.maxFinite / 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: double.maxFinite / 7,
                        height: double.maxFinite / 7,
                        child: const CircularProgressIndicator(),
                      ),
                      DefaultTextStyle(
                        style: TextStyle(fontSize: double.maxFinite / 20),
                        child: Text(text),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
  @override
   Future<dynamic> postRequest(String url, dynamic body) async {
    dynamic responseJson;
    try {
      final response = await http.post(
        Uri.parse(mediaBaseUrl + url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(body),
      );
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  Future<dynamic> getResponse(String url) async {
    dynamic responseJson;
    try {
      final response = await http.get(Uri.parse(mediaBaseUrl + url));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  @visibleForTesting
  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occurred while communication with server' +
                ' with status code : ${response.statusCode}');
    }
  }
}
