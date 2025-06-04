import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:juaso_mobile_app/core/app_routes.dart';
import 'package:juaso_mobile_app/core/utils/flavor_config/flavor_model.dart';
import 'package:juaso_mobile_app/core/utils/injections.dart';
import 'package:juaso_mobile_app/core/utils/theme_items/app_theme.dart';
import 'package:juaso_mobile_app/core/utils/theme_items/theme_provider.dart';
import 'package:juaso_mobile_app/features/auth/domain/usecases/login_usecase.dart';
import 'package:juaso_mobile_app/features/auth/domain/usecases/register_usecase.dart';
import 'package:juaso_mobile_app/features/auth/domain/usecases/verify_usecase.dart';
import 'package:juaso_mobile_app/features/auth/presentation/pages/bc/viewmodel/auth_view_model.dart';
import 'package:provider/provider.dart';


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => AuthViewModel(
          registerUseCase: sl<RegisterUseCase>(),
          verifyUseCase: sl<VerifyUseCase>(),
          loginUseCase: sl<LoginUseCase>(),
          
        ),
       
  ), 
      ],
      child: ScreenUtilInit(
        builder: (_, child) => Directionality(
          textDirection: TextDirection.ltr,
          child: currentFlavor?.showBanner == "true"
              ? Banner(
                  message: currentFlavor!.name,
                  location: BannerLocation.topStart,
                  child: const AppContent(),
                )
              : const AppContent(),
        ),
      ),
    );
  }
}

class AppContent extends StatelessWidget {
  const AppContent({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<ConnectivityResult>>(
      stream: Connectivity().onConnectivityChanged,
       builder: (context, snapshot){
        return Scaffold(
          body: Column(
            children: [
              Expanded(
                child: Builder(
                  builder: (BuildContext context)=> MaterialApp.router(
                    title: 'juaso',
                    routerConfig: appRouter,
                    theme: getAppTheme(
                       context.watch<ThemeProvider>().isDarkMode,
                      context
                      ),
                  ),
                ),
              ),
              Visibility(
                visible: snapshot.hasData && 
                    snapshot.data!.contains(ConnectivityResult.none),
                child: const Directionality(
                  textDirection: TextDirection.ltr,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "No internet connection",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
       }
    );
  }
}
