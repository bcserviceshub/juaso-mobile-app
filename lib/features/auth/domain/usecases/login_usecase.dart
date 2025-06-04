
import 'package:dartz/dartz.dart';
import 'package:juaso_mobile_app/core/network/error/failures.dart';
import 'package:juaso_mobile_app/core/utils/usecases/usecase.dart';
import 'package:juaso_mobile_app/features/auth/domain/repositories/abstract_auth_repository.dart';

class LoginUseCase extends UseCase<String, LoginParams> {
  final AbstractAuthRepository authRepository;

  LoginUseCase(this.authRepository);

  @override
  Future<Either<Failure, String>> call(LoginParams params) async {
    return authRepository.login(email: params.email, password: params.password);

  }
}



class LoginParams {
  final String email;
  final String password;

  LoginParams({required this.email, required this.password});
}



