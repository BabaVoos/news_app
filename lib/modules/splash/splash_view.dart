import 'dart:async';

import 'package:flutter/material.dart';
import 'package:route_news_app/core/helpers.dart';

import '../../core/widgets/my_container.dart';
import '../home/home_view.dart';

class SplashView extends StatefulWidget {
  static const String routeName = 'splash';

  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Timer(
      const Duration(
        seconds: 2,
      ),
      () {
        context.pushReplacementNamed(HomeView.routeName);
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MyContainer(
      child: Scaffold(
        body: Center(
          child: Image.asset(
            'assets/images/logo.png',
          ),
        ),
      ),
    );
  }
}
