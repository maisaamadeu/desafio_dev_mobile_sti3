import 'package:desafio_dev_mobile_sti3/data/data.dart';
import 'package:desafio_dev_mobile_sti3/presentation/presentation.dart';
import 'package:get/get.dart';

class OrdersViewModel extends BaseOrdersViewModel {
  Rx<OrderModel?> selectedOrder = Rx<OrderModel?>(null);
  RxString clientName = "".obs;

  OrdersViewModel({
    required super.fetchOrdersUseCase,
    required super.getLocalOrdersUsecase,
    required super.clearLocalOrdersUsecase,
    required super.saveLocalOrdersUsecase,
    required super.ordersStreamController,
  });

  @override
  onInit() {
    super.onInit();
    setCallback(
      (value) {
        filterOrdersByClientName();
      },
    );
  }

  Future<void> filterOrdersByClientName() async {
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

  void updateClientName(String clientName) {
    this.clientName.value = clientName;
  }
}
