import 'package:desafio_dev_mobile_sti3/data/models/payments_on_day_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class PaymentMethodsTable extends StatelessWidget {
  PaymentMethodsTable({super.key, required this.payments});

  final List<PaymentsOnDayModel> payments;
  final DateFormat _dateFormat = DateFormat('dd/MM/yyyy');
  Set<DateTime> displayedDates = {};

  @override
  Widget build(BuildContext context) {
    return DataTable(
      border: TableBorder.all(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(5),
        width: 1,
      ),
      showBottomBorder: true,
      columns: const [
        DataColumn(
          label: Text('DATA'),
        ),
        DataColumn(
          label: Text('FORMA'),
        ),
        DataColumn(
          label: Text('VALOR'),
          numeric: true,
        ),
      ],
      rows: payments.expand(
        (item) {
          return item.paymentsOnDay.map(
            (payment) {
              final isDateDisplayed = displayedDates.contains(item.date);

              if (!isDateDisplayed) {
                displayedDates.add(item.date);
                return DataRow(
                  cells: [
                    DataCell(Text(_dateFormat.format(item.date))),
                    DataCell(Text(payment.name)),
                    DataCell(Text('R\$ ${payment.value.toStringAsFixed(2)}')),
                  ],
                );
              } else {
                return DataRow(
                  cells: [
                    DataCell.empty,
                    DataCell(Text(payment.name)),
                    DataCell(Text('R\$ ${payment.value.toStringAsFixed(2)}')),
                  ],
                );
              }
            },
          );
        },
      ).toList(),
    );
  }
}
