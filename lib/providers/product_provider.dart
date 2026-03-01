import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductProvider with ChangeNotifier {

  final List<Product> _products = [
    Product(
      name: "Nasi Goreng",
      category: "Makanan",
      stock: 10,
      price: 18000,
      imageUrl:
          "https://img-global.cpcdn.com/recipes/0820c8cf5a5e18aa/1200x630cq80/photo.jpg",
      description: "Nasi goreng khas Indonesia dengan telur dan ayam.",
    ),
    Product(
      name: "Mie Ayam",
      category: "Makanan",
      stock: 8,
      price: 15000,
      imageUrl:
          "https://images.unsplash.com/photo-1627308595229-7830a5c91f9f",
      description: "Mie ayam gurih dengan topping ayam manis.",
    ),
    Product(
      name: "Es Teh",
      category: "Minuman",
      stock: 20,
      price: 5000,
      imageUrl:
          "https://images.unsplash.com/photo-1513558161293-cdaf765ed2fd",
      description: "Es teh manis segar cocok untuk menemani makanan.",
    ),
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