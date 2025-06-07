import 'package:conference_app/core/dependency_injection/setup_locator.dart';
import 'package:conference_app/core/routing/app_router.dart';
import 'package:conference_app/core/routing/routes.dart';
import 'package:conference_app/core/utils/theme_data_func.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

void main() async {
  await ScreenUtil.ensureScreenSize();
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: MaterialApp.router(
        theme: themeDataFunc(),
        debugShowCheckedModeBanner: false,
        routerConfig: GoRouter(
          routes: AppRouter.routes,
          initialLocation: Routes.splash,
        ),
      ),
    );
  }
}
