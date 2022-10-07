import 'package:flutter/material.dart';
import 'package:log_viewer/app.dart';
import 'package:log_viewer/ui/custom_widgets/containers/primary_container.dart';
import 'package:log_viewer/ui/custom_widgets/texts/h1.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: const [
            SizedBox(height: 12),
            H1Text(appTitle),
            PrimaryRoundedBorderContainer(
              child: H1Text("Drag and drop file"),
            )
          ],
        ),
      ),
    );
  }
}
