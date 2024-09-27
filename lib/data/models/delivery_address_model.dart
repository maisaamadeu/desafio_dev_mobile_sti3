import 'package:desafio_dev_mobile_sti3/domain/domain.dart';

class DeliveryAddressModel extends DeliveryAddressEntity {
  const DeliveryAddressModel({
    required super.id,
    required super.address,
    required super.number,
    required super.postalCode,
    required super.district,
    required super.city,
    required super.state,
    required super.complement,
    required super.reference,
  });

  factory DeliveryAddressModel.fromJson(Map<String, dynamic> json) {
    return DeliveryAddressModel(
      id: json['id'],
      address: json['endereco'],
      number: json['numero'],
      postalCode: json['cep'],
      district: json['bairro'],
      city: json['cidade'],
      state: json['estado'],
      complement: json['complemento'],
      reference: json['referencia'],
    );
  }

  DeliveryAddressModel copyWith({
    String? id,
    String? address,
    String? number,
    String? postalCode,
    String? district,
    String? city,
    String? state,
    String? complement,
    String? reference,
  }) {
    return DeliveryAddressModel(
      id: id ?? this.id,
      address: address ?? this.address,
      number: number ?? this.number,
      postalCode: postalCode ?? this.postalCode,
      district: district ?? this.district,
      city: city ?? this.city,
      state: state ?? this.state,
      complement: complement ?? this.complement,
      reference: reference ?? this.reference,
    );
  }

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
}
