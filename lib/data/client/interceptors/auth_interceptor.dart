import 'dart:io';

import 'package:dio/dio.dart';

import '../../storage/local_storage.dart';

class AuthInterceptor extends Interceptor {
  AuthInterceptor({required LocalStorage storage}) : _storage = storage;

  final LocalStorage _storage;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers[HttpHeaders.contentTypeHeader] = 'application/json';
    options.headers[HttpHeaders.acceptHeader] = 'application/json';
    if (_storage.token?.access.isNotEmpty == true) {
      options.headers[HttpHeaders.authorizationHeader] =
          'Bearer ${_storage.token?.access}';
    }

    return handler.next(options);
  }

  // @override
  // // ignore: deprecated_member_use
  // void onError(DioError err, ErrorInterceptorHandler handler) {
  //   try {
  //     final statusCode = err.response?.statusCode;
  //     if (statusCode == 401 && _storage.token != null) {
  //       _storage.token = null;
  //       // retry request
  //       // handler.resolve(
  //       //   err.response ?? Response(requestOptions: err.requestOptions),
  //       // );
  //       handler.next(err);
  //     } else {
  //       handler.next(err);
  //     }
  //   } catch (e) {
  //     handler.next(err);
  //   }
  // }
}
