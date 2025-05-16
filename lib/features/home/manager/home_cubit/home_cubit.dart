import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  void changeIndex(int index) {
    currentIndex = index;
    emit(HomeChangeIndexState(currentIndex));
  }

  void resetIndex() {
    currentIndex = 0;
    emit(HomeChangeIndexState(currentIndex));
  }
}
