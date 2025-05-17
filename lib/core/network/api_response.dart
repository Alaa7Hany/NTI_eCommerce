import 'package:dio/dio.dart';

import '../helper/my_logger.dart';

class ApiResponse {
  final bool status;
  final int statusCode;
  final dynamic data;
  final String message;

  ApiResponse({
    required this.status,
    required this.statusCode,
    this.data,
    required this.message,
  });

  /*   * The ApiResponse class is used to handle API responses in a structured way.
   * It contains properties for status, statusCode, data, and message.
   * The class provides factory methods to create instances from Dio responses or errors.
   * It also includes methods to handle different types of Dio errors and server errors.
   */

  // Factory method to handle Dio responses
  factory ApiResponse.fromResponse(Response response) {
    return ApiResponse(
      status: response.data["status"] ?? false,
      statusCode: response.statusCode ?? 500,
      data: response.data,
      message: response.data["message"] ?? 'An error occurred.',
    );
  }

  // Factory method to handle Dio or other exceptions
  factory ApiResponse.fromError(dynamic error) {
    MyLogger.red(error.toString());
    if (error is DioException) {
      return ApiResponse(
        status: false,
        data: error.response?.data,
        statusCode:
            error.response != null ? error.response!.statusCode ?? 500 : 500,
        message: _handleDioError(error),
      );
    } else {
      // Handle other types of exceptions like logic errors (Nulls , out of range, etc)
      return ApiResponse(
        status: false,
        statusCode: 500,
        message: 'An error occurred.',
      );
    }
  }

  static String _handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return "Connection timeout, please try again.";
      case DioExceptionType.sendTimeout:
        return "Send timeout, please check your internet.";
      case DioExceptionType.receiveTimeout:
        return "Receive timeout, please try again later.";
      case DioExceptionType
          .badResponse: // Errors from server like: (invalid credentials, etc)
        return _handleServerError(error.response);
      case DioExceptionType.cancel:
        return "Request was cancelled.";
      case DioExceptionType.connectionError:
        return "No internet connection.";
      default:
        return "Unknown error occurred.";
    }
  }

  /// Handling errors from the server response
  static String _handleServerError(Response? response) {
    if (response == null) return "No response from server.";
    if (response.data is Map<String, dynamic>) {
      if (response.data["message"] != null) {
        MyLogger.red("----- Handle Server Error ${response.data["message"]}");
        return response.data["message"];
      }
      return "An error occurred.";
    }
    return "Server error: ${response.statusMessage}";
  }
}
