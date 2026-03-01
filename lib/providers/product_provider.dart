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

    Product(
      name: "Ayam Geprek",
      category: "Makanan",
      stock: 12,
      price: 17000,
      imageUrl:
          "https://images.unsplash.com/photo-1604908176997-431c3f2a4f1e",
      description: "Ayam crispy dengan sambal geprek pedas.",
    ),
    Product(
      name: "Sate Ayam",
      category: "Makanan",
      stock: 10,
      price: 20000,
      imageUrl:
          "https://images.unsplash.com/photo-1625944525533-473f1f0d54b3",
      description: "Sate ayam dengan bumbu kacang khas Indonesia.",
    ),
    Product(
      name: "Bakso",
      category: "Makanan",
      stock: 15,
      price: 14000,
      imageUrl:
          "https://images.unsplash.com/photo-1601050690597-df0568f70950",
      description: "Bakso sapi hangat dengan kuah gurih.",
    ),
    Product(
      name: "Soto Ayam",
      category: "Makanan",
      stock: 9,
      price: 16000,
      imageUrl:
          "https://images.unsplash.com/photo-1604909052743-94e838986d24",
      description: "Soto ayam kuning dengan suwiran ayam dan telur.",
    ),
    Product(
      name: "Rendang",
      category: "Makanan",
      stock: 7,
      price: 25000,
      imageUrl:
          "https://images.unsplash.com/photo-1627308595181-5d3d98a90f25",
      description: "Rendang sapi khas Padang dengan rempah kaya rasa.",
    ),
    Product(
      name: "Nasi Uduk",
      category: "Makanan",
      stock: 10,
      price: 13000,
      imageUrl:
          "https://images.unsplash.com/photo-1626082927389-6cd097cdc6ec",
      description: "Nasi gurih santan dengan lauk pelengkap.",
    ),
    Product(
      name: "Gado-Gado",
      category: "Makanan",
      stock: 6,
      price: 14000,
      imageUrl:
          "https://images.unsplash.com/photo-1546069901-ba9599a7e63c",
      description: "Sayuran segar dengan saus kacang khas Indonesia.",
    ),
    Product(
      name: "Nasi Padang",
      category: "Makanan",
      stock: 8,
      price: 22000,
      imageUrl:
          "https://images.unsplash.com/photo-1627308595229-7830a5c91f9f",
      description: "Nasi dengan berbagai pilihan lauk khas Padang.",
    ),
    Product(
      name: "Pempek",
      category: "Makanan",
      stock: 10,
      price: 15000,
      imageUrl:
          "https://images.unsplash.com/photo-1617196034796-73dfa7b1fd56",
      description: "Pempek ikan dengan kuah cuko asam manis pedas.",
    ),
    Product(
      name: "Martabak Telur",
      category: "Makanan",
      stock: 5,
      price: 18000,
      imageUrl:
          "https://images.unsplash.com/photo-1601050690117-8b63c6f64f16",
      description: "Martabak telur gurih dengan isian daging dan daun bawang.",
    ),
    Product(
      name: "Es Jeruk",
      category: "Minuman",
      stock: 18,
      price: 7000,
      imageUrl:
          "https://images.unsplash.com/photo-1613478223719-2ab802602423",
      description: "Es jeruk segar dari perasan jeruk asli.",
    ),
    Product(
      name: "Kopi Hitam",
      category: "Minuman",
      stock: 15,
      price: 8000,
      imageUrl:
          "https://images.unsplash.com/photo-1509042239860-f550ce710b93",
      description: "Kopi hitam hangat dengan aroma khas.",
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