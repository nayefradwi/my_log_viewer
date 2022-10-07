import 'package:flutter/material.dart';
import 'package:log_viewer/ui/app_router.dart';
import 'package:log_viewer/ui/style.dart';

const String appTitle = "Log Viewer";

class LogViewerApp extends StatelessWidget {
  const LogViewerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      initialRoute: homeScreenRoute,
      onGenerateRoute: onGenerateRoute,
    );
  }
}
