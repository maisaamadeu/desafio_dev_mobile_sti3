import 'package:desafio_dev_mobile_sti3/data/models/sales_city_model.dart';
import 'package:flutter/material.dart';

class SalesByCityTable extends StatelessWidget {
  const SalesByCityTable({super.key, required this.cities});

  final List<SalesCityModel> cities;

  @override
  Widget build(BuildContext context) {
    return DataTable(
      border: TableBorder.all(
        color: Colors.teal,
        borderRadius: BorderRadius.circular(5),
        width: 2,
      ),
      showBottomBorder: true,
      columns: const [
        DataColumn(
          label: Text('CIDADE'),
        ),
        DataColumn(
          label: Text('QUANTIDADE'),
          numeric: true,
        ),
        DataColumn(
          label: Text('VALOR TOTAL'),
          numeric: true,
        ),
      ],
      rows: cities.map((item) {
        return DataRow(
          cells: [
            DataCell(
              Text(
                item.city,
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
