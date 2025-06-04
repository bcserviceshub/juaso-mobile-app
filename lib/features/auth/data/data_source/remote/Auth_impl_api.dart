

import 'package:dio/dio.dart';
import 'package:juaso_mobile_app/core/network/api_response.dart';
import 'package:juaso_mobile_app/core/network/error/dio_error_handler.dart';
import 'package:juaso_mobile_app/core/network/error/eceptions.dart';
import 'package:juaso_mobile_app/core/utils/constant/network_constant.dart';
import 'package:juaso_mobile_app/features/auth/data/data_source/remote/abstract_Auth_api.dart';

class AuthImplApi extends AbstractAuthApi{

  final Dio dio;
  CancelToken cancelToken = CancelToken();

  AuthImplApi(this.dio);

  @override
  Future<ApiResponse<String>> register({
    required String email,
    required String full_name,
    required String password,
  }) async {
      try {
      final result = await dio.post(
        initiateRegistrationUrl,
        data: {
          'email': email,
          'full_name': full_name,
          'password': password,
        },
        cancelToken: cancelToken,
      );

      if (result.data == null) {
        throw ServerException("Empty response from server", result.statusCode);
      }

      return ApiResponse<String>(
        message: result.data['message'],
        statusCode: result.statusCode,
        data: result.data['message'],
      );
    } on DioException catch (e) {
      if (e.type == DioExceptionType.cancel) {
        throw CancelTokenException(handleDioError(e), e.response?.statusCode);
      } else {
        throw ServerException(handleDioError(e), e.response?.statusCode);
      }
    } catch (e) {
      throw ServerException(e.toString(), null);
    }


  }

  @override
  Future<ApiResponse<String>> verify({
    required String email,
    required String full_name,
    required String password,
    required int otp,
  }) async {  
     try {
      final result = await dio.post(
        verifyRegistrationUrl,
        data: {
          'email': email,
          'full_name': full_name,
          'otp': otp,
          'password': password,
        },
        cancelToken: cancelToken,
      );

      if (result.data == null) {
        throw ServerException("Empty response from server", result.statusCode);
      }

      return ApiResponse<String>(
        message: result.data['message'],
        statusCode: result.statusCode,
        data: result.data['token'],
      );
    } on DioException catch (e) {
      if (e.type == DioExceptionType.cancel) {
        throw CancelTokenException(handleDioError(e), e.response?.statusCode);
      } else {
        throw ServerException(handleDioError(e), e.response?.statusCode);
      }
    } catch (e) {
      throw ServerException(e.toString(), null);
    }
  }

  @override 
  Future<ApiResponse<String>> login({
    required String email,
    required String password,
  }) async {
    try {
      final result = await dio.post(
        loginUrl,
        data: {
          'email': email,
          'password': password,
        },
        cancelToken: cancelToken,
      );

      if (result.data == null) {
        throw ServerException("Empty response from server", result.statusCode);
      }

      return ApiResponse<String>(
        message: result.data['message'],
        statusCode: result.statusCode,
        data: result.data['token'],
      );
    } on DioException catch (e) {
      if (e.type == DioExceptionType.cancel) {
        throw CancelTokenException(handleDioError(e), e.response?.statusCode);
      } else {
        throw ServerException(handleDioError(e), e.response?.statusCode);
      }
    } catch (e) {
      throw ServerException(e.toString(), null);
    }
  }
}




