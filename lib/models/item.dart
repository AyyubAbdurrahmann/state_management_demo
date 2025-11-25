import 'package:flutter/material.dart';

class Item {
  final String name;
  final int price;
  final IconData icon;

  Item({
    required this.name,
    required this.price,
    this.icon = Icons.shopping_bag,
  });
}
