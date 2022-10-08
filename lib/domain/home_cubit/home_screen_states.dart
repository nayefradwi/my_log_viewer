class HomeScreenState {}

class HomeScreenLoadingState extends HomeScreenState {}

class HomeScreenFileChosenState extends HomeScreenState {
  final String filePath;
  HomeScreenFileChosenState(this.filePath);
}

class HomeScreenErrorState extends HomeScreenState {
  final String errorMessage;
  HomeScreenErrorState(this.errorMessage);
}
