import 'package:dartz/dartz.dart';
import 'package:desafio_dev_mobile_sti3/core/network/network.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class NoParams {}
