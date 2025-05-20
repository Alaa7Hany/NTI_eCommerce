import 'package:dartz/dartz.dart';
import 'package:nti_ecommerce/core/helper/my_logger.dart';
import 'package:nti_ecommerce/features/home/data/models/category_response_model.dart';

import '../../../../core/cache/cache_helper.dart';
import '../../../../core/cache/cache_keys.dart';
import '../../../../core/network/api_helper.dart';
import '../../../../core/network/api_response.dart';
import '../../../../core/network/endpoints.dart';

class CategoriesRepo {
  // Singleton
  static final CategoriesRepo _instance = CategoriesRepo._init();
  factory CategoriesRepo() {
    return _instance;
  }
  CategoriesRepo._init();
  List<CategoryModel> categories = [];
  // get categories
  Future<Either<String, List<CategoryModel>>> getCategories() async {
    try {
      ApiResponse apiResponse = await ApiHelper().getRequest(
        endPoint: EndPoints.getCategories,
        isProtected: true,
      );

      CategoriesResponseModel categoryResponseModel =
          CategoriesResponseModel.fromJson(apiResponse.data);

      if (apiResponse.status) {
        categories = categoryResponseModel.categories!;
        return Right(categoryResponseModel.categories!);
      } else {
        throw Exception('Error fetching categories');
      }
    } catch (e) {
      ApiResponse apiResponse = ApiResponse.fromError(e);
      return Left(apiResponse.message);
    }
  }
}
