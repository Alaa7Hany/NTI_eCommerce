class OrdersResponseModel {
  Orders? orders;
  bool? status;

  OrdersResponseModel({this.orders, this.status});

  OrdersResponseModel.fromJson(Map<String, dynamic> json) {
    orders = json['orders'] != null ? Orders.fromJson(json['orders']) : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (orders != null) {
      data['orders'] = orders!.toJson();
    }
    data['status'] = status;
    return data;
  }
}

class Orders {
  List<OrderModel>? active;
  List<OrderModel>? canceled;
  List<OrderModel>? completed;

  Orders({this.active, this.canceled, this.completed});

  Orders.fromJson(Map<String, dynamic> json) {
    active =
        (json['active'] as List<dynamic>?)
            ?.map((e) => OrderModel.fromJson(e))
            .toList();
    canceled =
        (json['canceled'] as List<dynamic>?)
            ?.map((e) => OrderModel.fromJson(e))
            .toList();
    completed =
        (json['completed'] as List<dynamic>?)
            ?.map((e) => OrderModel.fromJson(e))
            .toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (active != null) {
      data['active'] = active!.map((v) => v.toJson()).toList();
    }
    if (canceled != null) {
      data['canceled'] = canceled!.map((v) => v.toJson()).toList();
    }
    if (completed != null) {
      data['completed'] = completed!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OrderModel {
  Driver? driver;
  int? id;
  List<OrderItemModel>? items;
  String? orderChangeDate;
  String? orderDate;
  double? shipping;
  int? status;
  double? subtotal;
  double? tax;
  double? total;

  OrderModel({
    this.driver,
    this.id,
    this.items,
    this.orderChangeDate,
    this.orderDate,
    this.shipping,
    this.status,
    this.subtotal,
    this.tax,
    this.total,
  });

  OrderModel.fromJson(Map<String, dynamic> json) {
    driver = json['driver'] != null ? Driver.fromJson(json['driver']) : null;
    id = json['id'];
    items =
        (json['items'] as List<dynamic>?)
            ?.map((e) => OrderItemModel.fromJson(e))
            .toList();
    orderChangeDate = json['order_change_date'];
    orderDate = json['order_date'];
    shipping = (json['shipping'] as num?)?.toDouble();
    status = json['status'];
    subtotal = (json['subtotal'] as num?)?.toDouble();
    tax = (json['tax'] as num?)?.toDouble();
    total = (json['total'] as num?)?.toDouble();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (driver != null) data['driver'] = driver!.toJson();
    data['id'] = id;
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    data['order_change_date'] = orderChangeDate;
    data['order_date'] = orderDate;
    data['shipping'] = shipping;
    data['status'] = status;
    data['subtotal'] = subtotal;
    data['tax'] = tax;
    data['total'] = total;
    return data;
  }
}

class Driver {
  double? latitude;
  double? longitude;
  String? name;
  String? phone;

  Driver({this.latitude, this.longitude, this.name, this.phone});

  Driver.fromJson(Map<String, dynamic> json) {
    latitude = (json['latitude'] as num?)?.toDouble();
    longitude = (json['longitude'] as num?)?.toDouble();
    name = json['name'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    return {
      'latitude': latitude,
      'longitude': longitude,
      'name': name,
      'phone': phone,
    };
  }
}

class OrderItemModel {
  String? description;
  int? id;
  String? imagePath;
  String? name;
  double? price;
  int? quantity;
  double? rating;
  double? totalPrice;

  OrderItemModel({
    this.description,
    this.id,
    this.imagePath,
    this.name,
    this.price,
    this.quantity,
    this.rating,
    this.totalPrice,
  });

  OrderItemModel.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    id = json['id'];
    imagePath = json['image_path'];
    name = json['name'];
    price = (json['price'] as num?)?.toDouble();
    quantity = json['quantity'];
    rating = (json['rating'] as num?)?.toDouble();
    totalPrice = (json['total_price'] as num?)?.toDouble();
  }

  Map<String, dynamic> toJson() {
    return {
      'description': description,
      'id': id,
      'image_path': imagePath,
      'name': name,
      'price': price,
      'quantity': quantity,
      'rating': rating,
      'total_price': totalPrice,
    };
  }
}
