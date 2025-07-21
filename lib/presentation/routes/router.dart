import 'package:auto_route/auto_route.dart';
import 'package:nimbus/presentation/pages/home/home_page.dart';

part 'router.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Page,Route',
)
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: HomeRoute.page, initial: true),
      ];
}