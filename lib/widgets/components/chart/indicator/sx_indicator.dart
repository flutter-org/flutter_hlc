import 'package:flutter/material.dart';
import 'package:flutter_hlc/widgets/components/chart/indicator/indicator.dart';

class SXIndicator extends StatelessWidget {
  final Axis direction;
  final double? itemWidth;
  final List<IndicatorData> list;

  const SXIndicator({
    Key? key,
    this.direction = Axis.vertical,
    this.itemWidth = 102,
    required this.list,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: direction,
      children: <Widget>[
        ...list.map(
          (e) => SizedBox(
            width: itemWidth,
            child: Indicator(
              data: e,
            ),
          ),
        ),
      ],
    );
  }
}
