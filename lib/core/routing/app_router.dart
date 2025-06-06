import 'package:conference_app/features/home/ui/home_view.dart';
import 'package:conference_app/features/splash/ui/splash_view.dart';
import 'package:go_router/go_router.dart';

import 'animation_route.dart';
import 'routes.dart';

abstract class AppRouter {
  static final List<GoRoute> routes = [
    GoRoute(
      name: 'home',
      path: Routes.home,
      pageBuilder: (context, state) {
        return fadeTransitionPage(HomeView());
      },
    ),
    GoRoute(
      name: 'splash',
      path: Routes.splash,
      pageBuilder: (context, state) {
        return fadeTransitionPage(SplashView());
      },
    ),
  ];
}
