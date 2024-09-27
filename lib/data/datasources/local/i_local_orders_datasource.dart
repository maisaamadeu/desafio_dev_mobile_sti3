import 'package:desafio_dev_mobile_sti3/data/data.dart';

abstract class ILocalOrdersDatasource {
  Future<List<OrderModel>> getOrders();
  Future<String> saveOrders(List<OrderModel> orders);
  Future<String> clearOrders();
}
