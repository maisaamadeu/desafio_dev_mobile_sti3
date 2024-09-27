import 'package:desafio_dev_mobile_sti3/core/core.dart';
import 'package:desafio_dev_mobile_sti3/domain/domain.dart';
import 'package:desafio_dev_mobile_sti3/presentation/view_models/view_models.dart';
import 'package:desafio_dev_mobile_sti3/presentation/views/charts/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChartsView extends StatefulWidget {
  const ChartsView({super.key});

  @override
  State<ChartsView> createState() => _ChartsViewState();
}

class _ChartsViewState extends State<ChartsView> {
  final ChartsViewModel _viewModel = getIt<ChartsViewModel>();

  @override
  void initState() {
    super.initState();
    _viewModel.fetchLocalOrders();
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
                  child: Text("Erro ao carregar os pedidos!"),
                );
              case AppStatusEnum.initial:
              case AppStatusEnum.loaded:
                if (_viewModel.orders.value.isNotEmpty) {
                  return SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SalesPieChart(
                          items: _viewModel.mostSoldProducts().sublist(0, 5),
                        ),
                        const SizedBox(height: 20),
                        ClientsVerticalBarChart(
                          clients: _viewModel.topClients().sublist(0, 5),
                        ),
                        const SizedBox(height: 20),
                        OrdersHorizontalBarChart(
                          orders: _viewModel.orders.value,
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            _viewModel.fetchNetworkOrders();
                          },
                          child: const Text("Sincronizar"),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  );
                } else {
                  return Column(
                    children: [
                      const Text(
                        "Nenhum dado disponível no momento, clique no botão abaixo para sincronizar!",
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          _viewModel.fetchNetworkOrders();
                        },
                        child: const Text("Sincronizar"),
                      ),
                    ],
                  );
                }
              default:
                return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
