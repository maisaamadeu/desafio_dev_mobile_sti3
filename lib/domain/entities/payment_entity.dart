import 'package:hive/hive.dart';
import 'package:equatable/equatable.dart';

part '../hive_adapters/payment_entity.g.dart';

@HiveType(typeId: 4)
class PaymentEntity extends Equatable {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final int installment;
  @HiveField(2)
  final double value;
  @HiveField(3)
  final String code;
  @HiveField(4)
  final String name;

  const PaymentEntity({
    required this.id,
    required this.installment,
    required this.value,
    required this.code,
    required this.name,
  });

  @override
  List<Object?> get props => [
        id,
        installment,
        value,
        code,
        name,
      ];

  @override
  String toString() {
    return '''
    PaymentEntity {
      id: $id,
      installment: $installment,
      value: $value,
      code: $code,
      name: $name,
    }
  ''';
  }
}
