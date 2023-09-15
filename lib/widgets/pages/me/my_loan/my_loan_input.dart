import 'package:flutter/material.dart';
import 'package:flutter_hlc/models/text_field_model.dart';
import 'package:flutter_hlc/widgets/components/sx_ui/sx_bottom_button.dart';

class MyLoanInputPage extends StatefulWidget {
  const MyLoanInputPage({super.key});

  @override
  State<MyLoanInputPage> createState() => _MyLoanInputPageState();
}

class _MyLoanInputPageState extends State<MyLoanInputPage> {
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
      controller: TextEditingController()..text = '30',
      valueType: ValueType.int,
    ),
    TextFieldModel(
      title: '起始日期',
      unit: '年',
      controller: TextEditingController()..text,
      valueType: ValueType.string,
    ),
    TextFieldModel(
      title: '年利率(单利)',
      unit: '%',
      controller: TextEditingController(),
      valueType: ValueType.double,
    ),
  ];

  void _onClickSave() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('我的贷款录入'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
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
          ),
        ],
      ),
      bottomNavigationBar: SXBottomButton(
        onPressed: _onClickSave,
        text: '保存',
      ),
    );
  }
}
