import 'package:flutter/material.dart';
import 'package:dartz/dartz.dart';
import 'package:juaso_mobile_app/core/network/error/failures.dart';
import 'package:juaso_mobile_app/features/auth/domain/usecases/login_usecase.dart';
import 'package:juaso_mobile_app/features/auth/domain/usecases/register_usecase.dart';
import 'package:juaso_mobile_app/features/auth/domain/usecases/verify_usecase.dart';

class AuthViewModel extends ChangeNotifier {
  final RegisterUseCase registerUseCase;
  final VerifyUseCase verifyUseCase;
  final LoginUseCase loginUseCase;


  AuthViewModel({
    required this.registerUseCase,
    required this.verifyUseCase,
    required this.loginUseCase,
  });

  bool _isLoadingRegister = false;
  String? _errorMessage;
  String? _token;
  bool _isLoadingVerify = false;
  bool _isLoadingLogin = false;


  bool get isLoadingRegister => _isLoadingRegister;
  bool get isLoadingVerify => _isLoadingVerify;
  bool get isLoadingLogin => _isLoadingLogin;

  String? get errorMessage => _errorMessage;
  String? get token => _token;
  String? email;
  String? full_name;
  String? password;

  void _setLoadingRegister(bool value) {
    _isLoadingRegister = value;
    notifyListeners();
  }

  void _setLoadingVerify(bool value) {
    _isLoadingVerify = value;
    notifyListeners();
  }

  void _setLoadingLogin(bool value) {
    _isLoadingLogin = value;
    notifyListeners();
  }

  void _setError(String message) {
    _errorMessage = message;
    _setLoadingRegister(false);
    _setLoadingVerify(false);
    _setLoadingLogin(false);
  }

  void clearError() {
    _errorMessage = null;
    notifyListeners();
  }

 

  Future<void> register({
    required String email,
    required String full_name,
    required String password,
  }) async {
    this.email = email;
    this.full_name = full_name;
    this.password = password;
    _setLoadingRegister(true);
    final Either<Failure, String> result = await registerUseCase(
      RegisterParams(
        email: email,
        full_name: full_name,
        password: password,
      ),
    );

    result.fold(
      (failure) => _setError(failure.errorMessage),
      (token) {
        _token = token;
        _setLoadingRegister(false);
      },
    );
  }

  Future<void> verify({
    required String email,
    required int otp,
    required String full_name,
    required String password,
  }) async {
    this.email = email;
    this.full_name = full_name;
    this.password = password;
    _setLoadingVerify(true);
    final Either<Failure, String> result = await verifyUseCase(
      VerifyParams(
        email: email,
        otp: otp,
        full_name: full_name,
        password: password,
      ),
    );

    result.fold(
      (failure) => _setError(failure.errorMessage),
      (token) {
        _token = token;
        _setLoadingVerify(false);
      },
    );
  }

  Future<void> login({
    required String email,
    required String password,
  }) async {
    _setLoadingLogin(true);
    final Either<Failure, String> result = await loginUseCase(
      LoginParams(
        email: email,
        password: password,
      ),
    );

    result.fold(
      (failure) => _setError(failure.errorMessage),
      (token) {
        _token = token;
        _setLoadingLogin(false);
      },
    );
  }
}
