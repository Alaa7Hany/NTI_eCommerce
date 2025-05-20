import 'package:dartz/dartz.dart';
import 'package:nti_ecommerce/features/home/data/models/best_seller_response_model.dart';
import 'package:nti_ecommerce/core/data/models/product_model.dart';

import '../../../../core/network/api_helper.dart';
import '../../../../core/network/api_response.dart';
import '../../../../core/network/endpoints.dart';
import '../models/category_response_model.dart';

class BestSellerRepo {
  // Singleton
  static final BestSellerRepo _instance = BestSellerRepo._internal();
  factory BestSellerRepo() {
    return _instance;
  }
  BestSellerRepo._internal();

  // get best sellers
  Future<Either<String, List<ProductModel>>> getBestSellers() async {
    try {
      ApiResponse apiResponse = await ApiHelper().getRequest(
        endPoint: EndPoints.bestSellerProducts,
        isProtected: true,
      );

      BestSellerResponseModel bestSellerResponseModel =
          BestSellerResponseModel.fromJson(apiResponse.data);

      if (apiResponse.status) {
        return Right(bestSellerResponseModel.productModel!);
      } else {
        throw Exception('Error fetching categories');
      }
    } catch (e) {
      ApiResponse apiResponse = ApiResponse.fromError(e);
      return Left(apiResponse.message);
    }
  }
}
