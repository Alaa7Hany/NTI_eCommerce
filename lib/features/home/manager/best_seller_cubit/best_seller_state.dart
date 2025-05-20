import '../../../../core/data/models/product_model.dart';

abstract class BestSellerState {}

class BestSellerInitialState extends BestSellerState {}

class BestSellerLoadingState extends BestSellerState {}

class BestSellerLoadedState extends BestSellerState {
  final List<ProductModel> bestSellers;
  BestSellerLoadedState(this.bestSellers);
}

class BestSellerErrorState extends BestSellerState {
  final String error;
  BestSellerErrorState(this.error);
}
