import 'package:flutter/material.dart';
import 'package:log_viewer/ui/custom_widgets/buttons/primary_button.dart';
import 'package:log_viewer/ui/custom_widgets/texts/h1.dart';

class FileInputWidget extends StatelessWidget {
  const FileInputWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const H1Text("Drag and drop file"),
        const SizedBox(height: 16),
        const Text("or"),
        const SizedBox(height: 16),
        PrimaryElevatedButton(
          label: "Load File",
          onPressed: () {},
        )
      ],
    );
  }
}
