import 'package:flutter/material.dart';

class CustomCellContentWidget extends StatelessWidget {
  const CustomCellContentWidget({
    super.key,
    required this.content,
    this.width,
    this.maxWidth = 200,
    this.color = Colors.black,
  });

  final String content;
  final double maxWidth;
  final double? width;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      constraints: width == null ? BoxConstraints(maxWidth: maxWidth) : null,
      child: Text(
        content,
        style: TextStyle(
          color: color,
        ),
      ),
    );
  }
}
