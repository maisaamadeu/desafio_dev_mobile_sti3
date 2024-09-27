import 'package:dartz/dartz.dart';
import 'package:desafio_dev_mobile_sti3/core/core.dart';
import 'package:desafio_dev_mobile_sti3/domain/domain.dart';

class ClearLocalOrdersUsecase extends UseCase<String, NoParams> {
  final IOrdersRepository repository;

  ClearLocalOrdersUsecase({required this.repository});

  @override
  Future<Either<Failure, String>> call(NoParams params) async {
    return await repository.clearLocalOrders();
  }
}
