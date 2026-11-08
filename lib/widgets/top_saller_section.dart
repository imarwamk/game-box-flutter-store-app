import 'package:flutter/material.dart';
import 'package:game_box/core/app%D9%80colors.dart';
import 'package:game_box/core/app_text_style.dart';
import 'package:game_box/model/product.dart';
import 'package:game_box/model/productList.dart';
import 'package:game_box/core/responsive.dart';

class TopSellerSection extends StatelessWidget {
  const TopSellerSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: context.rs(16)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Top Seller', style: AppTextStyles.sectionTitle),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(width: 0.5, color: AppColors.white),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: context.rs(12), vertical: context.rs(3)),
                  child: Text(
                    'More',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.bodySmall,
                  ),
                ),
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [ProductListWidget(products: CartManager.topSellers)],
          ),
        ),
      ],
    );
  }
}
