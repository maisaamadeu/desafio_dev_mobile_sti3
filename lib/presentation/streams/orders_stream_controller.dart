import 'dart:async';

import 'package:desafio_dev_mobile_sti3/data/data.dart';

class OrdersStreamController {
  final StreamController _streamController =
      StreamController<List<OrderModel>>.broadcast();
  Stream<List<OrderModel>> get stream =>
      _streamController.stream as Stream<List<OrderModel>>;

  void updateOrders(List<OrderModel> orders) {
    _streamController.sink.add(orders);
  }

  void dispose() {
    _streamController.close();
  }
}
