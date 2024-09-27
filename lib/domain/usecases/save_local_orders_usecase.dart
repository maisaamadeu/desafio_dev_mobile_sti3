import 'package:dartz/dartz.dart';
import 'package:desafio_dev_mobile_sti3/core/core.dart';
import 'package:desafio_dev_mobile_sti3/domain/domain.dart';

class SaveLocalOrdersUsecase extends UseCase<String, SaveOrdersParams> {
  final IOrdersRepository repository;

  SaveLocalOrdersUsecase({required this.repository});

  @override
  Future<Either<Failure, String>> call(SaveOrdersParams params) async {
    return await repository.saveLocalOrders(params);
  }
}
