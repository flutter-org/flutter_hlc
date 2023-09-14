class HomeLoanModel {
  /// 贷款金额(万)
  final double loanAmount;

  /// 贷款年限(年)
  final int loanTerm;

  /// 年利率(单利%)
  final double annualInterestRate;

  HomeLoanModel({
    required this.loanAmount,
    required this.loanTerm,
    required this.annualInterestRate,
  });

  /// 贷款金额(元)
  double get loanAmountYuan => loanAmount * 10000;

  /// 贷款期数(月)
  int get loanTermMonths => loanTerm * 12;

  /// 月利率(0.0035)
  double get monthlyInterestRate => annualInterestRate / 12 / 100;
}