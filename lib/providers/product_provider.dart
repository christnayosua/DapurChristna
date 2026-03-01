import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductProvider with ChangeNotifier {

  final List<Product> _products = [
    Product(name: "Nasi Goreng", category: "Makanan", stock: 10, price: 18000),
    Product(name: "Mie Ayam", category: "Makanan", stock: 8, price: 15000),
    Product(name: "Es Teh", category: "Minuman", stock: 20, price: 5000),
  ];

  List<Product> get products => _products;

  void addProduct(Product product) {
    _products.add(product);
    notifyListeners();
  }

  void deleteProduct(int index) {
    _products.removeAt(index);
    notifyListeners();
  }

  void reduceStock(int index) {
    if (_products[index].stock > 0) {
      _products[index].stock--;
      notifyListeners();
    }
  }
}