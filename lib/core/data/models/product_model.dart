import 'package:flutter/foundation.dart';
import 'package:nti_ecommerce/features/home/data/models/category_response_model.dart';

import '../../helper/my_logger.dart';

class ProductModel {
  int? bestSeller;
  String? description;
  int? id;
  String? imagePath;
  bool? isFavorite;
  String? name;
  double? price;
  double? rating;
  CategoryModel? category;

  ProductModel({
    this.bestSeller,
    this.description,
    this.id,
    this.imagePath,
    this.isFavorite,
    this.name,
    this.price,
    this.rating,
  });

  ProductModel.fromJson(Map<String, dynamic> json) {
    bestSeller = json['best_seller'];
    description = json['description'];

    id = json['id'];

    imagePath = json['image_path'];
    isFavorite = json['is_favorite'];
    name = json['name'];
    price = json['price'];
    if (json['category'] != null) {
      category = CategoryModel.fromJson(json['category']);
    }
    rating = json['rating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['best_seller'] = this.bestSeller;
    data['description'] = this.description;
    data['id'] = this.id;
    data['image_path'] = this.imagePath;
    data['is_favorite'] = this.isFavorite;
    data['name'] = this.name;
    data['price'] = this.price;
    data['rating'] = this.rating;
    return data;
  }
}
