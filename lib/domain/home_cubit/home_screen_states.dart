import 'package:log_viewer/data/repos/logs_database.dart';

class HomeScreenState {}

class HomeScreenLoadingState extends HomeScreenState {}

class HomeScreenFileChosenState extends HomeScreenState {
  final LogsDatabase logsDatabase;
  HomeScreenFileChosenState(this.logsDatabase);
}

class HomeScreenErrorState extends HomeScreenState {
  final String errorMessage;
  HomeScreenErrorState(this.errorMessage);
}
