import 'package:dartz/dartz.dart';
import 'package:nti_ecommerce/core/network/api_helper.dart';
import 'package:nti_ecommerce/core/network/api_keys.dart';
import 'package:nti_ecommerce/core/network/api_response.dart';
import 'package:nti_ecommerce/core/network/endpoints.dart';

import '../models/product_model.dart';

class ProductsRepo {
  // Singleton
  static final ProductsRepo _instance = ProductsRepo._internal();
  factory ProductsRepo() {
    return _instance;
  }
  ProductsRepo._internal();

  // Add To favourites
  Future<Either<String, String>> addToFavourites(int productId) async {
    try {
      ApiResponse response = await ApiHelper().postRequest(
        endPoint: EndPoints.addProductToFavourite,
        data: {ApiKeys.productId: productId},
        isProtected: true,
      );
      if (response.status) {
        return Right(response.message);
      } else {
        throw Exception('Something Went Wrong');
      }
    } catch (e) {
      ApiResponse apiResponse = ApiResponse.fromError(e);
      return left(apiResponse.message);
    }
  }

  // GetFavourites
  Future<Either<String, List<ProductModel>>> getFavourites() async {
    try {
      ApiResponse response = await ApiHelper().getRequest(
        endPoint: EndPoints.getProducts,
        isProtected: true,
      );
      if (response.status) {
        List<ProductModel> products = [];
        final productsJson = response.data['products'] as List;
        products = productsJson.map((e) => ProductModel.fromJson(e)).toList();
        return Right(
          products.where((product) => product.isFavorite == true).toList(),
        );
      } else {
        throw Exception(response.message);
      }
    } catch (e) {
      ApiResponse apiResponse = ApiResponse.fromError(e);
      return left(apiResponse.message);
    }
  }
}
