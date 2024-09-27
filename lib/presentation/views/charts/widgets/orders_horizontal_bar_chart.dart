import 'package:desafio_dev_mobile_sti3/presentation/views/charts/widgets/legend_chart.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:desafio_dev_mobile_sti3/data/models/order_model.dart';
import 'package:desafio_dev_mobile_sti3/domain/enums/order_status_enum.dart';

class OrdersHorizontalBarChart extends StatelessWidget {
  const OrdersHorizontalBarChart({super.key, required this.orders});

  final List<OrderModel> orders;

  @override
  Widget build(BuildContext context) {
    final approvedCount = orders
        .where((element) => element.statusEnum == OrderStatusEnum.approved)
        .length
        .toDouble();

    final canceledCount = orders
        .where((element) => element.statusEnum == OrderStatusEnum.canceled)
        .length
        .toDouble();

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              "Pedidos",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              "Pedidos aprovados e cancelados",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              height: 200,
              alignment: Alignment.center,
              child: RotatedBox(
                quarterTurns: 1,
                child: BarChart(
                  BarChartData(
                    barGroups: [
                      BarChartGroupData(
                        x: 0,
                        barRods: [
                          BarChartRodData(
                            toY: approvedCount,
                            width: 50,
                            color: Colors.blue.shade700,
                            borderRadius: BorderRadius.circular(6),
                            rodStackItems: [
                              BarChartRodStackItem(
                                0,
                                approvedCount,
                                Colors.blue.shade700,
                              ),
                            ],
                          ),
                          BarChartRodData(
                            toY: canceledCount,
                            width: 50,
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(6),
                            rodStackItems: [
                              BarChartRodStackItem(
                                0,
                                canceledCount,
                                Colors.blue,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                    maxY: orders.length.toDouble() + 1,
                    alignment: BarChartAlignment.spaceAround,
                    borderData: FlBorderData(show: false),
                    titlesData: FlTitlesData(
                      leftTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      bottomTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      topTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      rightTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: (double value, TitleMeta meta) {
                            return SideTitleWidget(
                              axisSide: meta.axisSide,
                              child: Transform.rotate(
                                angle: -90 * 3.14 / 180,
                                child: Text(
                                  value.toInt().toString(),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                LegendChart(title: "APROVADO", color: Colors.blue.shade700),
                const SizedBox(width: 20),
                const LegendChart(title: "CANCELADO", color: Colors.blue),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
