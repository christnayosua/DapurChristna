import 'package:dapurchristna/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/product_provider.dart';
import 'add_product_screen.dart';
import 'checkout_screen.dart';
import 'history_screen.dart';
import 'about_me_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductProvider>(context);

    return Scaffold(

      // ================= APP BAR =================
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        title: const Text(
          "DapurChristna POS",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            letterSpacing: 0.3,
          ),
        ),
      ),

      // ================= DRAWER =================
      drawer: Drawer(
        child: Column(
          children: [

            DrawerHeader(
              margin: EdgeInsets.zero,
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: Color(0xFF1976D2),
              ),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 28,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.fastfood,
                        color: Color(0xFF1976D2), size: 30),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "DapurChristna",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "Point of Sales",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            _drawerItem(
              icon: Icons.home_outlined,
              title: "Home",
              onTap: () => Navigator.pop(context),
            ),

            _drawerItem(
              icon: Icons.shopping_cart_outlined,
              title: "Checkout",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => CheckoutScreen()),
                );
              },
            ),

            _drawerItem(
              icon: Icons.receipt_long_outlined,
              title: "Sales History",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => HistoryScreen()),
                );
              },
            ),

            _drawerItem(
              icon: Icons.person_outline,
              title: "About Me",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => AboutMeScreen()),
                );
              },
            ),
          ],
        ),
      ),

      // ================= BODY =================
      body: Container(
        color: const Color(0xFFF8FAFC),
        child: provider.products.isEmpty
            ? const Center(
                child: Text(
                  "Belum ada produk 🍽️",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
              )
            : ListView.builder(
                padding: const EdgeInsets.only(top: 8, bottom: 90),
                itemCount: provider.products.length,
                itemBuilder: (_, i) {
                  final p = provider.products[i];

                  return ProductCard(
                    product: p,
                    onDelete: () => provider.deleteProduct(i),
                  );
                },
              ),
      ),

      // ================= FAB =================
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: const Color(0xFF1976D2),
        icon: const Icon(Icons.add),
        label: const Text("Tambah Produk"),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => AddProductScreen()),
          );
        },
      ),
    );
  }

  // ================= DRAWER ITEM WIDGET =================
  Widget _drawerItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.black87),
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.w500),
      ),
      onTap: onTap,
    );
  }
}