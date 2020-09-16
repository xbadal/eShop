import 'package:sample_provider_app/helper/toast_message.dart';
import 'package:sample_provider_app/models/product/product_model.dart';
import 'package:sample_provider_app/models/product/products_response_model.dart';
import 'package:sample_provider_app/services/repository/repository_service.dart';
import 'package:sample_provider_app/viewmodels/base/base_view_model.dart';

import '../../../locator.dart';

class HomeViewModel extends BaseViewModel {
  final _repository = locator<RepositoryService>();

  final List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];

  List<ProductModel> _products = [];
  List<ProductModel> _cartProducts = [];

  List<ProductModel> get products => _products;

  List<ProductModel> get cartProducts => _cartProducts;

  init() async {
    await getProducts();
  }

  Future<void> getProducts() async {
    setBusy(true);
    ProductResponseModel response = await _repository.getProducts();
    if (response != null) {
      if (response.success) {
        _products = response.data;
      } else {
        _products = [];
      }
    }
    notifyListeners();
    setBusy(false);
  }

  Future<void> addToCart(ProductModel product) async {
    if (_cartProducts.length < 4) {
      bool alreadyInCart = false;
      for (int i = 0; i < _cartProducts.length; i++) {
        if (_cartProducts[i].id == product.id) {
          _cartProducts[i].cartQuantity++;
          alreadyInCart = true;
          break;
        }
      }
      if (!alreadyInCart) {
        product.cartQuantity = 1;
        _cartProducts.add(product);
      }
    } else
      showToast('Can not add more than 4 items');

    notifyListeners();
  }

  Future<void> removeCart(ProductModel product) async {
    if (_cartProducts.length > 0) {
      for (int i = 0; i < _cartProducts.length; i++) {
        if (_cartProducts[i].id == product.id) {
          if (cartProducts[i].cartQuantity == 1) {
            product.cartQuantity = 0;
            _cartProducts.removeAt(i);
          } else {
            product.cartQuantity--;
            _cartProducts[i] = product;
          }
          break;
        }
      }
    } else
      showToast('Item not in the cart');

    notifyListeners();
  }

  goToCart() {}
}
