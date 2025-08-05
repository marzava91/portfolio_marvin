import 'package:go_router/go_router.dart';

import '../pages/projects_detail/miji_mobile_app/miji_mobile_app_screen.dart';
import '../pages/projects_detail/miji_admin_panel/miji_admin_panel_screen.dart';
import '../pages/projects_detail/miji_landing_page/miji_landing_page_screen.dart';
import '../pages/projects_detail/miji_analytics/miji_analytics_screen.dart';
import '../pages/projects_detail/tec_landing_page/tec_landing_page_screen.dart';
import '../pages/home/home_page.dart';
import '../pages/errors/not_found_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => HomePage(),
    ),
    GoRoute(
      path: '/projects/miji-mobile-app',
      builder: (context, state) => MijiMobileAppScreen(),
    ),
    GoRoute(
      path: '/projects/miji-admin-panel',
      builder: (context, state) => MijiAdminPanelScreen(),
    ),
    GoRoute(
      path: '/projects/miji-landing-page',
      builder: (context, state) => MijiLandingPageScreen(),
    ),
    GoRoute(
      path: '/projects/miji-analytics',
      builder: (context, state) => MijiAnalyticsScreen(),
    ),
    GoRoute(
      path: '/projects/tec-landing-page',
      builder: (context, state) => TecLandingPageScreen(),
    ),
  ],
  errorBuilder: (context, state) => const NotFoundScreen(),
);
