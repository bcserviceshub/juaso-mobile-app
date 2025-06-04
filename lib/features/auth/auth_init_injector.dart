


import 'package:juaso_mobile_app/core/network/dio_network.dart';
import 'package:juaso_mobile_app/core/utils/injections.dart';
import 'package:juaso_mobile_app/features/auth/data/data_source/remote/Auth_impl_api.dart';
import 'package:juaso_mobile_app/features/auth/data/repositories/auth_repo_impl.dart';
import 'package:juaso_mobile_app/features/auth/domain/repositories/abstract_auth_repository.dart';
import 'package:juaso_mobile_app/features/auth/domain/usecases/login_usecase.dart';
import 'package:juaso_mobile_app/features/auth/domain/usecases/register_usecase.dart';
import 'package:juaso_mobile_app/features/auth/domain/usecases/verify_usecase.dart';

initAuthInjections(){
  sl.registerSingleton<AuthImplApi>(AuthImplApi(DioNetwork.appAPI));
  sl.registerSingleton<AbstractAuthRepository>(AuthRepositoryImpl(sl<AuthImplApi>()));
  sl.registerSingleton<RegisterUseCase>(RegisterUseCase(sl()));
  sl.registerSingleton<VerifyUseCase>(VerifyUseCase(sl()));
  sl.registerSingleton<LoginUseCase>(LoginUseCase(sl()));
}

