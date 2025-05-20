import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);

  TextEditingController searchController = TextEditingController();

  int currentPageIndex = 0;
  int choosenCategoryIndex = -1;
  int currentSliderIndex = 0;

  void changeIndex(int index) {
    currentPageIndex = index;
    emit(HomeChangeIndexState(currentPageIndex));
  }

  void resetIndex() {
    currentPageIndex = 0;
    emit(HomeChangeIndexState(currentPageIndex));
  }

  void onSliderChanged(int index) {
    currentSliderIndex = index;
    emit(HomeSliderChangedState());
  }
}
