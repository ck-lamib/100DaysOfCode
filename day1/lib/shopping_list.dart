import 'package:day1/items.dart';
import 'package:day1/product.dart';
import 'package:flutter/material.dart';

class ShoppingList extends StatefulWidget {
  const ShoppingList({super.key, required this.products});
  final List<Product> products;

  @override
  State<ShoppingList> createState() => _ShoppingListState();
}

class _ShoppingListState extends State<ShoppingList> {
  final _list = <Product>{};

  void _handleCartChange(bool inCart, Product product) {
    setState(() {
      if (inCart) {
        _list.remove(product);
      } else {
        _list.add(product);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: widget.products.map((product) {
        return ShoppingListItem(
          inCart: _list.contains(product),
          product: product,
          tapped: _handleCartChange,
        );
      }).toList(),
    );
  }
}
