import 'package:desafio_dev_mobile_sti3/core/core.dart';
import 'package:desafio_dev_mobile_sti3/data/data.dart';
import 'package:desafio_dev_mobile_sti3/domain/domain.dart';
import 'package:desafio_dev_mobile_sti3/presentation/presentation.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> initOrders() async {
  final ordersBox = await Hive.openLazyBox("orders");

  getIt.registerLazySingleton<IRemoteOrdersDatasource>(
    () => RemoteOrdersDatasourceImplementation(
      serverApiClient: getIt(),
    ),
  );

  getIt.registerLazySingleton<ILocalOrdersDatasource>(
    () => LocalOrdersDatasourceImplementation(
      box: ordersBox,
    ),
  );

  getIt.registerLazySingleton<IOrdersRepository>(
    () => OrdersRepositoryImplementation(
      remoteOrdersDatasource: getIt(),
      localOrdersDatasource: getIt(),
    ),
  );

  getIt.registerLazySingleton<FetchOrdersUseCase>(
    () => FetchOrdersUseCase(
      repository: getIt(),
    ),
  );

  getIt.registerLazySingleton<GetLocalOrdersUsecase>(
    () => GetLocalOrdersUsecase(
      repository: getIt(),
    ),
  );

  getIt.registerLazySingleton<SaveLocalOrdersUsecase>(
    () => SaveLocalOrdersUsecase(
      repository: getIt(),
    ),
  );

  getIt.registerLazySingleton<ClearLocalOrdersUsecase>(
    () => ClearLocalOrdersUsecase(
      repository: getIt(),
    ),
  );

  getIt.registerLazySingleton(
    () => BaseOrdersViewModel(
      fetchOrdersUseCase: getIt(),
      getLocalOrdersUsecase: getIt(),
      clearLocalOrdersUsecase: getIt(),
      saveLocalOrdersUsecase: getIt(),
    ),
  );

  getIt.registerLazySingleton(
    () => OrdersViewModel(
      baseOrdersViewModel: getIt(),
    ),
  );

  getIt.registerLazySingleton(
    () => ReportsViewModel(
      baseOrdersViewModel: getIt(),
    ),
  );

  getIt.registerLazySingleton(
    () => ChartsViewModel(
      baseOrdersViewModel: getIt(),
    ),
  );
}
