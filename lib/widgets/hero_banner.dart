import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:game_box/core/app%D9%80colors.dart';
import 'package:game_box/core/app_text_style.dart';
import 'package:game_box/core/responsive.dart';

class HeroBanner extends StatelessWidget {
  const HeroBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return               Padding(
                padding: EdgeInsets.all(context.rs(16)),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Blur(
                        blur: 50,
                        colorOpacity: 0.09,
                        overlay: Container(
                          width: double.infinity,
                          height: context.rs(140),
                          decoration: BoxDecoration(
                            color: AppColors.whiteOpacity02,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              width: 1,
                              color: AppColors.whiteOpacity03,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(context.rs(14)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: context.rs(4)),
                                Text(
                                  'Marvels Spider Man Miles \nMorales 50%',
                                  style: AppTextStyles.bodySmall
                                ),
                                SizedBox(height: context.rs(10)),
                                ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.whiteOpacity09,
                                    minimumSize: Size(context.rs(90), context.rs(34)),
                                    padding: EdgeInsets.symmetric(horizontal: context.rs(12)),
                                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      side: BorderSide(
                                        color: AppColors.whiteOpacity08,
                                        width: 0.5,
                                      ),
                                    ),
                                    elevation: 0,
                                  ),
                                  child: Text(
                                    'See discounts',
                                    style: AppTextStyles.buttonPrimary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        child: SizedBox(
                          width: double.infinity,
                          height: context.rs(140),
                        ),
                      ),
                    ),
                    Positioned(
                      top: context.rs(14),
                      right: -context.rs(8),
                      child: Image.asset(
                        'assets/hero3.png',
                        width: context.rs(170),
                        height: context.rs(113),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              );
  }
}