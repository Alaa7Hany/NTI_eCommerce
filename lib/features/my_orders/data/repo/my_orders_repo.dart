import 'package:dartz/dartz.dart';
import 'package:nti_ecommerce/core/network/api_helper.dart';
import 'package:nti_ecommerce/core/network/api_response.dart';
import 'package:nti_ecommerce/features/my_orders/data/models/oreders_response_model.dart';

import '../../../../core/network/endpoints.dart';

class MyOrdersRepo {
  // Singleton
  static final MyOrdersRepo _instance = MyOrdersRepo._internal();
  factory MyOrdersRepo() {
    return _instance;
  }
  MyOrdersRepo._internal();

  // Get Orders
  Future<Either<String, Orders>> getOrders() async {
    try {
      ApiResponse response = await ApiHelper().getRequest(
        endPoint: EndPoints.getOrders,
        isProtected: true,
      );
      if (response.status) {
        OrdersResponseModel ordersResponseModel = OrdersResponseModel.fromJson(
          response.data,
        );
        return Right(ordersResponseModel.orders!);
      } else {
        throw Exception(response.message);
      }
    } catch (e) {
      ApiResponse apiResponse = ApiResponse.fromError(e);
      return Left(apiResponse.message);
    }
  }

  // Cancel Order
  Future<Either<String, String>> cancelOrder(int orderId) async {
    try {
      ApiResponse response = await ApiHelper().postRequest(
        endPoint: '${EndPoints.cancelOrder}/$orderId',
        isProtected: true,
      );
      if (response.status) {
        return Right(response.message);
      } else {
        throw Exception(response.message);
      }
    } catch (e) {
      ApiResponse apiResponse = ApiResponse.fromError(e);
      return Left(apiResponse.message);
    }
  }
}
