import 'package:desafio_dev_mobile_sti3/data/data.dart';
import 'package:desafio_dev_mobile_sti3/presentation/presentation.dart';

class ChartsViewModel extends BaseOrdersViewModel {
  ChartsViewModel({
    required super.fetchOrdersUseCase,
    required super.getLocalOrdersUsecase,
    required super.clearLocalOrdersUsecase,
    required super.saveLocalOrdersUsecase,
    required super.ordersStreamController,
  });

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
