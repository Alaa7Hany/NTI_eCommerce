import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_ecommerce/features/profile/manager/favourites_cubit/favourites_state.dart';

import '../../../../core/data/repo/products_repo.dart';

class FavouritesCubit extends Cubit<FavouritesState> {
  FavouritesCubit() : super(FavouritesInitial());
  static FavouritesCubit get(context) => BlocProvider.of(context);

  void loadFavourites() async {
    emit(FavouritesLoading());
    var result = await ProductsRepo().getFavourites();
    result.fold(
      (error) {
        emit(FavouritesError(error));
      },
      (favourites) {
        if (favourites.isEmpty) {
          emit(FavouritesEmpty());
        } else {
          emit(FavouritesLoaded(favourites));
        }
      },
    );
  }
}
