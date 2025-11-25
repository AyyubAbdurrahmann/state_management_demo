import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/item.dart';
import '../providers/cart_provider.dart';

class CatalogScreen extends StatelessWidget {
  const CatalogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Item> catalog = [
      Item(name: 'Laptop', price: 10000000),
      Item(name: 'Mouse', price: 200000),
      Item(name: 'Keyboard', price: 500000),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Katalog Barang'),
        actions: [
          Consumer<CartProvider>(
            builder: (context, cart, child) => Stack(
              alignment: Alignment.center,
              children: [
                IconButton(
                  icon: child!,
                  onPressed: () => Navigator.pushNamed(context, '/cart'),
                ),
                Positioned(
                  right: 6,
                  top: 6,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    constraints: const BoxConstraints(
                      minWidth: 18,
                      minHeight: 18,
                    ),
                    child: Text(
                      '${cart.items.length}',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            child: const Icon(Icons.shopping_cart),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: catalog.length,
        itemBuilder: (context, index) {
          final item = catalog[index];
          return ListTile(
            title: Text(item.name),
            subtitle: Text('Rp ${item.price}'),
            trailing: IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                context.read<CartProvider>().addItem(item);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('${item.name} ditambahkan!')),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
