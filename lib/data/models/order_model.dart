import 'package:desafio_dev_mobile_sti3/domain/domain.dart';
import 'package:desafio_dev_mobile_sti3/data/models/models.dart';

class OrderModel extends OrderEntity {
  const OrderModel({
    required super.id,
    required super.number,
    required super.creationDate,
    required super.modificationDate,
    required super.status,
    required super.discount,
    required super.shipping,
    required super.subTotal,
    required super.totalAmount,
    required super.client,
    required super.deliveryAddress,
    required super.items,
    required super.payments,
  });

  OrderStatusEnum get statusEnum => OrderStatusEnumExtension.fromString(status);

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      id: json['id'],
      number: json['numero'],
      creationDate: DateTime.parse(json['dataCriacao']),
      modificationDate: DateTime.parse(json['dataAlteracao']),
      status: json['status'],
      discount: json['desconto'].toDouble(),
      shipping: json['frete'].toDouble(),
      subTotal: json['subTotal'].toDouble(),
      totalAmount: json['valorTotal'].toDouble(),
      client: ClientModel.fromJson(json['cliente']),
      deliveryAddress: DeliveryAddressModel.fromJson(json['enderecoEntrega']),
      items: List<ItemModel>.from(
          json['itens'].map((item) => ItemModel.fromJson(item))),
      payments: List<PaymentModel>.from(
          json['pagamento'].map((payment) => PaymentModel.fromJson(payment))),
    );
  }

  OrderModel copyWith({
    String? id,
    int? number,
    DateTime? creationDate,
    DateTime? modificationDate,
    String? status,
    double? discount,
    double? shipping,
    double? subTotal,
    double? totalAmount,
    ClientModel? client,
    DeliveryAddressModel? deliveryAddress,
    List<ItemModel>? items,
    List<PaymentModel>? payments,
  }) {
    return OrderModel(
      id: id ?? this.id,
      number: number ?? this.number,
      creationDate: creationDate ?? this.creationDate,
      modificationDate: modificationDate ?? this.modificationDate,
      status: status ?? this.status,
      discount: discount ?? this.discount,
      shipping: shipping ?? this.shipping,
      subTotal: subTotal ?? this.subTotal,
      totalAmount: totalAmount ?? this.totalAmount,
      client: client ?? this.client,
      deliveryAddress: deliveryAddress ?? this.deliveryAddress,
      items: items ?? this.items,
      payments: payments ?? this.payments,
    );
  }

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
}
