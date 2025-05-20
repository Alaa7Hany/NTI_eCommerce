import 'package:nti_ecommerce/core/helper/my_logger.dart';

import '../../../../core/data/models/product_model.dart';

class CategoriesResponseModel {
  List<CategoryModel>? categories;
  bool? status;

  CategoriesResponseModel({this.categories, this.status});

  CategoriesResponseModel.fromJson(Map<String, dynamic> json) {
    if (json['categories'] != null) {
      categories = <CategoryModel>[];

      json['categories'].forEach((v) {
        categories!.add(CategoryModel.fromJson(v));
      });
    }
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.categories != null) {
      data['categories'] = this.categories!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    return data;
  }
}

class CategoryModel {
  String? description;
  int? id;
  String? imagePath;
  List<ProductModel>? products;
  String? title;

  CategoryModel({
    this.description,
    this.id,
    this.imagePath,
    this.products,
    this.title,
  });

  CategoryModel.fromJson(Map<String, dynamic> json) {
    description = json['description'];

    id = json['id'];

    imagePath = json['image_path'];

    if (json['products'] != null) {
      products = <ProductModel>[];

      json['products'].forEach((v) {
        products!.add(new ProductModel.fromJson(v));
      });
    }
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['description'] = this.description;

    data['id'] = this.id;
    data['image_path'] = this.imagePath;
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    data['title'] = this.title;
    return data;
  }
}
