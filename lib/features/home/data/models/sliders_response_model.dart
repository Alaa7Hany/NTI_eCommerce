class SlidersResponseModel {
  List<SliderModel>? sliders;
  bool? status;

  SlidersResponseModel({this.sliders, this.status});

  SlidersResponseModel.fromJson(Map<String, dynamic> json) {
    if (json['sliders'] != null) {
      sliders = <SliderModel>[];
      json['sliders'].forEach((v) {
        sliders!.add(new SliderModel.fromJson(v));
      });
    }
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.sliders != null) {
      data['sliders'] = this.sliders!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    return data;
  }
}

class SliderModel {
  String? description;
  int? id;
  String? imagePath;
  String? title;

  SliderModel({this.description, this.id, this.imagePath, this.title});

  SliderModel.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    id = json['id'];
    imagePath = json['image_path'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['description'] = this.description;
    data['id'] = this.id;
    data['image_path'] = this.imagePath;
    data['title'] = this.title;
    return data;
  }
}
