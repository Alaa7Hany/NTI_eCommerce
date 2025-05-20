import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_ecommerce/features/home/manager/sliders_cubit/sliders_sate.dart';

import '../../data/repo/sliders_repo.dart';

class SlidersCubit extends Cubit<SlidersState> {
  SlidersCubit() : super(SlidersInitial());
  static SlidersCubit get(context) => BlocProvider.of(context);

  void getSliders() async {
    emit(SlidersLoading());

    var result = await SlidersRepo().getSliders();
    result.fold(
      (error) {
        emit(SlidersError(error));
      },
      (sliders) {
        if (sliders.isNotEmpty) {
          emit(SlidersLoaded(sliders));
        } else {
          emit(SlidersEmpty());
        }
      },
    );
  }
}
