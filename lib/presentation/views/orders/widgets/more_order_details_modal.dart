import 'package:desafio_dev_mobile_sti3/data/models/order_model.dart';
import 'package:desafio_dev_mobile_sti3/presentation/views/orders/widgets/custom_cell_content_widget.dart';
import 'package:flutter/material.dart';

class MoreOrderDetailsModal extends StatelessWidget {
  const MoreOrderDetailsModal({super.key, required this.order});

  final OrderModel order;

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.5,
      minChildSize: 0.5,
      maxChildSize: 0.9,
      builder: (context, scrollController) {
        return SingleChildScrollView(
          controller: scrollController,
          child: Padding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
              top: 30,
              bottom: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Detalhes do Pedido',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DataTable(
                        border: TableBorder.all(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(5),
                          width: 1,
                        ),
                        showBottomBorder: true,
                        columns: const [
                          DataColumn(
                            label: Text('PRODUTO'),
                          ),
                          DataColumn(label: Text('QNTD'), numeric: true),
                          DataColumn(
                            label: Text(
                              'VALOR UNIT.',
                            ),
                            numeric: true,
                          ),
                        ],
                        rows: order.items
                            .map(
                              (item) => DataRow(
                                cells: [
                                  DataCell(
                                    SizedBox(
                                      width: 150,
                                      child: Text(item.name),
                                    ),
                                  ),
                                  DataCell(
                                    Text(item.quantity.toString()),
                                  ),
                                  DataCell(
                                    Text(
                                      'R\$ ${item.unitPrice.toStringAsFixed(2)}',
                                    ),
                                  ),
                                ],
                              ),
                            )
                            .toList(),
                      ),
                      const SizedBox(height: 20), // Espaço entre as tabelas
                      DataTable(
                        border: TableBorder.all(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(5),
                          width: 1,
                        ),
                        showBottomBorder: true,
                        columns: const [
                          DataColumn(label: Text('PAGAMENTO')),
                          DataColumn(
                            label: Text('PARCELA'),
                            numeric: true,
                          ),
                          DataColumn(
                            label: Text('VALOR'),
                            numeric: true,
                          ),
                        ],
                        rows: order.payments
                            .map(
                              (payment) => DataRow(
                                cells: [
                                  DataCell(
                                    CustomCellContentWidget(
                                      content: payment.name,
                                      width: 150,
                                    ),
                                  ),
                                  DataCell(
                                    Text(payment.installment.toString()),
                                  ),
                                  DataCell(
                                    Text(
                                      'R\$ ${payment.value.toStringAsFixed(2)}',
                                    ),
                                  ),
                                ],
                              ),
                            )
                            .toList(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
