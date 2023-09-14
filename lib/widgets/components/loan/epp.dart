import 'package:flutter/material.dart';
import 'package:flutter_hlc/models/extension/epp_extension.dart';
import 'package:flutter_hlc/models/home_loan_model.dart';
import 'package:flutter_hlc/widgets/components/loan/mmp_card.dart';
import 'package:flutter_hlc/widgets/components/sx_ui/sx_tag.dart';

/// 等额本金(equal principal payment)
class EPP extends StatefulWidget {
  final HomeLoanModel model;

  const EPP({
    super.key,
    required this.model,
  });

  @override
  State<EPP> createState() => _EPPState();
}

class _EPPState extends State<EPP> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: MMPCard(
            model: widget.model,
            title: '首月应还(元)',
            mmp: widget.model.eppAmountOfTerm(1),
            reduceTitle: '每月递减约${widget.model.eppMonthlyReduce.toStringAsFixed(2)}元',
            interestAmount: widget.model.eppInterestAmount,
          ),
        ),
        Expanded(
          child: ListView.separated(
            itemCount: widget.model.loanTermMonths,
            separatorBuilder: (context, index) => const Divider(),
            itemBuilder: (context, index) {
              int term = index + 1; // 期数
              double principal = widget.model.eppPrincipal; // 月供本金
              double interest = widget.model.eppInterestOfTerm(term); // 月供利息
              double amount = widget.model.eppAmountOfTerm(term); // 月供总额
              return ListTile(
                dense: true,
                leading: SXTag(
                  tagText: '${index + 1}',
                ),
                title: Text(
                  '¥${amount.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text('本金:${principal.toStringAsFixed(2)}'),
                        ),
                        Expanded(
                          child: Text('利息:${interest.toStringAsFixed(2)}'),
                        ),
                      ],
                    ),
                    Text('累计利息:${widget.model.eppInterestAfterTerm(term).toStringAsFixed(2)}'),
                    Row(
                      children: [
                        Expanded(
                          child: Text('已还本金:${widget.model.eppPaidPrincipalAfterTerm(term).toStringAsFixed(2)}'),
                        ),
                        Expanded(
                          child: Text('剩余本金:${widget.model.eppLoanLeftAfterTerm(term).toStringAsFixed(2)}'),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
