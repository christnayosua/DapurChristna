import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/transaction_provider.dart';
import 'package:intl/intl.dart';

class HistoryScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final provider = Provider.of<TransactionProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text("Sales History")),
      body: ListView.builder(
        itemCount: provider.transactions.length,
        itemBuilder: (_, i) {
          final t = provider.transactions[i];

          return ListTile(
            title: Text(t.itemName),
            subtitle: Text(
              "Rp ${t.total.toInt()} - ${DateFormat('dd MMM yyyy').format(t.date)}",
            ),
          );
        },
      ),
    );
  }
}