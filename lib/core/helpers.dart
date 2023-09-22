import 'package:flutter/material.dart';

extension MediaQueryHelper on BuildContext {
  double get screenHeight => MediaQuery.of(
        this,
      ).size.height;

  double get screenWidth => MediaQuery.of(
        this,
      ).size.width;
}

extension NavigatorHelper on BuildContext {
  void pushNamed({
    String? widget,
    Object? arguments,
  }) {
    Navigator.of(
      this,
    ).pushNamed(
      widget!,
      arguments: arguments,
    );
  }

  void pushReplacementNamed(
    String widget,
  ) {
    Navigator.of(
      this,
    ).pushReplacementNamed(
      widget,
    );
  }
}
