import 'package:nti_ecommerce/core/data/models/product_model.dart';

class BestSellerResponseModel {
  List<ProductModel>? productModel;
  bool? status;

  BestSellerResponseModel({this.productModel, this.status});

  BestSellerResponseModel.fromJson(Map<String, dynamic> json) {
    if (json['best_seller_products'] != null) {
      productModel = <ProductModel>[];
      json['best_seller_products'].forEach((v) {
        productModel!.add(new ProductModel.fromJson(v));
      });
    }
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.productModel != null) {
      data['best_seller_products'] =
          this.productModel!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    return data;
  }
}
