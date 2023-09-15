import 'package:flutter_hlc/models/home_loan_model.dart';

class MyLoanModel extends HomeLoanModel {
  MyLoanModel({
    required super.loanAmount,
    required super.loanTerm,
    required super.annualInterestRate,
  });

  factory MyLoanModel.fromJson(Map<String, dynamic> json) {
    return MyLoanModel(
      loanAmount: json['loanAmount'],
      loanTerm: json['loanTerm'],
      annualInterestRate: json['annualInterestRate'],
    );
  }

  Map<String, dynamic> toJson() => {
        'loanAmount': loanAmount,
        'loanTerm': loanTerm,
        'annualInterestRate': annualInterestRate,
      };
}
