import 'package:hive/hive.dart';
import 'package:equatable/equatable.dart';

part '../hive_adapters/item_entity.g.dart';

@HiveType(typeId: 2)
class ItemEntity extends Equatable {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String productId;
  @HiveField(2)
  final String name;
  @HiveField(3)
  final int quantity;
  @HiveField(4)
  final double unitPrice;

  const ItemEntity({
    required this.id,
    required this.productId,
    required this.name,
    required this.quantity,
    required this.unitPrice,
  });

  @override
  List<Object?> get props => [
        id,
        productId,
        name,
        quantity,
        unitPrice,
      ];

  @override
  String toString() {
    return ''''
    ItemEntity {
      id: $id,
      productId: $productId,
      name: $name,
      quantity: $quantity,
      unitPrice: $unitPrice,
    }
  ''';
  }
}
