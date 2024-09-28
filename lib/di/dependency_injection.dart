import 'package:desafio_dev_mobile_sti3/data/data.dart';
import 'package:desafio_dev_mobile_sti3/domain/domain.dart';
import 'package:desafio_dev_mobile_sti3/presentation/presentation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:get/get.dart';

Future<void> initOrders() async {
  final ordersBox = await Hive.openLazyBox("orders");

  Get.lazyPut<IRemoteOrdersDatasource>(
    () => RemoteOrdersDatasourceImplementation(
      serverApiClient: Get.find(),
    ),
  );

  Get.lazyPut<ILocalOrdersDatasource>(
    () => LocalOrdersDatasourceImplementation(
      box: ordersBox,
    ),
  );

  Get.lazyPut<IOrdersRepository>(
    () => OrdersRepositoryImplementation(
      remoteOrdersDatasource: Get.find(),
      localOrdersDatasource: Get.find(),
    ),
  );

  Get.lazyPut<FetchOrdersUseCase>(
    () => FetchOrdersUseCase(
      repository: Get.find(),
    ),
  );

  Get.lazyPut<GetLocalOrdersUsecase>(
    () => GetLocalOrdersUsecase(
      repository: Get.find(),
    ),
  );

  Get.lazyPut<SaveLocalOrdersUsecase>(
    () => SaveLocalOrdersUsecase(
      repository: Get.find(),
    ),
  );

  Get.lazyPut<ClearLocalOrdersUsecase>(
    () => ClearLocalOrdersUsecase(
      repository: Get.find(),
    ),
  );

  Get.lazyPut<OrdersStreamController>(
    () => OrdersStreamController(),
  );

  Get.lazyPut<OrdersViewModel>(
    () => OrdersViewModel(
      fetchOrdersUseCase: Get.find(),
      getLocalOrdersUsecase: Get.find(),
      clearLocalOrdersUsecase: Get.find(),
      saveLocalOrdersUsecase: Get.find(),
      ordersStreamController: Get.find(),
    ),
  );

  Get.lazyPut<ReportsViewModel>(
    () => ReportsViewModel(
      fetchOrdersUseCase: Get.find(),
      getLocalOrdersUsecase: Get.find(),
      clearLocalOrdersUsecase: Get.find(),
      saveLocalOrdersUsecase: Get.find(),
      ordersStreamController: Get.find(),
    ),
  );

  Get.lazyPut<ChartsViewModel>(() => ChartsViewModel(
        fetchOrdersUseCase: Get.find(),
        getLocalOrdersUsecase: Get.find(),
        clearLocalOrdersUsecase: Get.find(),
        saveLocalOrdersUsecase: Get.find(),
        ordersStreamController: Get.find(),
      ));
}
