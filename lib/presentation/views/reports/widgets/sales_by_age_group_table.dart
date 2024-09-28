import 'package:desafio_dev_mobile_sti3/domain/enums/age_group_enum.dart';
import 'package:desafio_dev_mobile_sti3/data/models/sales_age_group_model.dart';
import 'package:flutter/material.dart';

class SalesByAgeGroupTable extends StatelessWidget {
  const SalesByAgeGroupTable({super.key, required this.ageGroups});

  final List<SalesAgeGroupModel> ageGroups;

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
        DataColumn(label: Text('FAIXA ETÁRIA')),
        DataColumn(
          label: Text('QUANTIDADE'),
          numeric: true,
        ),
        DataColumn(
          label: Text('VALOR TOTAL'),
          numeric: true,
        ),
      ],
      rows: ageGroups.map((item) {
        return DataRow(
          cells: [
            DataCell(
              Text(
                item.ageGroup.getName,
              ),
            ),
            DataCell(
              Text(
                item.quantity.toString(),
              ),
            ),
            DataCell(
              Text(
                'R\$ ${item.totalValue.toStringAsFixed(2)}',
              ),
            ),
          ],
        );
      }).toList(),
    );
  }
}
