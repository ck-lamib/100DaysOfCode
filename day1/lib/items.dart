import 'package:day1/product.dart';
import 'package:flutter/material.dart';

typedef CartCallBack = Function(bool inCart, Product product);

class ShoppingListItem extends StatelessWidget {
  const ShoppingListItem(
      {super.key, required this.inCart, required this.product, required this.tapped});
  final bool inCart;
  final Product product;
  final CartCallBack tapped;
  Color _getColor(BuildContext context) {
    return inCart ? Colors.black54 : Theme.of(context).primaryColor;
  }

  TextStyle? _getTextStyle(BuildContext context) {
    if (!inCart) return null;
    return const TextStyle(
      color: Colors.black54,
      decoration: TextDecoration.lineThrough,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        tapped(inCart, product);
      },
      leading: CircleAvatar(
        backgroundColor: _getColor(context),
        child: Text(product.name[0].toUpperCase()),
      ),
      title: Text(
        product.name,
        style: _getTextStyle(context),
      ),
    );
  }
}
