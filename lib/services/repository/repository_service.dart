import 'dart:io';

import 'package:sample_provider_app/models/auth/auth_response_model.dart';
import 'package:sample_provider_app/models/product/products_response_model.dart';

abstract class RepositoryService {
  Future<AuthResponseModel> loginUser(Map<String, dynamic> data);

  Future<ProductResponseModel> getProducts();
}
