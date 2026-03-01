import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/product.dart';
import '../providers/product_provider.dart';

class AddProductScreen extends StatelessWidget {

  final name = TextEditingController();
  final category = TextEditingController();
  final stock = TextEditingController();
  final price = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Food Menu")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(controller: name, decoration: InputDecoration(labelText: "Menu Name")),
            TextField(controller: category, decoration: InputDecoration(labelText: "Category")),
            TextField(controller: stock, decoration: InputDecoration(labelText: "Stock")),
            TextField(controller: price, decoration: InputDecoration(labelText: "Price")),
            ElevatedButton(
              onPressed: () {
                Provider.of<ProductProvider>(context, listen: false)
                    .addProduct(Product(
                  name: name.text,
                  category: category.text,
                  stock: int.parse(stock.text),
                  price: double.parse(price.text),
                ));
                Navigator.pop(context);
              },
              child: Text("Save"),
            )
          ],
        ),
      ),
    );
  }
}