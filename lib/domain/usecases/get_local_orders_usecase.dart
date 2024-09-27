import 'package:dartz/dartz.dart';
import 'package:desafio_dev_mobile_sti3/core/core.dart';
import 'package:desafio_dev_mobile_sti3/domain/domain.dart';

class GetLocalOrdersUsecase extends UseCase<List<OrderEntity>, NoParams> {
  final IOrdersRepository repository;

  GetLocalOrdersUsecase({required this.repository});

  @override
  Future<Either<Failure, List<OrderEntity>>> call(NoParams params) async {
    return await repository.getLocalOrders();
  }
}
