import 'package:dartz/dartz.dart';
import 'package:desafio_dev_mobile_sti3/core/network/network.dart';
import 'package:desafio_dev_mobile_sti3/domain/domain.dart';

abstract class IOrdersRepository {
  // NETWORK
  Future<Either<Failure, List<OrderEntity>>> fetchOrders();

  // LOCAL
  Future<Either<Failure, String>> saveLocalOrders(SaveOrdersParams params);
  Future<Either<Failure, List<OrderEntity>>> getLocalOrders();
  Future<Either<Failure, String>> clearLocalOrders();
}
