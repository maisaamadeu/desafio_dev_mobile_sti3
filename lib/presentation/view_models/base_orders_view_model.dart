import 'package:dartz/dartz.dart';
import 'package:desafio_dev_mobile_sti3/core/core.dart';
import 'package:desafio_dev_mobile_sti3/data/data.dart';
import 'package:desafio_dev_mobile_sti3/domain/domain.dart';

class BaseOrdersViewModel {
  final FetchOrdersUseCase fetchOrdersUseCase;
  final GetLocalOrdersUsecase getLocalOrdersUsecase;
  final ClearLocalOrdersUsecase clearLocalOrdersUsecase;
  final SaveLocalOrdersUsecase saveLocalOrdersUsecase;

  BaseOrdersViewModel({
    required this.fetchOrdersUseCase,
    required this.getLocalOrdersUsecase,
    required this.clearLocalOrdersUsecase,
    required this.saveLocalOrdersUsecase,
  });

  Future<Either<Failure, List<OrderModel>>> getLocalOrders() async {
    final result = await getLocalOrdersUsecase(NoParams());
    return await result.fold(
      (error) async {
        return Left(error);
      },
      (data) async {
        final newOrders = data.map((e) => orderModelMapper(e)).toList();
        return Right(newOrders);
      },
    );
  }

  Future<Either<Failure, List<OrderModel>>> fetchOrders() async {
    final result = await fetchOrdersUseCase(NoParams());
    return await result.fold(
      (error) async {
        return Left(error);
      },
      (data) async {
        final newOrders = data.map((e) => orderModelMapper(e)).toList();

        final clearResult = await clearLocalOrdersUsecase(NoParams());
        if (clearResult.isLeft()) {
          return Left(
            clearResult.fold(
              (failure) => failure,
              (success) => CacheFailure(),
            ),
          );
        }

        final saveResult = await saveLocalOrdersUsecase(
          SaveOrdersParams(orders: newOrders),
        );
        if (saveResult.isLeft()) {
          return Left(
            saveResult.fold(
              (failure) => failure,
              (success) => CacheFailure(),
            ),
          );
        }

        return Right(newOrders);
      },
    );
  }
}
