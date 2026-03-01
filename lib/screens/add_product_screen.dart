import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/product.dart';
import '../providers/product_provider.dart';

class AddProductScreen extends StatelessWidget {
  AddProductScreen({super.key});

  final name = TextEditingController();
  final category = TextEditingController();
  final stock = TextEditingController();
  final price = TextEditingController();
  final imageUrl = TextEditingController();
  final description = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // ================= APP BAR =================
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        title: const Text(
          "Add Food Menu",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      ),

      // ================= BODY =================
      body: Container(
        color: const Color(0xFFF8FAFC),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [

              _buildInput(
                controller: name,
                label: "Menu Name",
                icon: Icons.restaurant_menu,
              ),

              _buildInput(
                controller: category,
                label: "Category",
                icon: Icons.category_outlined,
              ),

              _buildInput(
                controller: description,
                label: "Description",
                icon: Icons.description_outlined,
                maxLines: 3,
              ),

              _buildInput(
                controller: imageUrl,
                label: "Image URL",
                icon: Icons.image_outlined,
              ),

              _buildInput(
                controller: stock,
                label: "Stock",
                icon: Icons.inventory_2_outlined,
                keyboardType: TextInputType.number,
              ),

              _buildInput(
                controller: price,
                label: "Price",
                icon: Icons.attach_money,
                keyboardType: TextInputType.number,
              ),

              const SizedBox(height: 24),

              // ================= BUTTON =================
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1976D2),
                    foregroundColor: Colors.white,
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    Provider.of<ProductProvider>(
                      context,
                      listen: false,
                    ).addProduct(
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
                  child: const Text(
                    "Save Product",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ================= INPUT WIDGET =================
  Widget _buildInput({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
    int maxLines = 1,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        maxLines: maxLines,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon),
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 14,
            vertical: 14,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}