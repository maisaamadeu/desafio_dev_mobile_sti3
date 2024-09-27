import 'package:desafio_dev_mobile_sti3/data/data.dart';
import 'package:desafio_dev_mobile_sti3/domain/domain.dart';

ItemEntity itemEntityMapper(ItemModel item) {
  return ItemEntity(
    id: item.id,
    productId: item.productId,
    name: item.name,
    quantity: item.quantity,
    unitPrice: item.unitPrice,
  );
}

ItemModel itemModelMapper(ItemEntity item) {
  return ItemModel(
    id: item.id,
    productId: item.productId,
    name: item.name,
    quantity: item.quantity,
    unitPrice: item.unitPrice,
  );
}
