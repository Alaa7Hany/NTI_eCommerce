abstract class ProductState {}

class ProductInitial extends ProductState {}

class ProductFavouriteLoading extends ProductState {}

class ProductAddedToCartLoading extends ProductState {}

class ProductAddedToCart extends ProductState {}

class ProductAddedToFavorites extends ProductState {
  final String message;

  ProductAddedToFavorites(this.message);
}

class ProductError extends ProductState {
  final String error;

  ProductError(this.error);
}

class ProductRemovedFromFavorites extends ProductState {}

class ProcductChangeAmount extends ProductState {}
