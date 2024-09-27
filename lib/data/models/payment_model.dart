import 'package:desafio_dev_mobile_sti3/domain/domain.dart';

class PaymentModel extends PaymentEntity {
  const PaymentModel({
    required super.id,
    required super.installment,
    required super.value,
    required super.code,
    required super.name,
  });

  factory PaymentModel.fromJson(Map<String, dynamic> json) {
    return PaymentModel(
      id: json['id'],
      installment: json['parcela'],
      value: json['valor'].toDouble(),
      code: json['codigo'],
      name: json['nome'],
    );
  }

  PaymentModel copyWith({
    String? id,
    int? installment,
    double? value,
    String? code,
    String? name,
  }) {
    return PaymentModel(
      id: id ?? this.id,
      installment: installment ?? this.installment,
      value: value ?? this.value,
      code: code ?? this.code,
      name: name ?? this.name,
    );
  }

  @override
  List<Object?> get props => [
        id,
        installment,
        value,
        code,
        name,
      ];
}
