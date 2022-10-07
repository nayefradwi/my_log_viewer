import 'package:flutter/material.dart';
import 'package:log_viewer/ui/screens/home_screen/home_screen.dart';

const String homeScreenRoute = "/";

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case homeScreenRoute:
      return getHomeScreenRoute(settings);
    default:
      return getNotFoundScreen(settings);
  }
}

Route<dynamic> getHomeScreenRoute(RouteSettings settings) {
  return MaterialPageRoute(
    builder: (context) => const HomeScreen(),
  );
}

Route<dynamic> getNotFoundScreen(RouteSettings settings) {
  return MaterialPageRoute(
    builder: (context) => const HomeScreen(),
  );
}
