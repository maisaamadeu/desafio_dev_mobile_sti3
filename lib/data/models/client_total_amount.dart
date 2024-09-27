import 'package:desafio_dev_mobile_sti3/data/models/client_model.dart';
import 'package:equatable/equatable.dart';

class ClientTotalAmount extends Equatable {
  final ClientModel client;
  final double totalAmount;

  const ClientTotalAmount({
    required this.client,
    required this.totalAmount,
  });

  ClientTotalAmount copyWith({
    ClientModel? client,
    double? totalAmount,
  }) {
    return ClientTotalAmount(
      client: client ?? this.client,
      totalAmount: totalAmount ?? this.totalAmount,
    );
  }

  @override
  List<Object?> get props => [
        client,
        totalAmount,
      ];
}
