import 'package:hive/hive.dart';
import 'package:equatable/equatable.dart';

part '../hive_adapters/delivery_address_entity.g.dart';

@HiveType(typeId: 1)
class DeliveryAddressEntity extends Equatable {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String address;
  @HiveField(2)
  final String number;
  @HiveField(3)
  final String postalCode;
  @HiveField(4)
  final String district;
  @HiveField(5)
  final String city;
  @HiveField(6)
  final String state;
  @HiveField(7)
  final String complement;
  @HiveField(8)
  final String reference;

  const DeliveryAddressEntity({
    required this.id,
    required this.address,
    required this.number,
    required this.postalCode,
    required this.district,
    required this.city,
    required this.state,
    required this.complement,
    required this.reference,
  });

  @override
  List<Object?> get props => [
        id,
        address,
        number,
        postalCode,
        district,
        city,
        state,
        complement,
        reference,
      ];

  @override
  String toString() {
    return ''''
    DeliveryAddressEntity {
      id: $id,
      address: $address,
      number: $number,
      postalCode: $postalCode,
      district: $district,
      city: $city,
      state: $state,
      complement: $complement,
      reference: $reference,
    }
  ''';
  }
}
