import 'package:desafio_dev_mobile_sti3/domain/domain.dart';
import 'package:hive/hive.dart';
import 'package:equatable/equatable.dart';

part '../hive_adapters/order_entity.g.dart';

@HiveType(typeId: 3)
class OrderEntity extends Equatable {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final int number;
  @HiveField(2)
  final DateTime creationDate;
  @HiveField(3)
  final DateTime modificationDate;
  @HiveField(4)
  final String status;
  @HiveField(5)
  final double discount;
  @HiveField(6)
  final double shipping;
  @HiveField(7)
  final double subTotal;
  @HiveField(8)
  final double totalAmount;
  @HiveField(9)
  final ClientEntity client;
  @HiveField(10)
  final DeliveryAddressEntity deliveryAddress;
  @HiveField(11)
  final List<ItemEntity> items;
  @HiveField(12)
  final List<PaymentEntity> payments;

  const OrderEntity({
    required this.id,
    required this.number,
    required this.creationDate,
    required this.modificationDate,
    required this.status,
    required this.discount,
    required this.shipping,
    required this.subTotal,
    required this.totalAmount,
    required this.client,
    required this.deliveryAddress,
    required this.items,
    required this.payments,
  });

  @override
  List<Object?> get props => [
        id,
        number,
        creationDate,
        modificationDate,
        status,
        discount,
        shipping,
        subTotal,
        totalAmount,
        client,
        deliveryAddress,
        items,
        payments,
      ];

  @override
  String toString() {
    return ''''
    OrderEntity {
      id: $id,
      number: $number,
      creationDate: $creationDate,
      modificationDate: $modificationDate,
      status: $status,
      discount: $discount,
      shipping: $shipping,
      subTotal: $subTotal,
      totalAmount: $totalAmount,
      client: $client,
      deliveryAddress: $deliveryAddress,
      items: $items,
      payments: $payments,
    }
  ''';
  }
}
