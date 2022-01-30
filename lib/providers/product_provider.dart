import 'package:flutter/cupertino.dart';
import 'package:shamo_front_end/models/product_model.dart';
import 'package:shamo_front_end/services/product_service.dart';

class ProductProvider with ChangeNotifier {
  List<ProductModel> _products = [];

  List<ProductModel> get products => _products;

  set products(List<ProductModel> products) {
    _products = products;
    notifyListeners();
  }

  Future<void> getProducts() async {
    try {
      List<ProductModel> products = await ProductService().getProduct();

      _products = products;
    } catch (e) {
      print(e);
    }
  }
}
