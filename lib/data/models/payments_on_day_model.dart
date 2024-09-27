import 'package:desafio_dev_mobile_sti3/data/models/payment_model.dart';
import 'package:equatable/equatable.dart';

class PaymentsOnDayModel extends Equatable {
  final DateTime date;
  final List<PaymentModel> paymentsOnDay;

  const PaymentsOnDayModel({
    required this.date,
    required this.paymentsOnDay,
  });

  PaymentsOnDayModel copyWith({
    DateTime? date,
    List<PaymentModel>? paymentsOnDay,
  }) {
    return PaymentsOnDayModel(
      date: date ?? this.date,
      paymentsOnDay: paymentsOnDay ?? this.paymentsOnDay,
    );
  }

  @override
  List<Object?> get props => [date, paymentsOnDay];
}
