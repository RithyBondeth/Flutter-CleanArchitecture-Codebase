import 'package:flutter/material.dart';
import 'package:ie_portal_agent_mobile/core/constants/routes_constant.dart';
import 'package:ie_portal_agent_mobile/presentation/pages/about_paga.dart';
import 'package:ie_portal_agent_mobile/presentation/pages/home_page.dart';
import 'package:ie_portal_agent_mobile/presentation/pages/not_found_page.dart';

class AppRoutes {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesConstant.home:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case RoutesConstant.about:
        return MaterialPageRoute(builder: (_) => const AboutPage());
      default:
        return MaterialPageRoute(builder: (_) => const NotFoundPage());
    }
  }
}
