import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/product_provider.dart';
import '../providers/transaction_provider.dart';
import '../models/transaction.dart';

class CheckoutScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final productProvider = Provider.of<ProductProvider>(context);
    final trxProvider = Provider.of<TransactionProvider>(context, listen:false);

    return Scaffold(
      appBar: AppBar(title: Text("Checkout")),
      body: ListView.builder(
        itemCount: productProvider.products.length,
        itemBuilder: (_, i) {

          final p = productProvider.products[i];

          return ListTile(
            title: Text(p.name),
            subtitle: Text("Rp ${p.price.toInt()}"),
            trailing: ElevatedButton(
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
                }
              },
            ),
          );
        },
      ),
    );
  }
}