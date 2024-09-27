import 'dart:async';
import 'package:desafio_dev_mobile_sti3/core/core.dart';
import 'package:desafio_dev_mobile_sti3/data/data.dart';
import 'package:desafio_dev_mobile_sti3/domain/domain.dart';
import 'package:desafio_dev_mobile_sti3/presentation/view_models/orders_view_model.dart';
import 'package:desafio_dev_mobile_sti3/presentation/views/orders/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class OrdersView extends StatefulWidget {
  const OrdersView({super.key});

  @override
  State<OrdersView> createState() => _OrdersViewState();
}

class _OrdersViewState extends State<OrdersView> {
  final OrdersViewModel _viewModel = getIt<OrdersViewModel>();

  final TextEditingController _searchController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  final DateFormat complexDateFormat =
      DateFormat('EEEE, d \'de\' MMMM, yyyy', 'pt_BR');
  final DateFormat simpleDateFormat = DateFormat('dd/MM/yyyy', 'pt_BR');

  @override
  void initState() {
    super.initState();
    _viewModel.fetchLocalOrders();
  }

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

  void onOrderTap(OrderModel order) {
    _viewModel.selectOrder(order);

    Future.delayed(
      const Duration(milliseconds: 100),
      () => scrollToEnd(),
    );
  }

  void onOrderDoubleTap(OrderModel order) {
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
  }

  void scrollToEnd() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          top: 16,
          left: 16,
          right: 16,
        ),
        child: Obx(
          () {
            switch (_viewModel.appStatus.value) {
              case AppStatusEnum.loading:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              case AppStatusEnum.error:
                return const Center(
                  child: Text('Erro ao carregar os pedidos!'),
                );
              case AppStatusEnum.initial:
              case AppStatusEnum.loaded:
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      TextField(
                        controller: _searchController,
                        decoration: const InputDecoration(
                          hintText: 'Pesquise pelo nome do cliente',
                          suffixIcon: Icon(Icons.search),
                          isDense: true,
                        ),
                        enabled: _viewModel.orders.value.isNotEmpty,
                        onChanged: (value) {
                          _viewModel.filterOrdersByClientName(value);
                        },
                      ),
                      const SizedBox(height: 5),
                      Align(
                        alignment: Alignment.centerRight,
                        child: ElevatedButton(
                          onPressed: () {
                            _viewModel.fetchNetworkOrders();
                          },
                          child: const Text("Consultar"),
                        ),
                      ),
                      const SizedBox(height: 5),
                      SingleChildScrollView(
                        controller: _scrollController,
                        scrollDirection: Axis.horizontal,
                        child: Obx(
                          () => Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              DataTable(
                                border: TableBorder.all(
                                  color: Colors.teal,
                                  borderRadius: BorderRadius.circular(5),
                                  width: 1,
                                ),
                                showBottomBorder: true,
                                columns: const [
                                  DataColumn(
                                    label: Text('NÚMERO'),
                                    numeric: true,
                                  ),
                                  DataColumn(label: Text('DATA')),
                                  DataColumn(label: Text('CLIENTE')),
                                  DataColumn(label: Text('STATUS')),
                                  DataColumn(
                                    label: Text('VALOR TOTAL'),
                                    numeric: true,
                                  ),
                                ],
                                rows: _viewModel.filteredOrders.value.map(
                                  (order) {
                                    return DataRow(
                                      color: _viewModel.selectedOrder.value ==
                                              order
                                          ? WidgetStateProperty.all(
                                              Colors.teal.shade100,
                                            )
                                          : null,
                                      cells: [
                                        DataCell(
                                          onTap: () => onOrderTap(order),
                                          onDoubleTap: () =>
                                              onOrderDoubleTap(order),
                                          CustomCellContentWidget(
                                            content: order.number.toString(),
                                            color: order.statusEnum ==
                                                    OrderStatusEnum.canceled
                                                ? Colors.red
                                                : Colors.black,
                                          ),
                                        ),
                                        DataCell(
                                          onTap: () => onOrderTap(order),
                                          onDoubleTap: () =>
                                              onOrderDoubleTap(order),
                                          CustomCellContentWidget(
                                            content: complexDateFormat
                                                .format(order.modificationDate),
                                            color: order.statusEnum ==
                                                    OrderStatusEnum.canceled
                                                ? Colors.red
                                                : Colors.black,
                                          ),
                                        ),
                                        DataCell(
                                          onTap: () => onOrderTap(order),
                                          onDoubleTap: () =>
                                              onOrderDoubleTap(order),
                                          CustomCellContentWidget(
                                            content: order.client.name,
                                            color: order.statusEnum ==
                                                    OrderStatusEnum.canceled
                                                ? Colors.red
                                                : Colors.black,
                                          ),
                                        ),
                                        DataCell(
                                          onTap: () => onOrderTap(order),
                                          onDoubleTap: () =>
                                              onOrderDoubleTap(order),
                                          CustomCellContentWidget(
                                            content: order.statusEnum.getName
                                                .toUpperCase(),
                                            color: getStatusColor(
                                                order.statusEnum),
                                          ),
                                        ),
                                        DataCell(
                                          onTap: () => onOrderTap(order),
                                          onDoubleTap: () =>
                                              onOrderDoubleTap(order),
                                          CustomCellContentWidget(
                                            content:
                                                'R\$ ${order.totalAmount.toStringAsFixed(2)}',
                                            color: order.statusEnum ==
                                                    OrderStatusEnum.canceled
                                                ? Colors.red
                                                : Colors.black,
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                ).toList(),
                              ),
                              if (_viewModel.selectedOrder.value != null) ...[
                                const SizedBox(width: 16),
                                OrderDetailsWidget(
                                  order: _viewModel.selectedOrder.value!,
                                ),
                              ],
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                );
              default:
                return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}
