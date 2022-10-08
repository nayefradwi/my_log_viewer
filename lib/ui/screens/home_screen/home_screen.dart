import 'package:flutter/material.dart';
import 'package:log_viewer/app.dart';
import 'package:log_viewer/ui/custom_widgets/containers/primary_container.dart';
import 'package:log_viewer/ui/custom_widgets/texts/h1.dart';

import 'file_input_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: const [
          SizedBox(height: 12),
          Center(child: H1Text(appTitle)),
          Expanded(
            child: PrimaryRoundedBorderContainer(
              child: FileInputWidget(),
            ),
          )
        ],
      ),
    );
  }
}
