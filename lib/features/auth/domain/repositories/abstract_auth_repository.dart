
import 'package:dartz/dartz.dart';
import 'package:juaso_mobile_app/core/network/error/failures.dart';



abstract class AbstractAuthRepository {
  Future<Either<Failure, String>> register({
    required String email,
    required String full_name,
    required String password,
  });

  Future<Either<Failure, String>> verify({
    required String email,
    required String full_name,
    required int otp,
    required String password,
  });

  Future<Either<Failure, String>> login({
    required String email,
    required String password,
  });

}

