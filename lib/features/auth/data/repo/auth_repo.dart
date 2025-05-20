import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nti_ecommerce/core/cache/cache_data.dart';
import 'package:nti_ecommerce/core/cache/cache_helper.dart';
import 'package:nti_ecommerce/features/auth/data/models/login_response_model.dart';
import 'package:nti_ecommerce/features/auth/data/models/user_model.dart';
import 'package:nti_ecommerce/features/profile/data/repo/user_repo.dart';

import '../../../../core/cache/cache_keys.dart';
import '../../../../core/network/api_helper.dart';
import '../../../../core/network/api_keys.dart';
import '../../../../core/network/api_response.dart';
import '../../../../core/network/endpoints.dart';

class AuthRepo {
  // Singleton
  static final AuthRepo _instance = AuthRepo._init();
  factory AuthRepo() {
    return _instance;
  }
  AuthRepo._init();

  // resgister
  Future<Either<String, String>> register({
    required String name,
    required String email,
    required XFile? imageFile,
    required String password,
    required String phone,
  }) async {
    try {
      ApiResponse apiResponse = await ApiHelper().postRequest(
        endPoint: EndPoints.register,
        data: {
          ApiKeys.name: name,

          ApiKeys.password: password,
          ApiKeys.image:
              imageFile != null
                  ? await MultipartFile.fromFile(imageFile.path)
                  : null,
          ApiKeys.email: email,
          ApiKeys.phone: phone,
        },
      );
      return Right(apiResponse.message);
    } catch (e) {
      ApiResponse apiResponse = ApiResponse.fromError(e);
      return Left(apiResponse.message);
    }
  }

  // login
  Future<Either<String, UserModel>> login({
    required String email,
    required String password,
  }) async {
    try {
      ApiResponse apiResponse = await ApiHelper().postRequest(
        endPoint: EndPoints.login,
        data: {ApiKeys.password: password, ApiKeys.email: email},
      );
      LoginResponseModel loginResponseModel = LoginResponseModel.fromJson(
        apiResponse.data,
      );
      // Assign all the data to the user model in the user repo
      // as the UserCubit model is assigned to the user model in the user repo
      UserRepo().userModel.id = loginResponseModel.user!.id;
      UserRepo().userModel.name = loginResponseModel.user!.name;
      UserRepo().userModel.email = loginResponseModel.user!.email;
      UserRepo().userModel.phone = loginResponseModel.user!.phone;
      UserRepo().userModel.imageFile = loginResponseModel.user!.imageFile;
      UserRepo().userModel.favoriteProducts =
          loginResponseModel.user!.favoriteProducts;
      UserRepo().userModel.imagePath = loginResponseModel.user!.imagePath;
      CacheHelper.saveData(
        key: CacheKeys.accessToken,
        value: loginResponseModel.accessToken,
      );
      CacheHelper.saveData(
        key: CacheKeys.refreshToken,
        value: loginResponseModel.refreshToken,
      );
      CacheData.accessToken = loginResponseModel.accessToken;
      CacheData.refreshToken = loginResponseModel.refreshToken;
      return Right(loginResponseModel.user!);
    } catch (e) {
      ApiResponse apiResponse = ApiResponse.fromError(e);
      return Left(apiResponse.message);
    }
  }
}
