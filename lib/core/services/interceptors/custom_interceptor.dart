import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class CustomInterceptors extends Interceptor {
  CustomInterceptors();

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // String? token = await hive.getToken();
    options.headers['Accept'] = '*/*';

    // if (token != null) options.headers['Authorization'] = token;

    if (!kReleaseMode) {
      log('🔵 REQUEST > ${options.method} | ${options.path} | ${options.queryParameters} | ${options.data} | ${options.headers}');
    }

    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (!kReleaseMode) {
      log('🟠 RESPONSE > $response');
    }
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    if (!kReleaseMode) {
      log('🛑 ERROR > $err | ${err.message} | ${err.response}');
    }
    super.onError(err, handler);
  }
}
