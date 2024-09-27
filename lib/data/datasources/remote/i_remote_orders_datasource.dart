import 'package:desafio_dev_mobile_sti3/data/data.dart';

abstract class IRemoteOrdersDatasource {
  Future<List<OrderModel>> fetchOrders();
}
