import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:log_viewer/app.dart';
import 'package:log_viewer/domain/home_cubit/home_screen_bloc.dart';
import 'package:log_viewer/domain/home_cubit/home_screen_states.dart';
import 'package:log_viewer/ui/app_router.dart';
import 'package:log_viewer/ui/custom_widgets/containers/primary_container.dart';
import 'package:log_viewer/ui/custom_widgets/notifications/app_snackbar.dart';
import 'package:log_viewer/ui/custom_widgets/texts/h1.dart';

import 'file_input_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeScreenBloc, HomeScreenState>(
      listener: _listener,
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: const [
            SizedBox(height: 12),
            Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: H1Text(appTitle),
            ),
            Expanded(
              child: PrimaryRoundedBorderContainer(
                child: FileInputWidget(),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _listener(BuildContext context, HomeScreenState state) {
    if (state is HomeScreenErrorState) {
      AppSnackBar.show(context, state.errorMessage);
    } else if (state is HomeScreenFileChosenState) {
      Navigator.of(context).pushNamed(
        logsScreenRoute,
        arguments: state.logsDatabase,
      );
    }
  }
}
