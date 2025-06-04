
import 'package:dartz/dartz.dart';
import 'package:juaso_mobile_app/core/network/error/failures.dart';
import 'package:juaso_mobile_app/core/utils/usecases/usecase.dart';
import 'package:juaso_mobile_app/features/auth/domain/repositories/abstract_auth_repository.dart';

/// VERIFY USE CASE
class VerifyUseCase extends UseCase<String, VerifyParams> {
  final AbstractAuthRepository authRepository;

  VerifyUseCase(this.authRepository);

  @override
  Future<Either<Failure, String>> call(VerifyParams params) async {
    return await authRepository.verify(
      email: params.email,
      full_name: params.full_name,
      otp: params.otp,
      password: params.password,
    );
  }
}

class VerifyParams {
  final String email;
  final String full_name;
  final int otp;
  final String password;

  VerifyParams({
    required this.email,
    required this.full_name,
    required this.otp,
    required this.password,
  });
}

