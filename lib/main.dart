import 'package:flutter/material.dart';
import 'package:route_news_app/core/theme.dart';
import 'package:route_news_app/modules/home/home_view.dart';
import 'package:route_news_app/modules/settings/settings_view.dart';
import 'package:route_news_app/modules/splash/splash_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ApplicationTheme.applicationTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: SplashView.routeName,
      routes: {
        SplashView.routeName: (context) => const SplashView(),
        HomeView.routeName: (context) => HomeView(),
        SettingsView.routeName: (context) => SettingsView(),
      },
    );
  }
}
