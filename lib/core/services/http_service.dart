import 'package:dio/dio.dart';
import 'package:e_shop/core/constants/contants.dart';
import 'package:flutter/material.dart';

class HttpService {
  late Dio dio;

  HttpService({
    Key? key,
  }) {
    dio = Dio(BaseOptions(
      baseUrl: Constants.baseUrl,
      connectTimeout: const Duration(minutes: 1),
      receiveTimeout: const Duration(minutes: 1),
      sendTimeout: const Duration(minutes: 1),
      headers: {
        "accept": "application/json",
        "content-type": "application/json",
        "connection": "keep-alive",
      },
    ));

    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        handler.next(options);
      },
      onResponse: (response, handler) {
        handler.next(response);
      },
      onError: (dioException, handler) {
        handler.next(dioException);
      },
    ));
  }
}
