import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/product.dart';
import '../providers/product_provider.dart';

class AddProductScreen extends StatelessWidget {

  final name = TextEditingController();
  final category = TextEditingController();
  final stock = TextEditingController();
  final price = TextEditingController();
  final imageUrl = TextEditingController();
  final description = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Food Menu"),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF1976D2),
                Color(0xFF42A5F5),
                Colors.white,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.white,
              Color(0xFFE3F2FD),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: name,
                  decoration: InputDecoration(labelText: "Menu Name"),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: category,
                  decoration: InputDecoration(labelText: "Category"),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: description,
                  decoration: InputDecoration(labelText: "Description"),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: imageUrl,
                  decoration: InputDecoration(labelText: "Image URL"),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: stock,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: "Stock"),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: price,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: "Price"),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF1976D2),
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  ),
                  onPressed: () {
                    Provider.of<ProductProvider>(context, listen: false)
                        .addProduct(
                      Product(
                        name: name.text,
                        category: category.text,
                        stock: int.parse(stock.text),
                        price: double.parse(price.text),
                        imageUrl: imageUrl.text,
                        description: description.text,
                      ),
                    );
                    Navigator.pop(context);
                  },
                  child: Text("Save"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}