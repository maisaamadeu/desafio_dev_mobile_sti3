import 'package:equatable/equatable.dart';

class SalesCityModel extends Equatable {
  final String city;
  final String state;
  final int quantity;
  final double totalValue;

  const SalesCityModel({
    required this.city,
    required this.state,
    required this.quantity,
    required this.totalValue,
  });

  SalesCityModel copyWith({
    String? city,
    String? state,
    int? quantity,
    double? totalValue,
  }) {
    return SalesCityModel(
      city: city ?? this.city,
      state: state ?? this.state,
      quantity: quantity ?? this.quantity,
      totalValue: totalValue ?? this.totalValue,
    );
  }

  @override
  List<Object?> get props => [city, quantity, state, totalValue];
}
