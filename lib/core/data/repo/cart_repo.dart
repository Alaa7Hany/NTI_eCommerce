import '../models/product_model.dart';

class CartRepo {
  // Singletorn
  static final CartRepo _instance = CartRepo._internal();
  factory CartRepo() {
    return _instance;
  }
  CartRepo._internal();

  List<ProductModel> cartProducts = [];
}
