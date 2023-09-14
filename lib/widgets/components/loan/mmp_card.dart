import 'package:flutter/material.dart';
import 'package:flutter_hlc/models/home_loan_model.dart';

/// 月供(monthly mortgage payment)
class MMPCard extends StatelessWidget {
  final HomeLoanModel model;

  final String title;

  /// 每月应还(元)
  final double mmp;
  final String? reduceTitle;

  /// 利息总额(万)
  final double interestAmount;

  const MMPCard({
    super.key,
    required this.model,
    required this.title,
    required this.mmp,
    this.reduceTitle,
    required this.interestAmount,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      color: Colors.blue,
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: DefaultTextStyle(
          style: const TextStyle(
            color: Colors.white,
          ),
          child: Column(
            children: [
              Text(title),
              Text(
                mmp.toStringAsFixed(2),
                style: const TextStyle(
                  fontSize: 32,
                ),
              ),
              if (reduceTitle != null && reduceTitle!.isNotEmpty) Text(reduceTitle!),
              const SizedBox(height: 16),
              DefaultTextStyle(
                style: const TextStyle(
                  fontSize: 16,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        const Text(
                          '贷款总额',
                          style: TextStyle(
                            color: Colors.white70,
                          ),
                        ),
                        Text('${model.loanAmount}万'),
                      ],
                    ),
                    const VerticalDivider(),
                    Column(
                      children: [
                        const Text(
                          '利息总额',
                          style: TextStyle(
                            color: Colors.white70,
                          ),
                        ),
                        Text('${interestAmount.toStringAsFixed(2)}万'),
                      ],
                    ),
                    const VerticalDivider(),
                    Column(
                      children: [
                        const Text(
                          '贷款年限',
                          style: TextStyle(
                            color: Colors.white70,
                          ),
                        ),
                        Text('${model.loanTerm}年'),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
