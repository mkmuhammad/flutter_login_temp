import 'dart:convert';

import 'package:dio/dio.dart';

/// datasource is place of getting data from web/local and pass data to repository the way it is without any changes,
/// here we only can have different ways of retrieving data and pass it raw,

class AuthDataSource {
  final Dio _dio;

  const AuthDataSource(this._dio);

  Future<Response> postPhoneNumber({required String phoneNumber}) async {
    Map<String, dynamic> sendingCodeBody = {'PhoneNumber': phoneNumber, 'CountryCode': '98'};
    var jsonBody = jsonEncode(sendingCodeBody);
    _dio.options.headers['Content-Type'] = 'application/json';
    Response response = await _dio.post('https://uat.vclinic.io/api/users', data: jsonBody);
    return response;
  }

  Future<Response> postConfirmationCode({required String phoneNumber, required String code}) async {
    Map<String, dynamic> sendingBody = {'PhoneNumber': phoneNumber, 'CountryCode': '98', 'ConfirmationCode': code};
    var jsonBody = jsonEncode(sendingBody);
    _dio.options.headers['Content-Type'] = 'application/json';
    Response response = await _dio.post('https://uat.vclinic.io/api/users/login', data: jsonBody);
    return response;
  }
}
