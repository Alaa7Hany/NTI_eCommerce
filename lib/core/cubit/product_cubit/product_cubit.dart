import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_ecommerce/core/data/models/product_model.dart';
import 'package:nti_ecommerce/core/data/repo/cart_repo.dart';
import 'package:nti_ecommerce/core/data/repo/products_repo.dart';
import 'package:nti_ecommerce/core/cubit/product_cubit/product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial());

  static ProductCubit get(context) => BlocProvider.of(context);
  int amount = 1;
  late ProductModel productModel;

  void setProductModel(ProductModel model) {
    productModel = model;
    emit(ProductInitial());
  }

  void addToCart() {
    emit(ProductAddedToCartLoading());
    Future.delayed(const Duration(seconds: 2), () {
      CartRepo().cartProducts.add(productModel);
      emit(ProductAddedToCart());
    });
  }

  void addToFavorites() async {
    emit(ProductFavouriteLoading());
    // Simulate a network call
    var result = ProductsRepo().addToFavourites(productModel.id!);
    result.then((value) {
      value.fold(
        (l) {
          emit(ProductError(l));
        },
        (r) {
          productModel.isFavorite = true;
          emit(ProductAddedToFavorites(r));
        },
      );
    });
  }

  void removeFromFavorites() {
    emit(ProductFavouriteLoading());

    Future.delayed(const Duration(seconds: 2), () {
      productModel.isFavorite = false;
      emit(ProductRemovedFromFavorites());
    });
  }

  void increaseAmount() {
    amount++;
    emit(ProcductChangeAmount());
  }

  void decreaseAmount() {
    if (amount > 1) {
      amount--;
      emit(ProcductChangeAmount());
    }
  }
}
