import 'package:desafio_dev_mobile_sti3/data/data.dart';
import 'package:desafio_dev_mobile_sti3/domain/domain.dart';

DeliveryAddressEntity deliveryAddressEntityMapper(
    DeliveryAddressModel deliveryAddress) {
  return DeliveryAddressEntity(
    id: deliveryAddress.id,
    address: deliveryAddress.address,
    number: deliveryAddress.number,
    postalCode: deliveryAddress.postalCode,
    district: deliveryAddress.district,
    city: deliveryAddress.city,
    state: deliveryAddress.state,
    complement: deliveryAddress.complement,
    reference: deliveryAddress.reference,
  );
}

DeliveryAddressModel deliveryAddressModelMapper(
    DeliveryAddressEntity deliveryAddress) {
  return DeliveryAddressModel(
    id: deliveryAddress.id,
    address: deliveryAddress.address,
    number: deliveryAddress.number,
    postalCode: deliveryAddress.postalCode,
    district: deliveryAddress.district,
    city: deliveryAddress.city,
    state: deliveryAddress.state,
    complement: deliveryAddress.complement,
    reference: deliveryAddress.reference,
  );
}
