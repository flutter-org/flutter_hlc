import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_hlc/models/module_model.dart';
import 'package:flutter_hlc/models/my_loan_model.dart';
import 'package:flutter_hlc/utils/dart_packges/go_router_util.dart';
import 'package:flutter_hlc/utils/flutter_plugins/shared_preferences_util.dart';
import 'package:flutter_hlc/utils/sp_key.dart';
import 'package:go_router/go_router.dart';

class MePage extends StatefulWidget {
  const MePage({Key? key}) : super(key: key);

  @override
  State<MePage> createState() => _MePageState();
}

class _MePageState extends State<MePage> {
  final List<ModuleModel> _modules = [
    const ModuleModel(
      icon: Icons.info,
      title: '版本信息',
      routeName: GoRouterUtil.version,
    ),
  ];

  MyLoanModel? _myLoanModel;

  @override
  void initState() {
    super.initState();
    _initDataFromSP();
  }

  void _initDataFromSP() async {
    String? jsonString = await SharedPreferencesUtil.instance().getString(SPKey.my_loan_model);
    if (jsonString != null) {
      Map<String, dynamic> map = json.decode(jsonString!);
      MyLoanModel model = MyLoanModel.fromJson(map);
      setState(() {
        _myLoanModel = model;
      });
    }
  }

  void _onClickRecordMyLoan() async {
    MyLoanModel? model = await context.pushNamed(GoRouterUtil.my_loan_input);
    if (model != null) {
      setState(() {
        _myLoanModel = model;
      });
    }
  }

  void _onClickModule(ModuleModel module) {
    if (module.routeName != null) {
      context.pushNamed(module.routeName!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('我的')),
      body: Column(
        children: [
          _myLoanModel != null
              ? Card()
              : Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(8),
                  child: ElevatedButton(
                    onPressed: _onClickRecordMyLoan,
                    child: const Text('录入我的贷款'),
                  ),
                ),
          Expanded(
            child: ListView.separated(
              itemCount: _modules.length,
              separatorBuilder: (BuildContext context, int index) {
                return const Divider(height: 1);
              },
              itemBuilder: (BuildContext context, int index) {
                ModuleModel model = _modules[index];
                return ListTile(
                  onTap: () {
                    _onClickModule(model);
                  },
                  leading: Icon(model.icon),
                  title: Text(model.title),
                  trailing: const Icon(Icons.arrow_forward_ios),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
