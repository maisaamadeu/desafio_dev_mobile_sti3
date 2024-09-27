import 'package:desafio_dev_mobile_sti3/data/data.dart';
import 'package:desafio_dev_mobile_sti3/domain/domain.dart';

OrderEntity orderEntityMapper(OrderModel order) {
  return OrderEntity(
    id: order.id,
    number: order.number,
    creationDate: order.creationDate,
    modificationDate: order.modificationDate,
    status: order.status,
    discount: order.discount,
    shipping: order.shipping,
    subTotal: order.subTotal,
    totalAmount: order.totalAmount,
    client: order.client,
    deliveryAddress: order.deliveryAddress,
    items: order.items,
    payments: order.payments,
  );
}

OrderModel orderModelMapper(OrderEntity order) {
  return OrderModel(
    id: order.id,
    number: order.number,
    creationDate: order.creationDate,
    modificationDate: order.modificationDate,
    status: order.status,
    discount: order.discount,
    shipping: order.shipping,
    subTotal: order.subTotal,
    totalAmount: order.totalAmount,
    client: order.client,
    deliveryAddress: order.deliveryAddress,
    items: order.items,
    payments: order.payments,
  );
}
