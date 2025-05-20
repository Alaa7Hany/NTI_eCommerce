import 'package:dartz/dartz.dart';

import '../../../../core/network/api_helper.dart';
import '../../../../core/network/api_response.dart';
import '../../../../core/network/endpoints.dart';
import '../models/sliders_response_model.dart';

class SlidersRepo {
  // Singleton
  static final SlidersRepo _instance = SlidersRepo._init();
  factory SlidersRepo() {
    return _instance;
  }
  SlidersRepo._init();

  // get sliders
  Future<Either<String, List<SliderModel>>> getSliders() async {
    try {
      ApiResponse apiResponse = await ApiHelper().getRequest(
        endPoint: EndPoints.getSliders,
      );

      SlidersResponseModel slidersResponseModel = SlidersResponseModel.fromJson(
        apiResponse.data,
      );

      if (apiResponse.status) {
        return Right(slidersResponseModel.sliders!);
      } else {
        throw Exception('Error fetching sliders');
      }
    } catch (e) {
      ApiResponse apiResponse = ApiResponse.fromError(e);
      return Left(apiResponse.message);
    }
  }
}
