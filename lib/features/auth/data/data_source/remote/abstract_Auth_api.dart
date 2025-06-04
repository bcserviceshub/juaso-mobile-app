
import 'package:juaso_mobile_app/core/network/api_response.dart';

abstract class AbstractAuthApi {
  Future<ApiResponse<String>> register({
    required String email,
    required String full_name,
    required String password,
  });

  Future<ApiResponse<String>> verify({
    required String email,
    required String full_name,
    required String password,
    required int otp,
  });

  Future<ApiResponse<String>> login({
    required String email,
    required String password,
  });
}


