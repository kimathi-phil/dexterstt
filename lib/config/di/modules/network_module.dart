import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@module
abstract class NetworkModule {
  @Named('Token')
  String get token => "Bearer KsJ5Ag3";

  @Named('BaseUrl')
  String get baseHttpUrl =>
      'https://35.207.149.36:443/stt_flutter_tech_assignment';

  @lazySingleton
  PrettyDioLogger get prettyLogger {
    return PrettyDioLogger(requestHeader: true, requestBody: true);
  }

  @lazySingleton
  Dio dio(BaseOptions baseOptions, PrettyDioLogger logger) {
    final interceptors = <Interceptor>[if (kDebugMode) logger];
    return Dio(baseOptions)..interceptors.addAll(interceptors);
  }

  @lazySingleton
  BaseOptions dioBaseOptions(
    @Named('BaseUrl') String url,
    @Named('Token') String tkn,
  ) {
    return BaseOptions(
      baseUrl: url,
      connectTimeout: Duration(milliseconds: 300000),
      followRedirects: false,
      headers: {
        'Authorization': tkn,
        'Content-Type': 'multipart/form-data',
      },
    );
  }
}
