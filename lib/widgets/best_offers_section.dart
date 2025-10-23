import 'package:flutter/material.dart';
import 'package:game_box/core/app%D9%80colors.dart';
import 'package:game_box/core/app_text_style.dart';
import 'package:game_box/model/product.dart';
import 'package:game_box/model/productList.dart';

class BestOffersSection extends StatelessWidget {
  const BestOffersSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
                      const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Best Offers',
                    style: AppTextStyles.sectionTitle,
                    ),
                    Container(
                      height: 30,
                      width: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: AppColors.white, width: 0.5),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Text(
                          'More',
                          textAlign: TextAlign.center,
                          style: AppTextStyles.bodySmall
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ProductListWidget(products: CartManager.bestOffers
                    ),
                    const SizedBox(width: 20),
                  ],
                ),
              ),
      ],
    );
  }
}