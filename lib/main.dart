import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kibrisarabam/core/services/navigation/navigation_service.dart';
import 'package:kibrisarabam/core/theme/custom_theme_data.dart';
import 'package:kibrisarabam/product/constants/app_constants.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      observers: const [], // TODO: Bunu araştır
      child: ScreenUtilInit(
          minTextAdapt: true,
          splitScreenMode: true,
          designSize: const Size(AppConstants.width, AppConstants.height),
          builder: (context, widget) => MaterialApp(
                debugShowCheckedModeBanner: false,
                title: AppConstants.appName,
                navigatorKey: NavigationService.instance.navigatorKey,
                routes: NavigationService.instance.routes,
                initialRoute: NavigationService.instance.initialRoute,
                theme: CustomThemeData.instance.appTheme,
              )),
    );
  }
}
