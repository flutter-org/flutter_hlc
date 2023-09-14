import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hlc/models/extension/elp_extension.dart';
import 'package:flutter_hlc/models/extension/epp_extension.dart';
import 'package:flutter_hlc/models/home_loan_model.dart';
import 'package:flutter_hlc/widgets/components/chart/indicator/indicator.dart';
import 'package:flutter_hlc/widgets/components/chart/indicator/sx_indicator.dart';

class HomeLoanChartPage extends StatefulWidget {
  final HomeLoanModel argument;

  const HomeLoanChartPage({
    super.key,
    required this.argument,
  });

  @override
  State<HomeLoanChartPage> createState() => _HomeLoanChartPageState();
}

class _HomeLoanChartPageState extends State<HomeLoanChartPage> {
  RangeValues _rangeX = const RangeValues(1, 12);

  @override
  void initState() {
    super.initState();
    _rangeX = RangeValues(1, widget.argument.loanTermMonths.toDouble());
  }

  /// 累计利息对比
  List<LineChartBarData> get interestList {
    List<FlSpot> elp = [];
    List<FlSpot> epp = [];
    for (int i = _rangeX.start.toInt(); i <= _rangeX.end.toInt(); i++) {
      int term = i;
      double x = term.toDouble();
      elp.add(FlSpot(
        x,
        widget.argument.elpInterestAfterTerm(term),
      ));
      epp.add(FlSpot(
        x,
        widget.argument.eppInterestAfterTerm(term),
      ));
    }
    return [
      LineChartBarData(
        color: Colors.red,
        dotData: const FlDotData(show: false),
        spots: elp,
      ),
      LineChartBarData(
        color: Colors.green,
        dotData: const FlDotData(show: false),
        spots: epp,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('累计已还利息对比'),
      ),
      body: Padding(
        padding: EdgeInsets.only(
          top: 16,
          left: 8,
          right: 8,
          bottom: MediaQuery.of(context).padding.bottom,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: SXIndicator(
                direction: Axis.horizontal,
                list: <IndicatorData>[
                  IndicatorData(text: '等额本息', color: Colors.red),
                  IndicatorData(text: '等额本金', color: Colors.green),
                ],
              ),
            ),
            Expanded(
              child: LineChart(
                LineChartData(
                  titlesData: FlTitlesData(
                    topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    leftTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    rightTitles: AxisTitles(
                      sideTitles: SideTitles(
                        reservedSize: 60,
                        showTitles: true,
                        getTitlesWidget: (double value, TitleMeta meta) {
                          return SideTitleWidget(
                            axisSide: meta.axisSide,
                            child: Text(
                              meta.formattedValue,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  lineBarsData: interestList,
                ),
              ),
            ),
            RangeSlider(
              values: _rangeX,
              min: 1,
              max: widget.argument.loanTermMonths.toDouble(),
              divisions: widget.argument.loanTermMonths,
              onChanged: (RangeValues newRange) {
                setState(() {
                  _rangeX = newRange;
                });
              },
              labels: RangeLabels(
                '${_rangeX.start.toInt()}',
                '${_rangeX.end.toInt()}',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
