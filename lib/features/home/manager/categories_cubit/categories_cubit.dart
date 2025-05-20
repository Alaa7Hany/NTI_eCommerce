import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_ecommerce/features/home/manager/categories_cubit/categories_state.dart';

import '../../data/repo/categories_repo.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit() : super(CategoriesInitial());
  static CategoriesCubit get(context) => BlocProvider.of(context);

  void getCategories() async {
    emit(CategoriesLoading());

    var result = await CategoriesRepo().getCategories();
    result.fold(
      (error) {
        emit(CategoriesError(error));
      },
      (categories) {
        if (categories.isNotEmpty) {
          emit(CategoriesLoaded(categories));
        } else {
          emit(CategoriesEmpty());
        }
      },
    );
  }
}
