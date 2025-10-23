import 'package:flutter/material.dart';
import 'package:game_box/model/product.dart';
import 'package:game_box/widgets/product_card.dart';

class ProductListWidget extends StatelessWidget {
  final List<Product> products;

  const ProductListWidget({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: products.map((product) {
          return Padding(
            padding: const EdgeInsets.only(right: 20),
            child: ProductCard(product: product),
          );
        }).toList(),
      ),
    );
  }
}
