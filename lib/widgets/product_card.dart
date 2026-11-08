import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:game_box/core/app%D9%80colors.dart';
import 'package:game_box/model/product.dart';
import 'package:like_button/like_button.dart';
import 'package:game_box/core/responsive.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: context.rs(10), left: context.rs(4)),
      child: Container(
        width: context.rs(165),
        height: context.rs(210),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13),
          color: const Color.fromARGB(39, 17, 17, 17),
          border: Border.all(width: 2, color: AppColors.whiteOpacity6),
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            const SizedBox(height: 10),
            Positioned(
              top: 0,
              right: 0,
              left: 0,
              bottom: 0,
              child: ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(10),
                child: Image.asset(
                  product.proimage,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                  child: Container(
                    height: context.rs(76),
                    decoration: BoxDecoration(
                      color: AppColors.blackOpacity08,
                    ),
                  ),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: context.rs(9)),
                  child: Text(
                    product.proname,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: AppColors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(context.rs(8)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset('assets/sar.png', height: context.rs(15)),
                          Text(
                            product.proprice,
                            style: const TextStyle(
                              color: AppColors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          border: Border.all(width: 0.5, color: AppColors.white),
                        ),
                        child: CircleAvatar(
                          radius: context.rs(14),
                          backgroundColor: AppColors.whiteOpacity3,
                          child: LikeButton(
                            size: context.rs(16),
                            onTap: (isLiked) async {
                              if (!isLiked) {
                                CartManager.cart.add(product);
                              } else {
                                CartManager.cart.remove(product);
                              }
                              return !isLiked;
                            },
                            likeBuilder: (isTapped) {
                              return Icon(
                                Icons.shopping_cart,
                                size: context.rs(15),
                                color: isTapped ? Colors.blue : AppColors.white,
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(context.rs(8)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      border: Border.all(width: 0.5, color: AppColors.white),
                    ),
                    child: CircleAvatar(
                      radius: context.rs(14),
                      backgroundColor: AppColors.whiteOpacity3,
                      child: LikeButton(
                        size: context.rs(16),
                        onTap: (isLiked) async {
                          if (!isLiked) {
                            CartManager.favorites.add(product);
                          } else {
                            CartManager.favorites.remove(product);
                          }
                          return !isLiked;
                        },
                        likeBuilder: (isTapped) {
                          return Icon(
                            Icons.favorite,
                            size: context.rs(15),
                            color: isTapped ? Colors.red : AppColors.white,
                          );
                        },
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      border: Border.all(width: 0.5, color: AppColors.white),
                    ),
                    child: CircleAvatar(
                      radius: context.rs(14),
                      backgroundColor: AppColors.whiteOpacity3,
                      child: Icon(
                        Icons.arrow_outward,
                        size: context.rs(15),
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
