


import 'package:get_it/get_it.dart';
import 'package:juaso_mobile_app/core/network/dio_network.dart';
import 'package:juaso_mobile_app/core/utils/kog/app_logger.dart';
import 'package:juaso_mobile_app/features/auth/auth_init_injector.dart';

final sl = GetIt.instance;

Future<void> initInjections() async {
  await initDioInjections();
  await initAuthInjections();

}


Future<void> initDioInjections() async {
  initRootLogger();
  DioNetwork.initDio();
}
