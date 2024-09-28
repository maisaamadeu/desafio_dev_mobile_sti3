import 'package:desafio_dev_mobile_sti3/data/models/client_total_amount.dart';
import 'package:desafio_dev_mobile_sti3/core/utils/map_indexed.dart';
import 'package:desafio_dev_mobile_sti3/presentation/views/charts/widgets/legend_chart.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ClientsVerticalBarChart extends StatelessWidget {
  ClientsVerticalBarChart({super.key, required this.clients});

  final List<ClientTotalAmount> clients;

  List<Color> colorsAvailable = [
    Colors.green,
    Colors.greenAccent,
    Colors.lightGreen,
    Colors.blue,
    Colors.lightBlue,
  ];

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              "Top Vendas",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              "Clientes com maior valor em compras",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              height: 200,
              width: 200,
              alignment: Alignment.center,
              child: BarChart(
                BarChartData(
                  barGroups: mapIndexed(
                    clients,
                    (index, client) {
                      return BarChartGroupData(
                        x: index,
                        barRods: [
                          BarChartRodData(
                            toY: client.totalAmount,
                            width: 30,
                            color: colorsAvailable[index],
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ],
                      );
                    },
                  ).toList(),
                  alignment: BarChartAlignment.spaceAround,
                  borderData: FlBorderData(
                    show: false,
                  ),
                  maxY: (clients
                                  .map((e) => e.totalAmount)
                                  .reduce((a, b) => a > b ? a : b) /
                              500)
                          .ceil() *
                      500,
                  titlesData: FlTitlesData(
                    topTitles: const AxisTitles(),
                    bottomTitles: const AxisTitles(),
                    rightTitles: const AxisTitles(),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        interval: 500,
                        getTitlesWidget: (double value, TitleMeta meta) {
                          return Text(
                            'R\$ ${value.toStringAsFixed(2)}',
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                            ),
                          );
                        },
                        reservedSize: 80,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: mapIndexed(
                clients,
                (index, client) {
                  return LegendChart(
                    title: client.client.name,
                    color: colorsAvailable[index],
                  );
                },
              ).toList(),
            )
          ],
        ),
      ),
    );
  }
}
