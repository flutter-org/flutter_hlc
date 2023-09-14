import 'package:flutter/material.dart';
import 'package:flutter_hlc/models/module_model.dart';

class SXTabs extends StatefulWidget {
  final List<ModuleModel> tabs;

  const SXTabs({
    Key? key,
    required this.tabs,
  }) : super(key: key);

  @override
  State<SXTabs> createState() => _SXTabsState();
}

class _SXTabsState extends State<SXTabs> {
  int _index = 0;

  void _onDestinationSelected(int index) {
    setState(() {
      _index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _index,
        children: [
          for (ModuleModel module in widget.tabs) module.page!,
        ],
      ),
      bottomNavigationBar: NavigationBar(
        destinations: [
          for (ModuleModel tab in widget.tabs)
            NavigationDestination(
              icon: Icon(tab.icon),
              label: tab.title,
            ),
        ],
        selectedIndex: _index,
        onDestinationSelected: _onDestinationSelected,
      ),
    );
  }
}
