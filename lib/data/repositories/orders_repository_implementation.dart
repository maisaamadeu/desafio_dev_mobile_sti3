import 'package:dartz/dartz.dart';
import 'package:desafio_dev_mobile_sti3/core/network/failure.dart';
import 'package:desafio_dev_mobile_sti3/data/data.dart';
import 'package:desafio_dev_mobile_sti3/domain/domain.dart';

class OrdersRepositoryImplementation implements IOrdersRepository {
  final IRemoteOrdersDatasource remoteOrdersDatasource;
  final ILocalOrdersDatasource localOrdersDatasource;

  OrdersRepositoryImplementation({
    required this.remoteOrdersDatasource,
    required this.localOrdersDatasource,
  });

  @override
  Future<Either<Failure, String>> clearLocalOrders() async {
    try {
      final result = await localOrdersDatasource.clearOrders();
      return Right(result);
    } catch (e) {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, List<OrderEntity>>> fetchOrders() async {
    try {
      final result = await remoteOrdersDatasource.fetchOrders();
      return Right(result);
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<OrderEntity>>> getLocalOrders() async {
    try {
      final result = await localOrdersDatasource.getOrders();
      return Right(result);
    } catch (e) {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, String>> saveLocalOrders(
      SaveOrdersParams params) async {
    try {
      final result = await localOrdersDatasource.saveOrders(
        params.orders
            .map(
              (e) => orderModelMapper(e),
            )
            .toList(),
      );
      return Right(result);
    } catch (e) {
      return Left(CacheFailure());
    }
  }
}
