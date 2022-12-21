import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
class DioHelper {
  static Dio? dio;


  static const _connectTimeout = 32000;
  static const _receiveTimeout = 32000;
  static const _sendTimeout = 32000;
  static const Map<String, String> _defaultHeaders = {
    "Content-Type": 'application/json'
  };
  static init() {
    dio = Dio(BaseOptions(
        baseUrl: 'https://dummyjson.com/',
        connectTimeout: _connectTimeout,
        receiveTimeout: _receiveTimeout,
        sendTimeout: _sendTimeout,
        receiveDataWhenStatusError: true,
        headers: _defaultHeaders));
    if (!kReleaseMode) {
      dio!.interceptors.add(InterceptorsWrapper(onRequest:
          (RequestOptions options, RequestInterceptorHandler handler) {
        if (kDebugMode) {
          print('REQUEST[${options.method}] => PATH: ${options.path}');
        }
        return handler.next(options); //continue
      }, onResponse: (Response response, ResponseInterceptorHandler handler) {
        if (kDebugMode) {
          print(
            'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
        }
        return handler.next(response);
      }, onError: (DioError err, ErrorInterceptorHandler handler) {
        if (kDebugMode) {
          print(
            'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');
        }

        return handler.reject(err);
      }));
      // dio!.interceptors.add(LogInterceptor(responseBody: false));
      // dio!.interceptors.add(PrettyDioLogger(
      //   requestHeader: true,
      //   requestBody: true,
      //   responseBody: true,
      //   responseHeader: false,
      //   error: true,
      //   compact: true,
      //   maxWidth: 90,
      //   request: true,
      // ));
    }
  }

  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? data,
    Map<String, dynamic>? query,
    String? token,
    // CancelToken? cancelToken,
    // ProgressCallback? onRecviedProgress,
    // ProgressCallback? onSendProgress,
  }) async {
    return dio!.post(
      url,
      queryParameters: query,
      data: data,
      // cancelToken: cancelToken,
      // onReceiveProgress: onRecviedProgress,
      // onSendProgress: onSendProgress,
    );
  }

  static Future<Response> getData({
    required String url,
    String? token,
    CancelToken? cancelToken,
    ProgressCallback? progressCallback,
    Map<String, dynamic>? query,
  }) async {
    dio!.interceptors.requestLock.lock();
    dio!.options.headers['cookie'] = token;
    dio!.interceptors.requestLock.unlock();
    try {
      return await dio!.get(
        url,
        cancelToken: cancelToken,
        onReceiveProgress: progressCallback,
      );
    } catch (e) {
      if (e is DioError) {
        // final mss = DioExceptions.fromDioError(e).toString();
        // showToast(message: mss.toString(), status: ToastStatus.error);
        // ignore: null_argument_to_non_null_type
        return Future.value();
      } else {
        rethrow;
      }
    }
  }

  static Future<Response> putData({
    required String url,
    String? token,
    Map<String, dynamic>? data,
    Map<String, dynamic>? query,
  }) async {
    dio!.options.headers = {
      "Content-Type": 'application/json',
      "Authorization": token ?? '',
      //"lang":'ar'
    };
    return await dio!.put(
      url,
      data: data,
      queryParameters: query,
    );
  }

  static Future<Response> deleteData({
    required String url,
    Map<String, dynamic>? data,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    return dio!.delete(
      url,
      queryParameters: query,
      data: data,
    );
  }
}
