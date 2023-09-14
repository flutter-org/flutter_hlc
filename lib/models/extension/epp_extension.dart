
import 'package:flutter_hlc/models/home_loan_model.dart';

/// 等额本金
extension EPPExtension on HomeLoanModel {
  /// 月供本金(元)
  double get eppPrincipal => loanAmountYuan / loanTermMonths;

  /// 已还本金(元)-累计
  double eppPaidPrincipalAfterTerm(int term) {
    return eppPrincipal * term;
  }

  /// 贷款余额(元)
  double eppLoanLeftAfterTerm(int term) {
    return loanAmountYuan - eppPaidPrincipalAfterTerm(term);
  }

  /// 月供利息(元)
  double eppInterestOfTerm(int term) {
    assert(term >= 1 && term <= loanTermMonths);
    double lastTermLeftLoan = eppLoanLeftAfterTerm(term - 1);
    double interest = lastTermLeftLoan * monthlyInterestRate;
    return interest;
  }

  /// 月供总额(元)
  double eppAmountOfTerm(int term) {
    return eppPrincipal + eppInterestOfTerm(term);
  }

  /// 累计利息(元)
  double eppInterestAfterTerm(int term) {
    assert(term >= 1 && term <= loanTermMonths);
    double sum = 0;
    for (int i = 1; i <= term; i++) {
      sum += eppInterestOfTerm(i);
    }
    return sum;
  }

  /// 利息总额(万元)
  double get eppInterestAmount => eppInterestAfterTerm(loanTermMonths) / 10000;

  /// 每月递减(元)
  double get eppMonthlyReduce => eppPrincipal * monthlyInterestRate;
}