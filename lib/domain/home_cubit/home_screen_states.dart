import 'package:log_viewer/data/repos/logs_repo.dart';

class HomeScreenState {}

class HomeScreenLoadingState extends HomeScreenState {}

class HomeScreenFileChosenState extends HomeScreenState {
  final LogsRepo logsDatabase;
  HomeScreenFileChosenState(this.logsDatabase);
}

class HomeScreenErrorState extends HomeScreenState {
  final String errorMessage;
  HomeScreenErrorState(this.errorMessage);
}
