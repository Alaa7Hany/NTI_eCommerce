import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nti_ecommerce/core/network/api_helper.dart';
import 'package:nti_ecommerce/core/network/api_response.dart';
import 'package:nti_ecommerce/core/network/endpoints.dart';
import 'package:nti_ecommerce/features/auth/data/models/user_model.dart';

import '../../../../core/network/api_keys.dart';

class UserRepo {
  UserRepo._internal();

  static final UserRepo _instance = UserRepo._internal();

  factory UserRepo() {
    return _instance;
  }

  ApiHelper apiHelper = ApiHelper();

  UserModel userModel = UserModel(
    email: '',
    favoriteProducts: [],
    id: 0,
    imagePath: '',
    name: '',
    phone: '',
  );

  // get user data
  Future<Either<String, UserModel>> getUserData() async {
    try {
      ApiResponse apiResponse = await apiHelper.getRequest(
        endPoint: EndPoints.getUserData,
        isProtected: true,
      );
      if (apiResponse.status) {
        userModel = UserModel.fromJson(apiResponse.data[ApiKeys.user]);

        return Right(userModel);
      } else {
        throw Exception(apiResponse.message);
      }
    } catch (e) {
      ApiResponse apiResponse = ApiResponse.fromError(e);
      return Left(apiResponse.message);
    }
  }

  // update Profile
  Future<Either<String, String>> updateProfile({
    required String name,
    required String phone,
    required XFile? imageFile,
  }) async {
    try {
      ApiResponse apiResponse = await apiHelper.putRequest(
        endPoint: EndPoints.updateProfile,
        isProtected: true,
        data: {
          ApiKeys.name: name,
          ApiKeys.phone: phone,
          ApiKeys.image:
              imageFile != null
                  ? await MultipartFile.fromFile(imageFile.path)
                  : null,
        },
      );
      if (apiResponse.status) {
        return Right(apiResponse.message);
      } else {
        throw Exception(apiResponse.message);
      }
    } catch (e) {
      ApiResponse apiResponse = ApiResponse.fromError(e);
      return Left(apiResponse.message);
    }
  }

  // Delete Account
  Future<Either<String, String>> deleteAccount() async {
    try {
      ApiResponse apiResponse = await apiHelper.deleteRequest(
        endPoint: EndPoints.deleteUser,
        isProtected: true,
      );
      if (apiResponse.status) {
        return Right(apiResponse.message);
      } else {
        throw Exception(apiResponse.message);
      }
    } catch (e) {
      ApiResponse apiResponse = ApiResponse.fromError(e);
      return Left(apiResponse.message);
    }
  }
}
