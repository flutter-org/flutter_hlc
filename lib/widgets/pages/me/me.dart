import 'package:flutter/material.dart';
import 'package:flutter_hlc/models/module_model.dart';
import 'package:flutter_hlc/utils/dart_packges/go_router_util.dart';
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
