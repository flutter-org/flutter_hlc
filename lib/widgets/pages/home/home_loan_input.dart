import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_hlc/models/home_loan_model.dart';
import 'package:flutter_hlc/models/text_field_model.dart';
import 'package:flutter_hlc/utils/go_router_util.dart';
import 'package:go_router/go_router.dart';

class HomeLoanInputPage extends StatefulWidget {
  const HomeLoanInputPage({super.key});

  @override
  State<HomeLoanInputPage> createState() => _HomeLoanInputPageState();
}

class _HomeLoanInputPageState extends State<HomeLoanInputPage> {
  final List<TextFieldModel> _list = [
    TextFieldModel(
      title: '贷款金额',
      unit: '万',
      controller: TextEditingController(),
      valueType: ValueType.double,
    ),
    TextFieldModel(
      title: '贷款年限',
      unit: '年',
      controller: TextEditingController(),
      valueType: ValueType.int,
    ),
    TextFieldModel(
      title: '年利率(单利)',
      unit: '%',
      controller: TextEditingController(),
      valueType: ValueType.double,
    ),
  ];

  void _onClickCalculate() {
    for (TextFieldModel model in _list) {
      if (model.value == null) {
        EasyLoading.showError('${model.title}输入错误');
        return;
      }
    }

    context.pushNamed(
      GoRouterUtil.home_loan_detail,
      extra: HomeLoanModel(
        loanAmount: _list[0].value,
        loanTerm: _list[1].value,
        annualInterestRate: _list[2].value,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('商业贷款'),
      ),
      body: ListView.builder(
        itemCount: _list.length,
        itemBuilder: (context, index) {
          TextFieldModel model = _list[index];
          return TextField(
            controller: model.controller,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(8),
              labelText: model.title,
              hintText: model.hintText,
              suffixText: model.unit,
            ),
          );
        },
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: _onClickCalculate,
            child: const Text('开始计算'),
          ),
        ),
      ),
    );
  }
}
