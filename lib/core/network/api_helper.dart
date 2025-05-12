import 'package:dio/dio.dart';

import 'endpoints.dart';

class ApiHelper {
  // Singleton
  static final ApiHelper _instance = ApiHelper._init();
  factory ApiHelper() => _instance;

  ApiHelper._init();

  // Dio instance with its options configured
  Dio dio = Dio(
    BaseOptions(
      baseUrl: EndPoints.baseUrl,
      connectTimeout: Duration(seconds: 10),
      receiveTimeout: Duration(seconds: 5),
    ),
  );

  // Post Request
  Future<Response> postRequest({
    required String endPoint,
    Map<String, dynamic>? data,
    bool isFormData = true,
  }) async {
    return await dio.post(
      endPoint,
      data: isFormData ? FormData.fromMap(data ?? {}) : data,
    );
  }
}
