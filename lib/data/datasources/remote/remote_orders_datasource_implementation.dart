import 'dart:convert';

import 'package:desafio_dev_mobile_sti3/core/core.dart';
import 'package:desafio_dev_mobile_sti3/data/data.dart';

class RemoteOrdersDatasourceImplementation extends IRemoteOrdersDatasource {
  final ServerApiClient serverApiClient;

  RemoteOrdersDatasourceImplementation({required this.serverApiClient});

  @override
  Future<List<OrderModel>> fetchOrders() async {
    try {
      final response = await serverApiClient.get('pedido');

      final orders = (jsonDecode(response.body) as List).map(
        (order) {
          return OrderModel.fromJson(order);
        },
      ).toList();

      return orders;
    } catch (e) {
      rethrow;
    }
  }
}
