import 'package:flutter/material.dart';
import 'package:flutter_hlc/models/module_model.dart';
import 'package:flutter_hlc/widgets/components/sx_tabs.dart';
import 'package:flutter_hlc/widgets/pages/home/home_loan_input.dart';
import 'package:flutter_hlc/widgets/pages/me/me.dart';

class TabsPage extends StatefulWidget {
  const TabsPage({Key? key}) : super(key: key);

  @override
  State<TabsPage> createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  final List<ModuleModel> _tabs = [
    const ModuleModel(
      icon: Icons.home,
      title: '首页',
      page: HomeLoanInputPage(),
    ),
    const ModuleModel(
      icon: Icons.person,
      title: '我的',
      page: MePage(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SXTabs(tabs: _tabs);
  }
}
