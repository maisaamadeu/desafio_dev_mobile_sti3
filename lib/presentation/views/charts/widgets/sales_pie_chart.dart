import 'package:desafio_dev_mobile_sti3/data/models/item_model.dart';
import 'package:desafio_dev_mobile_sti3/core/utils/map_indexed.dart';
import 'package:desafio_dev_mobile_sti3/presentation/views/charts/widgets/legend_chart.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SalesPieChart extends StatelessWidget {
  SalesPieChart({super.key, required this.items});

  final List<ItemModel> items;

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
              "Top Produtos",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              "Produtos mais vendidos",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              height: 200,
              width: 200,
              alignment: Alignment.center,
              child: PieChart(
                PieChartData(
                  centerSpaceRadius: 0,
                  sections: mapIndexed(
                    items,
                    (index, item) {
                      return PieChartSectionData(
                        radius: 100,
                        color: colorsAvailable[index],
                        value: item.quantity.toDouble(),
                        title: item.quantity.toString(),
                        titleStyle: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Color(0xffffffff),
                          shadows: [
                            Shadow(
                              color: Colors.black,
                              blurRadius: 2,
                            ),
                          ],
                        ),
                      );
                    },
                  ).toList(),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: mapIndexed(
                items,
                (index, item) {
                  return LegendChart(
                    title: item.name,
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
