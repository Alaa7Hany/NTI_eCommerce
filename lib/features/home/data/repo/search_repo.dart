import 'package:dartz/dartz.dart';
import 'package:nti_ecommerce/core/network/api_helper.dart';

import '../../../../core/network/api_response.dart';
import '../../../../core/network/endpoints.dart';
import '../../../../core/data/models/product_model.dart';

class SearchRepo {
  // singleton
  static final SearchRepo _instance = SearchRepo._internal();
  factory SearchRepo() {
    return _instance;
  }
  SearchRepo._internal();

  // search function
  Future<Either<String, List<ProductModel>>> search(String query) async {
    try {
      ApiResponse response = await ApiHelper().getRequest(
        endPoint: EndPoints.searchProducts,
        query: {'q': query},
        isProtected: true,
      );

      if (response.status) {
        List<ProductModel> searchResults = [];
        final productsJson = response.data['products'] as List;
        searchResults =
            productsJson.map((e) => ProductModel.fromJson(e)).toList();

        return Right(searchResults);
      } else {
        throw Exception(response.message);
      }
    } catch (e) {
      ApiResponse response = ApiResponse.fromError(e);
      return Left(response.message);
    }
  }
}
