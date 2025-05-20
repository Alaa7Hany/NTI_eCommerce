import 'package:nti_ecommerce/core/data/models/product_model.dart';

abstract class FavouritesState {
  const FavouritesState();
}

class FavouritesInitial extends FavouritesState {}

class FavouritesLoading extends FavouritesState {}

class FavouritesLoaded extends FavouritesState {
  final List<ProductModel> favourites;

  const FavouritesLoaded(this.favourites);
}

class FavouritesError extends FavouritesState {
  final String error;

  const FavouritesError(this.error);
}

class FavouritesEmpty extends FavouritesState {}
