import 'package:desafio_dev_mobile_sti3/data/models/item_model.dart';
import 'package:flutter/material.dart';

class MostSoldProductsTable extends StatelessWidget {
  const MostSoldProductsTable({super.key, required this.items});

  final List<ItemModel> items;

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
        DataColumn(label: Text('PRODUTO')),
        DataColumn(
          label: Text('QUANTIDADE'),
          numeric: true,
        ),
        DataColumn(
          label: Text('VALOR MÉDIO'),
          numeric: true,
        ),
      ],
      rows: items.map((item) {
        return DataRow(
          cells: [
            DataCell(
              Text(
                item.name,
              ),
            ),
            DataCell(
              Text(
                item.quantity.toString(),
              ),
            ),
            DataCell(
              Text(
                'R\$ ${item.unitPrice.toStringAsFixed(2)}',
              ),
            ),
          ],
        );
      }).toList(),
    );
  }
}
