import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
      theme: lightTheme.copyWith(
        textTheme: Theme.of(context).textTheme.apply(
              fontFamily: GoogleFonts.poppins().fontFamily,
            ),
      ),
      // darkTheme: darkTheme.copyWith(
      //   textTheme: Theme.of(context).textTheme.apply(
      //         bodyColor: lightBackground,
      //         fontFamily: GoogleFonts.poppins().fontFamily,
      //       ),
      // ),
      initialRoute: homeScreenRoute,
      onGenerateRoute: onGenerateRoute,
    );
  }
}
