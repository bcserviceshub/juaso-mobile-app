
import 'package:dartz/dartz.dart';
import 'package:juaso_mobile_app/core/network/error/eceptions.dart';
import 'package:juaso_mobile_app/core/network/error/failures.dart';
import 'package:juaso_mobile_app/features/auth/data/data_source/remote/abstract_Auth_api.dart';
import 'package:juaso_mobile_app/features/auth/domain/repositories/abstract_auth_repository.dart';

class AuthRepositoryImpl extends AbstractAuthRepository {
 final AbstractAuthApi authApi;

  AuthRepositoryImpl(this.authApi);

  @override
  Future<Either<Failure, String>> register({
    required String email,
  required String full_name,
  required String password,
  }) async {
    try {
      final result = await authApi.register(
        email: email,
        full_name: full_name,
        password: password,
      );
      return Right(result.data ?? result.message ?? '');
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    } on CancelTokenException catch (e) {
      return Left(CancelTokenFailure(e.message, e.statusCode));
    }
  }

  @override
  Future<Either<Failure, String>> verify({
     required String email,
  required int otp,
  required String full_name,
  required String password,
  }) async {
    try {
      final result = await authApi.verify(
        email: email,
        otp: otp,
        full_name: full_name,
        password: password,
      );
      return Right(result.data ?? result.message ?? '');
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    } on CancelTokenException catch (e) {
      return Left(CancelTokenFailure(e.message, e.statusCode));
    }
  }

  @override
  Future<Either<Failure, String>> login({
    required String email,
    required String password,
  }) async {
    try { 
      final result = await authApi.login(
        email: email,
        password: password,
      );
      return Right(result.data ?? result.message ?? '');
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    } on CancelTokenException catch (e) {
      return Left(CancelTokenFailure(e.message, e.statusCode));
    }
  }
}

