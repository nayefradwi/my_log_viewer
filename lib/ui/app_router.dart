import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:log_viewer/data/repos/logs_repo.dart';
import 'package:log_viewer/data/services/file_picker_factory.dart';
import 'package:log_viewer/domain/home_cubit/home_screen_bloc.dart';
import 'package:log_viewer/domain/logs_cubit/logs_bloc.dart';
import 'package:log_viewer/ui/screens/home_screen/home_screen.dart';
import 'package:log_viewer/ui/screens/logs_screen/logs_screen.dart';
import 'package:log_viewer/ui/screens/not_found_screen/not_found_screen.dart';

const String homeScreenRoute = "/";
const String logsScreenRoute = "/logs";

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case homeScreenRoute:
      return getHomeScreenRoute(settings);
    case logsScreenRoute:
      return getLogsScreenRoute(settings);
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

Route<dynamic> getLogsScreenRoute(RouteSettings settings) {
  return MaterialPageRoute(
    builder: (context) => BlocProvider(
      create: (BuildContext context) {
        return LogsScreenBloc(settings.arguments as LogsRepo);
      },
      child: const LogsScreen(),
    ),
  );
}

Route<dynamic> getNotFoundScreen(RouteSettings settings) {
  return MaterialPageRoute(
    builder: (context) => const NotFoundScreen(),
  );
}
