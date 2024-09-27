import 'package:desafio_dev_mobile_sti3/data/data.dart';
import 'package:desafio_dev_mobile_sti3/domain/domain.dart';
import 'package:hive_flutter/hive_flutter.dart';

class LocalOrdersDatasourceImplementation implements ILocalOrdersDatasource {
  final LazyBox box;

  LocalOrdersDatasourceImplementation({required this.box});

  @override
  Future<String> clearOrders() async {
    try {
      await box.clear();
      return 'Orders cleared successfully';
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<OrderModel>> getOrders() async {
    try {
      final keys = box.keys;
      final orders = await Future.wait(keys.map((key) => box.get(key)));
      final ordersMapped =
          orders.map((e) => orderModelMapper(e as OrderEntity)).toList();

      return ordersMapped;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<String> saveOrders(List<OrderModel> orders) async {
    try {
      for (var order in orders) {
        box.put(order.id, order);
      }

      return 'Orders saved successfully';
    } catch (e) {
      rethrow;
    }
  }
}
