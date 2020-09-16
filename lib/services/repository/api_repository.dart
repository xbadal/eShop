import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:sample_provider_app/constants/url_provider.dart';
import 'package:sample_provider_app/helper/dummy_data.dart';
import 'package:sample_provider_app/models/auth/auth_response_model.dart';
import 'package:sample_provider_app/models/auth/user.dart';
import 'package:sample_provider_app/models/product/product_model.dart';
import 'package:sample_provider_app/models/product/products_response_model.dart';
import 'package:sample_provider_app/services/repository/repository_service.dart';

class ApiRepository extends RepositoryService {
  final Dio dio;

  ApiRepository({@required this.dio}) : assert(dio != null);

  @override
  Future<AuthResponseModel> loginUser(Map<String, dynamic> map) async {
    try {
      final data = jsonEncode(map);
      final response = await dio.post(login, data: data);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final user = User.fromJson(response.data);
        if (user != null) {
          AuthResponseModel result = AuthResponseModel(
              success: true,
              statusCode: response.statusCode,
              message: 'Login Success',
              data: user);
          return result;
//          if (result.success) {
//            return result;
//          }
//          return AuthResponseModel.withError(
//            success: result.success,
//            statusCode: result.statusCode,
//            message: result.message,
//          );
        } else {
          return AuthResponseModel.withError(
            success: false,
            statusCode: 401,
            message: 'Login Failed',
          );
        }
      }
      return AuthResponseModel.withError(
        success: false,
        statusCode: 401,
        message: 'Login Failed',
      );
    } catch (e) {
      print(e.toString());
      return AuthResponseModel.withError(
        success: false,
        statusCode: 401,
        message: 'Login Failed',
      );
    }
  }

  @override
  Future<ProductResponseModel> getProducts() async {
    try {
      await Future.delayed(const Duration(milliseconds: 2000));
      List<ProductModel> data = [];
      if (productsData != null) {
        data = new List<ProductModel>();
        productsData.forEach((v) {
          data.add(new ProductModel.fromJson(v));
        });
      }

      ProductResponseModel result = ProductResponseModel(
          success: true, statusCode: 201, message: 'Success', data: data);

      return result;
    } catch (e) {
      print(e.toString());
      return ProductResponseModel.withError(
        success: false,
        statusCode: 401,
        message: 'Fetching Products Failed',
      );
    }
  }
}
