import 'package:flutter/material.dart';

class DataWithLabelWidget extends StatelessWidget {
  const DataWithLabelWidget({
    super.key,
    required this.label,
    required this.data,
    this.labelColor = Colors.black,
    this.dataColor = Colors.black,
  });

  final String label;
  final String data;
  final Color labelColor;
  final Color dataColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 5),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: label,
              style: TextStyle(
                color: labelColor,
              ),
            ),
            TextSpan(
              text: data,
              style: TextStyle(
                color: dataColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
