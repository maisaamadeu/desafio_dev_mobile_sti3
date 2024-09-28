import 'package:desafio_dev_mobile_sti3/core/core.dart';
import 'package:desafio_dev_mobile_sti3/data/data.dart';
import 'package:desafio_dev_mobile_sti3/domain/domain.dart';
import 'package:desafio_dev_mobile_sti3/presentation/presentation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BaseOrdersViewModel extends GetxController {
  final FetchOrdersUseCase fetchOrdersUseCase;
  final GetLocalOrdersUsecase getLocalOrdersUsecase;
  final ClearLocalOrdersUsecase clearLocalOrdersUsecase;
  final SaveLocalOrdersUsecase saveLocalOrdersUsecase;
  final OrdersStreamController ordersStreamController;

  BaseOrdersViewModel({
    required this.fetchOrdersUseCase,
    required this.getLocalOrdersUsecase,
    required this.clearLocalOrdersUsecase,
    required this.saveLocalOrdersUsecase,
    required this.ordersStreamController,
  });

  @override
  onInit() {
    super.onInit();
    fetchLocalOrders();
    ordersStreamController.stream.listen((newOrders) {
      orders.value.assignAll(newOrders);
      filteredOrders.value.assignAll(newOrders);
      callback?.call(newOrders);
    });
  }

  final Rx<AppStatusEnum> appStatus = Rx<AppStatusEnum>(AppStatusEnum.initial);
  final Rx<List<OrderModel>> orders = Rx<List<OrderModel>>([]);
  final Rx<List<OrderModel>> filteredOrders = Rx<List<OrderModel>>([]);
  ValueChanged<List<OrderModel>>? callback;

  Future<void> fetchLocalOrders() async {
    appStatus.value = AppStatusEnum.loading;
    final result = await getLocalOrdersUsecase(NoParams());
    result.fold(
      (error) {
        appStatus.value = AppStatusEnum.error;
      },
      (data) {
        final newOrders = data
            .map(
              (e) => orderModelMapper(e),
            )
            .toList();

        ordersStreamController.updateOrders(newOrders);
        appStatus.value = AppStatusEnum.loaded;
      },
    );
  }

  Future<void> fetchNetworkOrders() async {
    appStatus.value = AppStatusEnum.loading;
    final result = await fetchOrdersUseCase(NoParams());
    result.fold(
      (error) async {
        appStatus.value = AppStatusEnum.error;
      },
      (data) async {
        final newOrders = data.map((e) => orderModelMapper(e)).toList();

        final clearResult = await clearLocalOrdersUsecase(NoParams());
        if (clearResult.isLeft()) {
          appStatus.value = AppStatusEnum.error;
          return;
        }
        final saveResult = await saveLocalOrdersUsecase(
          SaveOrdersParams(orders: newOrders),
        );
        if (saveResult.isLeft()) {
          appStatus.value = AppStatusEnum.error;
          return;
        }
        ordersStreamController.updateOrders(newOrders);
        appStatus.value = AppStatusEnum.loaded;
      },
    );
  }

  void setCallback(ValueChanged<List<OrderModel>> callback) {
    this.callback = callback;
  }
}
