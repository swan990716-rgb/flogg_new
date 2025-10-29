import 'package:flutter/material.dart';

import '../features/onboard/onboard_page.dart';
import '../features/home/home_shell.dart';
import '../features/write/write_flog_page.dart';

/// 네임드 라우트 정의 및 onGenerateRoute
class AppRoutes {
  static const String onboard = '/';
  static const String home = '/home';
  static const String write = '/write';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case onboard:
        return MaterialPageRoute(builder: (_) => const OnboardPage());
      case home:
        return MaterialPageRoute(builder: (_) => const HomeShell());
      case write:
        return MaterialPageRoute(builder: (_) => const WriteFlogPage());
      default:
        return MaterialPageRoute(builder: (_) => const OnboardPage());
    }
  }
}
