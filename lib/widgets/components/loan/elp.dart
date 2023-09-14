import 'package:flutter/material.dart';
import 'package:flutter_hlc/models/extension/elp_extension.dart';
import 'package:flutter_hlc/models/home_loan_model.dart';
import 'package:flutter_hlc/widgets/components/loan/mmp_card.dart';
import 'package:flutter_hlc/widgets/components/sx_ui/sx_tag.dart';

/// 等额本息(equal loan payment)
class ELP extends StatefulWidget {
  final HomeLoanModel model;

  const ELP({
    super.key,
    required this.model,
  });

  @override
  State<ELP> createState() => _ELPState();
}

class _ELPState extends State<ELP> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: MMPCard(
            model: widget.model,
            title: '每月应还(元)',
            mmp: widget.model.elpAmount,
            interestAmount: widget.model.interestAmount,
          ),
        ),
        Expanded(
          child: ListView.separated(
            itemCount: widget.model.loanTermMonths,
            separatorBuilder: (context, index) => const Divider(),
            itemBuilder: (context, index) {
              int term = index + 1; // 期数
              double amount = widget.model.elpAmount; // 月供总额
              double interest = widget.model.elpInterestOfTerm(term); // 月供利息
              double principal = widget.model.elpPrincipal(term); // 月供本金
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
                    Text('累计利息:${widget.model.elpInterestAfterTerm(term).toStringAsFixed(2)}'),
                    Row(
                      children: [
                        Expanded(
                          child: Text('已还本金:${widget.model.elpPaidPrincipalAfterTerm(term).toStringAsFixed(2)}'),
                        ),
                        Expanded(
                          child: Text('剩余本金:${widget.model.elpLoanLeftAfterTerm(term).toStringAsFixed(2)}'),
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
