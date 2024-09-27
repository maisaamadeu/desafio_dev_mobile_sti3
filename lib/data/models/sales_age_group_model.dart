import 'package:desafio_dev_mobile_sti3/domain/enums/age_group_enum.dart';
import 'package:equatable/equatable.dart';

class SalesAgeGroupModel extends Equatable {
  final AgeGroupEnum ageGroup;
  final int quantity;
  final double totalValue;

  const SalesAgeGroupModel({
    required this.ageGroup,
    required this.quantity,
    required this.totalValue,
  });

  SalesAgeGroupModel copyWith({
    AgeGroupEnum? ageGroup,
    int? quantity,
    double? totalValue,
  }) {
    return SalesAgeGroupModel(
      ageGroup: ageGroup ?? this.ageGroup,
      quantity: quantity ?? this.quantity,
      totalValue: totalValue ?? this.totalValue,
    );
  }

  @override
  List<Object?> get props => [ageGroup, quantity, totalValue];
}
