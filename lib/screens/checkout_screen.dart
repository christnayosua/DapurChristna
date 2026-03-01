import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/product_provider.dart';
import '../providers/transaction_provider.dart';
import '../models/transaction.dart';

class CheckoutScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final productProvider = Provider.of<ProductProvider>(context);
    final trxProvider = Provider.of<TransactionProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text("Checkout"),
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
        child: ListView.builder(
          itemCount: productProvider.products.length,
          itemBuilder: (_, i) {

            final p = productProvider.products[i];

            return Card(
              margin: EdgeInsets.all(8),
              child: ListTile(
                title: Text(p.name),
                subtitle: Text("Rp ${p.price.toInt()} | Stock: ${p.stock}"),
                trailing: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF1976D2),
                      foregroundColor: Colors.white,
                    ),
                    child: Text("Order"),
                    onPressed: () {
                      if (p.stock > 0) {

                        productProvider.reduceStock(i);

                        trxProvider.addTransaction(
                          TransactionModel(
                            itemName: p.name,
                            total: p.price,
                            date: DateTime.now(),
                          ),
                        );

                        showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                            title: Text("Order Berhasil 🎉"),
                            content: Text("${p.name} berhasil dipesan."),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text("OK"),
                              ),
                            ],
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Stok ${p.name} habis"),
                          ),
                        );
                      }
                    },
                  )
              ),
            );
          },
        ),
      ),
    );
  }
}