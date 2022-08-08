import 'dart:convert';

import 'package:base_clean_arch/core/configs/env/environment.dart';
import 'package:base_clean_arch/core/constants/number_constants.dart';
import 'package:base_clean_arch/core/constants/string_constants.dart';
import 'package:base_clean_arch/core/exceptions/server_exception.dart';
import 'package:base_clean_arch/core/services/interceptors/custom_interceptor.dart';
import 'package:dio/dio.dart';

class BaseApiClient {
  final Dio _dio = Dio();

  BaseApiClient();

  Future<String> get({required String pathUrl, Map<String, dynamic>? params, String? path}) async {
    _dio.options.headers['content-Type'] = StringConstants.httpApplicationJson;

    _dio.interceptors.clear();
    _dio.interceptors.add(CustomInterceptors());

    // if (kReleaseMode) {
    //   _dio.addSentry(recordBreadcrumbs: false, networkTracing: false, captureFailedRequests: false);
    // }

    pathUrl = Environment.appHostUrl + pathUrl;

    try {
      final Response<dynamic> res = await getGetResponse(pathUrl, params, path);
      return handleResponse(res);
    } catch (error) {
      throw handleError(error);
    }
  }

  Future<String> post({required String pathUrl, Map<String, dynamic>? jsonBody}) async {
    _dio.options.headers['content-Type'] = StringConstants.httpApplicationJson;

    _dio.interceptors.clear();
    _dio.interceptors.add(CustomInterceptors());

    // if (kReleaseMode) {
    //   _dio.addSentry(recordBreadcrumbs: false, networkTracing: false, captureFailedRequests: false);
    // }

    pathUrl = Environment.appHostUrl + pathUrl;

    try {
      final Response<dynamic> res = await getPostResponse(pathUrl, jsonBody);

      return handleResponse(res);
    } catch (error) {
      throw handleError(error);
    }
  }

  Future<Response<dynamic>> getGetResponse(String pathUrl, Map<String, dynamic>? params, String? path) async {
    if (params != null) {
      return await _dio.get(pathUrl, queryParameters: params);
    } else {
      if (path != null) {
        return await _dio.get(pathUrl + path);
      } else {
        return await _dio.get(pathUrl);
      }
    }
  }

  Future<Response<dynamic>> getPostResponse(String pathUrl, Map<String, dynamic>? jsonBody) async {
    if (jsonBody != null) {
      return await _dio.post(pathUrl, data: jsonBody);
    } else {
      return await _dio.post(pathUrl);
    }
  }

  Future<String> handleResponse(Response<dynamic> res) async {
    Map<String, dynamic> response = <String, dynamic>{};
    String encoded = '';
    try {
      if (res.toString() == '[]') {
        Map<String, dynamic> map = {'data': jsonDecode(res.toString()) as List<dynamic>};
        response = map;
        encoded = jsonEncode(response);
      } else {
        response = jsonDecode(res.toString());
        encoded = jsonEncode(response);
      }
    } on FormatException catch (_) {
      Map<String, dynamic> map = {'data': res.data as List<dynamic>};
      response = map;
      encoded = jsonEncode(response);
    }

    if (res.statusCode == NumberConstants.httpStatusOk) {
      return encoded.toString();
    } else {
      throw ServerException(message: response['code']);
    }
  }

  Object handleError(Object error) {
    if (error is DioError) {
      final Map<String, dynamic> response = error.response != null ? jsonDecode(error.response.toString()) : {'code': 'error unidentified'};

      throw ServerException(message: response['code'], code: response['statusCode']);
    } else {
      throw ServerException(message: 'not working');
    }
  }
}
