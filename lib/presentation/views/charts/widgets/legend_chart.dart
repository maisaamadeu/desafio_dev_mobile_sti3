import 'package:flutter/widgets.dart';

class LegendChart extends StatelessWidget {
  const LegendChart({
    super.key,
    required this.title,
    required this.color,
  });

  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 15,
          height: 30,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(
              5,
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          title,
        ),
      ],
    );
  }
}
