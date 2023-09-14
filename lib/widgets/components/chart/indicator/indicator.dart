import 'package:flutter/material.dart';

class IndicatorData {
  final String text;
  final Color color;
  final bool isSquare;
  final double size;
  final Color textColor;

  IndicatorData({
    required this.text,
    required this.color,
    this.isSquare = true,
    this.size = 16,
    this.textColor = const Color(0xff505050),
  });
}

class Indicator extends StatelessWidget {
  final IndicatorData data;

  const Indicator({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: data.size,
          height: data.size,
          decoration: BoxDecoration(
            shape: data.isSquare ? BoxShape.rectangle : BoxShape.circle,
            color: data.color,
          ),
        ),
        const SizedBox(
          width: 4,
        ),
        Text(
          data.text,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: data.textColor,
          ),
        )
      ],
    );
  }
}
