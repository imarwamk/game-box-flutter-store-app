import 'package:flutter/material.dart';
import 'package:game_box/model/product.dart';
import 'package:game_box/widgets/product_card.dart';
import 'package:game_box/core/responsive.dart';

class ProductListWidget extends StatelessWidget {
  final List<Product> products;

  const ProductListWidget({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.symmetric(horizontal: context.rs(10)),
      child: Row(
        children: products.map((product) {
          return Padding(
            padding: EdgeInsets.only(right: context.rs(10)),
            child: ProductCard(product: product),
          );
        }).toList(),
      ),
    );
  }
}
