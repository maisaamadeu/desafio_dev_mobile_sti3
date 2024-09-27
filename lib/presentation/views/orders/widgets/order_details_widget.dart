import 'package:desafio_dev_mobile_sti3/domain/enums/order_status_enum.dart';
import 'package:desafio_dev_mobile_sti3/data/models/order_model.dart';
import 'package:desafio_dev_mobile_sti3/presentation/views/orders/widgets/data_with_label_widget.dart';
import 'package:desafio_dev_mobile_sti3/presentation/views/orders/widgets/more_order_details_modal.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OrderDetailsWidget extends StatelessWidget {
  OrderDetailsWidget({super.key, required this.order});

  final OrderModel order;

  final DateFormat complexDateFormat =
      DateFormat('EEEE, d \'de\' MMMM, yyyy', 'pt_BR');
  final DateFormat simpleDateFormat = DateFormat('dd/MM/yyyy', 'pt_BR');

  Color getStatusColor(OrderStatusEnum status) {
    switch (status) {
      case OrderStatusEnum.approved:
        return Colors.green;
      case OrderStatusEnum.canceled:
        return Colors.red;
      default:
        return Colors.orange;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.teal,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 5),
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              color: Colors.teal,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(3),
                topRight: Radius.circular(3),
              ),
            ),
            child: const Text(
              "Detalhes do Pedido",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Informações do Pedido",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.teal,
                  ),
                ),
                DataWithLabelWidget(
                  label: "Número: ",
                  data: order.number.toString(),
                ),
                DataWithLabelWidget(
                  label: "Data Criação: ",
                  data: simpleDateFormat.format(order.creationDate),
                ),
                DataWithLabelWidget(
                  label: "Data Modificação: ",
                  data: simpleDateFormat.format(order.modificationDate),
                ),
                DataWithLabelWidget(
                  label: "Status: ",
                  data: order.statusEnum.getName.toUpperCase(),
                  dataColor: getStatusColor(order.statusEnum),
                ),
                DataWithLabelWidget(
                  label: "Desconto",
                  data: 'R\$ ${order.discount.toStringAsFixed(2)}',
                ),
                DataWithLabelWidget(
                  label: "SubTotal: ",
                  data: 'R\$ ${order.subTotal.toStringAsFixed(2)}',
                ),
                DataWithLabelWidget(
                  label: "Total: ",
                  data: 'R\$ ${order.totalAmount.toStringAsFixed(2)}',
                ),
                const SizedBox(height: 20),
                const Text(
                  "Dados do Cliente",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.teal,
                  ),
                ),
                DataWithLabelWidget(
                  label: "Cliente: ",
                  data: order.client.name,
                ),
                DataWithLabelWidget(
                  label: "Documento: ",
                  data: order.client.cpf,
                ),
                DataWithLabelWidget(
                  label: "Data Nascimento: ",
                  data: simpleDateFormat.format(order.client.birthDate),
                ),
                DataWithLabelWidget(
                  label: "E-mail: ",
                  data: order.client.email,
                ),
                const SizedBox(height: 20),
                const Text(
                  "Local de Entrega",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.teal,
                  ),
                ),
                DataWithLabelWidget(
                  label: "Endereço: ",
                  data: order.deliveryAddress.address,
                ),
                DataWithLabelWidget(
                  label: "Número: ",
                  data: order.deliveryAddress.number.toString(),
                ),
                DataWithLabelWidget(
                  label: "CEP: ",
                  data: order.deliveryAddress.postalCode,
                ),
                DataWithLabelWidget(
                  label: "Bairro: ",
                  data: order.deliveryAddress.district,
                ),
                DataWithLabelWidget(
                  label: "Cidade: ",
                  data: order.deliveryAddress.city,
                ),
                DataWithLabelWidget(
                  label: "Estado: ",
                  data: order.deliveryAddress.state,
                ),
                DataWithLabelWidget(
                  label: "Complemento: ",
                  data: order.deliveryAddress.complement,
                ),
                DataWithLabelWidget(
                  label: "Referência: ",
                  data: order.deliveryAddress.reference,
                ),
                ElevatedButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                      ),
                      isScrollControlled: true,
                      builder: (context) => MoreOrderDetailsModal(order: order),
                    );
                  },
                  child: const Text("Ver mais detalhes"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
