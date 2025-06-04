import 'package:dartz/dartz.dart';
import 'package:juaso_mobile_app/core/network/error/failures.dart';
import 'package:juaso_mobile_app/core/utils/usecases/usecase.dart';
import 'package:juaso_mobile_app/features/auth/domain/repositories/abstract_auth_repository.dart';

class RegisterUseCase extends UseCase<String, RegisterParams> {
  final AbstractAuthRepository authRepository;

  RegisterUseCase(this.authRepository);

  @override
  Future<Either<Failure, String>> call(RegisterParams params) async {
    return await authRepository.register(
      email: params.email,
      full_name: params.full_name,
      password: params.password,
    );
  }
}

class RegisterParams {
  final String email;
  final String full_name;
  final String password;

  RegisterParams({
    required this.email,
    required this.full_name,
    required this.password,
  });
}