import 'dart:math';

import 'package:flutter_hlc/models/home_loan_model.dart';

/// 等额本息
extension ELPExtension on HomeLoanModel {
  /// 每月应还
  double get elpAmount {
    double ir = (1 + monthlyInterestRate);
    num ci = pow(ir, loanTermMonths);
    return loanAmountYuan * monthlyInterestRate * ci / (ci - 1);
  }

  /// 利息总额
  double get interestAmount => (elpAmount * loanTermMonths - loanAmountYuan) / 10000;

  /// 月供利息(元)
  double elpInterestOfTerm(int term) {
    assert(term >= 1 && term <= loanTermMonths);
    double ir = (1 + monthlyInterestRate);
    num ci = pow(ir, term - 1);
    return (loanAmountYuan * monthlyInterestRate - elpAmount) * ci + elpAmount;
  }

  /// 月供本金(元)
  double elpPrincipal(int term) {
    return elpAmount - elpInterestOfTerm(term);
  }

  /// 累计利息
  double elpInterestAfterTerm(int term) {
    assert(term >= 1 && term <= loanTermMonths);
    double sum = 0;
    for (int i = 1; i <= term; i++) {
      sum += elpInterestOfTerm(i);
    }
    return sum;
  }

  /// 已还本金(元)
  double elpPaidPrincipalAfterTerm(int term) {
    assert(term >= 1 && term <= loanTermMonths);
    double sum = 0;
    for (int i = 1; i <= term; i++) {
      sum += elpPrincipal(i);
    }
    return sum;
  }

  /// 剩余本金(元)
  double elpLoanLeftAfterTerm(int term) {
    return loanAmountYuan - elpPaidPrincipalAfterTerm(term);
  }
}