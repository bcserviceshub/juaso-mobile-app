import 'package:dartz/dartz.dart';
import 'package:juaso_mobile_app/core/network/error/failures.dart';


abstract class UseCase<T, Params> {
  Future<Either<Failure, T>> call(Params params);
}

class NoParams {}
