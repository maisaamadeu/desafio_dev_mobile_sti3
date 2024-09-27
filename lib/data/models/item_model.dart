import 'package:desafio_dev_mobile_sti3/domain/entities/item_entity.dart';

class ItemModel extends ItemEntity {
  const ItemModel({
    required super.id,
    required super.productId,
    required super.name,
    required super.quantity,
    required super.unitPrice,
  });

  factory ItemModel.fromJson(Map<String, dynamic> json) {
    return ItemModel(
      id: json['id'],
      productId: json['idProduto'],
      name: json['nome'],
      quantity: json['quantidade'],
      unitPrice: json['valorUnitario'].toDouble(),
    );
  }

  ItemModel copyWith({
    String? id,
    String? productId,
    String? name,
    int? quantity,
    double? unitPrice,
  }) {
    return ItemModel(
      id: id ?? this.id,
      productId: productId ?? this.productId,
      name: name ?? this.name,
      quantity: quantity ?? this.quantity,
      unitPrice: unitPrice ?? this.unitPrice,
    );
  }

  @override
  List<Object?> get props => [
        id,
        productId,
        name,
        quantity,
        unitPrice,
      ];
}
