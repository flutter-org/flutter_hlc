import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

class VersionPage extends StatefulWidget {
  const VersionPage({Key? key}) : super(key: key);

  @override
  State<VersionPage> createState() => _VersionPageState();
}

class _VersionPageState extends State<VersionPage> {
  PackageInfo? _packageInfo;

  @override
  void initState() {
    super.initState();
    _initPackageInfo();
  }

  void _initPackageInfo() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    setState(() {
      _packageInfo = packageInfo;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('版本信息')),
      body: _packageInfo != null
          ? Column(
              children: [
                ListTile(
                  title: const Text('当前版本'),
                  trailing: Text(_packageInfo!.version),
                ),
                ListTile(
                  title: const Text('应用名称'),
                  trailing: Text(_packageInfo!.appName),
                ),
                ListTile(
                  title: const Text('应用包名'),
                  trailing: Text(_packageInfo!.packageName),
                ),
                ListTile(
                  title: const Text('buildNumber'),
                  trailing: Text(_packageInfo!.buildNumber),
                ),
              ],
            )
          : null,
    );
  }
}
