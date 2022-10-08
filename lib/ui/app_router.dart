import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:log_viewer/data/services/file_picker_factory.dart';
import 'package:log_viewer/domain/home_cubit/home_screen_bloc.dart';
import 'package:log_viewer/ui/screens/home_screen/home_screen.dart';
import 'package:log_viewer/ui/screens/not_found_screen/not_found_screen.dart';

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
    builder: (context) => BlocProvider(
      create: (BuildContext context) {
        return HomeScreenBloc(generateFilePicker(defaultTargetPlatform));
      },
      child: const HomeScreen(),
    ),
  );
}

Route<dynamic> getNotFoundScreen(RouteSettings settings) {
  return MaterialPageRoute(
    builder: (context) => const NotFoundScreen(),
  );
}
