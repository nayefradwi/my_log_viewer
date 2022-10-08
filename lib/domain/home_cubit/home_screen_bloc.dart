import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_screen_states.dart';

const List<String> supportedFileExtensions = [];

class HomeScreenBloc extends Cubit<HomeScreenState> {
  HomeScreenBloc() : super(HomeScreenState());
}
