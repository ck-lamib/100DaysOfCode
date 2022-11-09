import 'package:day1/product.dart';
import 'package:day1/shopping_list.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Day1",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("ShoppingList"),
        ),
        body: const ShoppingList(
          products: [
            Product(name: 'bimal'),
            Product(name: 'Abimir'),
          ],
        ),
      ),
    );
  }
}
