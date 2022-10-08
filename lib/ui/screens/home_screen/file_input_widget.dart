import 'package:desktop_drop/desktop_drop.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:log_viewer/domain/home_cubit/home_screen_bloc.dart';
import 'package:log_viewer/ui/custom_widgets/buttons/primary_button.dart';
import 'package:log_viewer/ui/custom_widgets/texts/h1.dart';

class FileInputWidget extends StatelessWidget {
  const FileInputWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropTarget(
      onDragEntered: (details) => debugPrint("onDragEntered"),
      onDragDone: (details) {
        if (details.files.length > 1) {
          context
              .read<HomeScreenBloc>()
              .emitError("cannot upload multiple files");
          return;
        }
        context
            .read<HomeScreenBloc>()
            .pickFile(fileDropped: details.files.first.path);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const H1Text("Drag and drop file"),
          const SizedBox(height: 16),
          const Text("or"),
          const SizedBox(height: 16),
          PrimaryElevatedButton(
            label: "Load File",
            onPressed: context.read<HomeScreenBloc>().pickFile,
          )
        ],
      ),
    );
  }
}
