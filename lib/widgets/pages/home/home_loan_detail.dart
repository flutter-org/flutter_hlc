import 'package:flutter/material.dart';
import 'package:flutter_hlc/models/home_loan_model.dart';
import 'package:flutter_hlc/utils/go_router_util.dart';
import 'package:flutter_hlc/widgets/components/loan/elp.dart';
import 'package:flutter_hlc/widgets/components/loan/epp.dart';
import 'package:go_router/go_router.dart';

class HomeLoanDetailPage extends StatefulWidget {
  final HomeLoanModel argument;

  const HomeLoanDetailPage({
    super.key,
    required this.argument,
  });

  @override
  State<HomeLoanDetailPage> createState() => _HomeLoanDetailPageState();
}

class _HomeLoanDetailPageState extends State<HomeLoanDetailPage> {
  void _onClickChart() {
    context.pushNamed(
      GoRouterUtil.home_loan_chart,
      extra: widget.argument,
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('月供详情'),
          actions: [
            IconButton(
              onPressed: _onClickChart,
              icon: const Icon(Icons.ssid_chart),
            ),
          ],
          bottom: const TabBar(
            tabs: [
              Tab(text: '等额本息'),
              Tab(text: '等额本金'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ELP(model: widget.argument),
            EPP(model: widget.argument),
          ],
        ),
      ),
    );
  }
}
