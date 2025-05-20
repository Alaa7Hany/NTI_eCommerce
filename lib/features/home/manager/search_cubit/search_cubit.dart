import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:nti_ecommerce/core/helper/my_logger.dart';
import 'package:nti_ecommerce/core/translation/translation_keys.dart';
import 'package:nti_ecommerce/core/data/models/product_model.dart';
import 'package:nti_ecommerce/features/home/manager/search_cubit/search_state.dart';

import '../../data/repo/search_repo.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitialState());

  static SearchCubit get(context) => BlocProvider.of(context);

  TextEditingController searchController = TextEditingController();

  void search(String query) async {
    emit(SearchLoadingState());
    MyLogger.black(query);

    if (query.isNotEmpty) {
      var result = await SearchRepo().search(query);
      result.fold(
        (error) {
          emit(SearchErrorState(error));
        },
        (searchResults) {
          if (searchResults.isEmpty) {
            emit(SearchErrorState(TranslationKeys.NoResultsFound.tr));
            return;
          }
          emit(SearchSuccessState(searchResults));
        },
      );
    } else {
      emit(SearchErrorState(TranslationKeys.NoResultsFound.tr));
    }
  }
}
