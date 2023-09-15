// ignore_for_file: constant_identifier_names
import 'package:flutter/cupertino.dart';
import 'package:flutter_hlc/models/home_loan_model.dart';
import 'package:flutter_hlc/widgets/pages/entry/tabs.dart';
import 'package:flutter_hlc/widgets/pages/home/home_loan_chart.dart';
import 'package:flutter_hlc/widgets/pages/home/home_loan_detail.dart';
import 'package:flutter_hlc/widgets/pages/home/home_loan_input.dart';
import 'package:flutter_hlc/widgets/pages/me/my_loan/my_loan_input.dart';
import 'package:flutter_hlc/widgets/pages/me/version.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

class GoRouterUtil {
  static const String tabs = '/tabs';

  /// 住房商业贷款
  static const String home_loan_input = '/home_loan_input';
  static const String home_loan_detail = '/home_loan_detail';
  static const String home_loan_chart = '/home_loan_chart';

  /// 我的贷款
  static const String my_loan_input = '/my_loan_input';

  /// 版本
  static const String version = '/version';

  static final GoRouter router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: tabs,
    routes: [
      GoRoute(
        path: tabs,
        name: tabs,
        builder: (context, state) => const TabsPage(),
      ),
      GoRoute(
        path: home_loan_input,
        name: home_loan_input,
        builder: (context, state) => const HomeLoanInputPage(),
      ),
      GoRoute(
        path: home_loan_detail,
        name: home_loan_detail,
        builder: (context, state) => HomeLoanDetailPage(
          argument: state.extra as HomeLoanModel,
        ),
      ),
      GoRoute(
        path: home_loan_chart,
        name: home_loan_chart,
        builder: (context, state) => HomeLoanChartPage(
          argument: state.extra as HomeLoanModel,
        ),
      ),
      GoRoute(
        path: my_loan_input,
        name: my_loan_input,
        builder: (context, state) => const MyLoanInputPage(),
      ),
      GoRoute(
        path: version,
        name: version,
        builder: (context, state) => const VersionPage(),
      ),
    ],
  );
}
