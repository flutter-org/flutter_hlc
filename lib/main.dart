import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_hlc/utils/go_router_util.dart';

void main() {
  /// Be sure to add this line if `PackageInfo.fromPlatform()` is called before runApp()
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: GoRouterUtil.router,
      builder: EasyLoading.init(),
    );
  }
}
