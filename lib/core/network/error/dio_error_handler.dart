import 'dart:io';
import 'package:dio/dio.dart';

String handleDioError(DioException error) {
  // 1. If we received a valid response with an error structure
  if (error.response?.data is Map<String, dynamic>) {
    final data = error.response!.data as Map<String, dynamic>;

    if (data.containsKey('error') && data['error'] is String) {
      return data['error'];
    }
  }

  // 2. Handle Dio-related error types
  switch (error.type) {
    case DioExceptionType.cancel:
      return "Request to server was cancelled.";
    case DioExceptionType.connectionTimeout:
      return "Connection timeout with the server.";
    case DioExceptionType.receiveTimeout:
      return "Receive timeout in connection with the server.";
    case DioExceptionType.sendTimeout:
      return "Send timeout in connection with the server.";
    case DioExceptionType.badCertificate:
      return "SSL certificate verification failed.";
    case DioExceptionType.connectionError:
      return "No internet connection. Please check your network.";
    case DioExceptionType.unknown:
      if (error.error is SocketException) {
        return "No internet connection. Please check your network.";
      }
      return "An unknown error occurred.";
    case DioExceptionType.badResponse:
      final statusCode = error.response?.statusCode ?? 0;
      switch (statusCode) {
        case 400:
          return "Bad request.";
        case 401:
          return "Unauthorized. Please login again.";
        case 403:
          return "Forbidden.";
        case 404:
          return "Resource not found.";
        case 409:
          return "Conflict. Duplicate or invalid data.";
        case 500:
          return "Internal server error. Please try again later.";
        default:
          return "Server error [${statusCode}].";
      }
  }

  
}
