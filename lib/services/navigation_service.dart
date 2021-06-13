import 'package:flutter/material.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey =
      new GlobalKey<NavigatorState>();

  Future navigateTo(String routeName,
      {Object arguments, bool withreplacement}) {
    if (withreplacement) {
      return navigatorKey.currentState.pushNamedAndRemoveUntil(
          routeName, (route) => false,
          arguments: arguments);
    } else {
      return navigatorKey.currentState
          .pushNamed(routeName, arguments: arguments);
    }
  }

  bool pop({String routeName, Object argument}) {
    navigatorKey.currentState.pop();

    return true;
  }
}
