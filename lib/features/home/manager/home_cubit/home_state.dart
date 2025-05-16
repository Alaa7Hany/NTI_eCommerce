abstract class HomeState {}

class HomeInitialState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeSuccessState extends HomeState {
  final int currentIndex;
  HomeSuccessState(this.currentIndex);
}

class HomeErrorState extends HomeState {
  final String error;
  HomeErrorState(this.error);
}

class HomeChangeIndexState extends HomeState {
  final int currentIndex;
  HomeChangeIndexState(this.currentIndex);
}
