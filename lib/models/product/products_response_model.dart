import 'package:sample_provider_app/models/product/product_model.dart';

class ProductResponseModel {
  bool success;
  int statusCode;
  String message;
  List<ProductModel> data;

  ProductResponseModel(
      {this.success, this.statusCode, this.message, this.data});

  ProductResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    statusCode = json['statusCode'];
    message = json['message'];
    if (json['data'] != null) {
      data = new List<ProductModel>();
      json['data'].forEach((v) {
        data.add(new ProductModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['statusCode'] = this.statusCode;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }

  ProductResponseModel.withError(
      {bool success, String message, int statusCode}) {
    this.success = success;
    this.message = message;
    this.statusCode = statusCode;
  }
}
