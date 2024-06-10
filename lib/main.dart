import 'package:flutter/material.dart';
import 'package:smartpay/app/app.router.dart';
import 'package:smartpay/ui/styles/theme_manager.dart';

import 'app/application.dart';


Future<void> main() async {
  await Application.initialize();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Application.appName,
      themeMode: locator<ThemeNotifier>().themeMode,
      theme: locator<ThemeNotifier>().lightTheme,
     // darkTheme: locator<ThemeNotifier>().darkTheme,
      initialRoute: Routes.startupView,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      navigatorKey: StackedService.navigatorKey,
      navigatorObservers: [
        StackedService.routeObserver,
      ],
    );
  }
}
