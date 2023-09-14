import 'package:flutter/material.dart';

enum ModuleType {
  none,
  route, // 路由
  website, // 网址
}

@immutable
class ModuleModel {
  final String title;
  final IconData? icon;
  final ModuleType type;

  IconData? get trailingIcon {
    switch (type) {
      case ModuleType.route:
        return Icons.arrow_forward_ios;
      case ModuleType.website:
        return Icons.open_in_browser;
      default:
        return null;
    }
  }

  final Widget? page;
  final String? routeName;
  final String? routePath;
  final String? url; // 网址
  final List<ModuleModel> children;
  final Object? arguments;

  const ModuleModel({
    required this.title,
    this.icon,
    this.type = ModuleType.route,
    this.page,
    this.routeName,
    this.routePath,
    this.url,
    this.children = const [],
    this.arguments,
  });
}
