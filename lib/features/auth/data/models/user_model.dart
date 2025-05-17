import 'package:image_picker/image_picker.dart';
import 'package:nti_ecommerce/core/network/api_keys.dart';

class UserModel {
  String? email;
  List<dynamic>? favoriteProducts;
  int? id;
  String? imagePath;
  String? name;
  String? phone;
  XFile? imageFile;

  UserModel({
    this.email,
    this.favoriteProducts,
    this.id,
    this.imagePath,
    this.name,
    this.phone,
    this.imageFile,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    email = json[ApiKeys.email];
    if (json[ApiKeys.favoriteProducts] != null) {
      favoriteProducts = <dynamic>[];
      json[ApiKeys.favoriteProducts].forEach((v) {
        favoriteProducts!.add(v);
      });
    }
    id = json[ApiKeys.id];
    imagePath = json[ApiKeys.imagePath];
    name = json[ApiKeys.name];
    phone = json[ApiKeys.phone];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data[ApiKeys.email] = this.email;
    if (this.favoriteProducts != null) {
      data[ApiKeys.favoriteProducts] = this.favoriteProducts;
    }
    data[ApiKeys.id] = this.id;
    data[ApiKeys.imagePath] = this.imagePath;
    data[ApiKeys.name] = this.name;
    data[ApiKeys.phone] = this.phone;
    return data;
  }
}
