import 'package:desafio_dev_mobile_sti3/domain/domain.dart';
import 'package:desafio_dev_mobile_sti3/presentation/view_models/view_models.dart';
import 'package:desafio_dev_mobile_sti3/presentation/views/reports/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReportsView extends StatefulWidget {
  const ReportsView({super.key});

  @override
  State<ReportsView> createState() => _ReportsViewState();
}

class _ReportsViewState extends State<ReportsView> {
  final ReportsViewModel _viewModel = Get.find<ReportsViewModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          top: 16,
          left: 16,
          right: 16,
        ),
        child: Obx(() {
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DropdownButtonFormField<ReportTypeEnum>(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(
                            color: Theme.of(context).primaryColor,
                            width: 1,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(
                            color: Theme.of(context).primaryColor,
                            width: 1,
                          ),
                        ),
                        contentPadding: const EdgeInsets.all(12),
                      ),
                      hint: const Text('Selecione o relatório'),
                      style: const TextStyle(
                        overflow: TextOverflow.ellipsis,
                        color: Colors.black,
                      ),
                      value: _viewModel.reportType.value,
                      isExpanded: true,
                      items: ReportTypeEnum.values
                          .map((ReportTypeEnum reportType) {
                        return DropdownMenuItem<ReportTypeEnum>(
                          value: reportType,
                          child: Text(reportType.displayName),
                        );
                      }).toList(),
                      onChanged: (ReportTypeEnum? newValue) {
                        _viewModel.setReportType(newValue);
                      },
                    ),
                    const SizedBox(height: 5),
                    Align(
                      alignment: Alignment.centerRight,
                      child: ElevatedButton(
                        onPressed: () {
                          _viewModel.fetchNetworkOrders();
                        },
                        child: const Text("Sincronizar"),
                      ),
                    ),
                    const SizedBox(height: 5),
                    if (_viewModel.reportType.value != null) ...[
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Builder(
                          builder: (context) {
                            switch (_viewModel.reportType.value) {
                              case ReportTypeEnum.mostSoldProducts:
                                return MostSoldProductsTable(
                                  items: _viewModel.mostSoldProducts(),
                                );
                              case ReportTypeEnum.paymentMethodsPerDay:
                                return PaymentMethodsTable(
                                  payments: _viewModel.paymentsOnDay(),
                                );
                              case ReportTypeEnum.salesByCity:
                                return SalesByCityTable(
                                  cities: _viewModel.salesByCity(),
                                );
                              case ReportTypeEnum.salesByAgeGroup:
                                return SalesByAgeGroupTable(
                                  ageGroups: _viewModel.salesByAgeGroup(),
                                );
                              default:
                                return const SizedBox.shrink();
                            }
                          },
                        ),
                      ),
                    ],
                    const SizedBox(height: 20),
                  ],
                ),
              );
          }
        }),
      ),
    );
  }
}
