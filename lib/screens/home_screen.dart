import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/product_provider.dart';
import 'add_product_screen.dart';
import 'checkout_screen.dart';
import 'history_screen.dart';
import 'about_me_screen.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final provider = Provider.of<ProductProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text("Food Shop POS")),

      body: ListView.builder(
        itemCount: provider.products.length,
        itemBuilder: (_, i) {
          final p = provider.products[i];

          return Card(
            child: ListTile(
              title: Text(p.name),
              subtitle: Text(
                "${p.category} | Stock: ${p.stock} | Rp ${p.price.toInt()}",
              ),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () => provider.deleteProduct(i),
              ),
            ),
          );
        },
      ),

      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: "add",
            child: Icon(Icons.add),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => AddProductScreen()),
            ),
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            heroTag: "checkout",
            child: Icon(Icons.shopping_cart),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => CheckoutScreen()),
            ),
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            heroTag: "history",
            child: Icon(Icons.receipt),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => HistoryScreen()),
            ),
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            heroTag: "about",
            child: Icon(Icons.person),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => AboutMeScreen()),
            ),
          ),
        ],
      ),
    );
  }
}