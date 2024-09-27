import 'package:desafio_dev_mobile_sti3/data/data.dart';
import 'package:desafio_dev_mobile_sti3/domain/domain.dart';
import 'package:desafio_dev_mobile_sti3/presentation/view_models/view_models.dart';
import 'package:get/get.dart';

class OrdersViewModel extends GetxController {
  Rx<AppStatusEnum> appStatus = Rx<AppStatusEnum>(AppStatusEnum.initial);
  Rx<List<OrderModel>> orders = Rx<List<OrderModel>>([]);
  Rx<List<OrderModel>> filteredOrders = Rx<List<OrderModel>>([]);
  Rx<OrderModel?> selectedOrder = Rx<OrderModel?>(null);

  final BaseOrdersViewModel baseOrdersViewModel;

  OrdersViewModel({required this.baseOrdersViewModel});

  Future<void> fetchNetworkOrders() async {
    appStatus.value = AppStatusEnum.loading;
    final result = await baseOrdersViewModel.fetchOrders();
    appStatus.value = result.fold(
      (error) => AppStatusEnum.error,
      (data) {
        orders.value.assignAll(data);
        filteredOrders.value.assignAll(data);
        return AppStatusEnum.loaded;
      },
    );
  }

  Future<void> fetchLocalOrders() async {
    appStatus.value = AppStatusEnum.loading;
    final result = await baseOrdersViewModel.getLocalOrders();
    appStatus.value = result.fold(
      (error) => AppStatusEnum.error,
      (data) {
        orders.value.assignAll(data);
        filteredOrders.value.assignAll(data);
        return AppStatusEnum.loaded;
      },
    );
  }

  Future<void> filterOrdersByClientName(String clientName) async {
    if (clientName.isEmpty) {
      filteredOrders.value.assignAll(orders.value);
    }

    final result = orders.value
        .where(
          (order) => order.client.name.toLowerCase().contains(clientName),
        )
        .toList();
    filteredOrders.value = result;
  }

  void selectOrder(OrderModel order) {
    selectedOrder.value = order;
  }
}
