import 'package:desafio_dev_mobile_sti3/data/data.dart';
import 'package:desafio_dev_mobile_sti3/domain/domain.dart';
import 'package:desafio_dev_mobile_sti3/presentation/view_models/view_models.dart';
import 'package:get/get.dart';

class ChartsViewModel extends GetxController {
  final Rx<AppStatusEnum> appStatus = Rx<AppStatusEnum>(AppStatusEnum.initial);
  final Rx<List<OrderModel>> orders = Rx<List<OrderModel>>([]);

  final BaseOrdersViewModel baseOrdersViewModel;

  ChartsViewModel({
    required this.baseOrdersViewModel,
  });

  Future<void> fetchNetworkOrders() async {
    appStatus.value = AppStatusEnum.loading;
    final result = await baseOrdersViewModel.fetchOrders();
    appStatus.value = result.fold(
      (error) => AppStatusEnum.error,
      (data) {
        orders.value.assignAll(data);
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
        return AppStatusEnum.loaded;
      },
    );
  }

  List<ItemModel> mostSoldProducts() {
    final List<ItemModel> items = [];
    for (var order in orders.value) {
      for (var item in order.items) {
        final index =
            items.indexWhere((element) => element.productId == item.productId);
        if (index != -1) {
          items[index] = items[index].copyWith(
            quantity: items[index].quantity + item.quantity,
          );
        } else {
          items.add(itemModelMapper(item));
        }
      }
    }
    items.sort((a, b) => b.quantity.compareTo(a.quantity));
    return items;
  }

  List<ClientTotalAmount> topClients() {
    final List<ClientTotalAmount> topClients = [];

    for (var order in orders.value) {
      final index = topClients
          .indexWhere((element) => element.client.id == order.client.id);

      if (index != -1) {
        topClients[index] = topClients[index].copyWith(
          totalAmount: topClients[index].totalAmount + order.totalAmount,
        );
      } else {
        topClients.add(
          ClientTotalAmount(
            client: clientModelMapper(order.client),
            totalAmount: order.totalAmount,
          ),
        );
      }
    }

    topClients.sort((a, b) => b.totalAmount.compareTo(a.totalAmount));

    return topClients;
  }
}
