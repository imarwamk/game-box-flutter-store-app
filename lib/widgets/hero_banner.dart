import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:game_box/core/app%D9%80colors.dart';
import 'package:game_box/core/app_text_style.dart';

class HeroBanner extends StatelessWidget {
  const HeroBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return               Padding(
                padding: const EdgeInsets.all(20.0),
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
                          height: 170,
                          decoration: BoxDecoration(
                            color: AppColors.whiteOpacity02,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              width: 1,
                              color: AppColors.whiteOpacity03,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 15),
                                Text(
                                  'Marvels Spider Man Miles \nMorales 50%',
                                  style: AppTextStyles.bodySmall
                                ),
                                const SizedBox(height: 20),
                                ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.whiteOpacity09,
                                    minimumSize: const Size(90, 40),
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
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 200,
                            vertical: 85,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: -0,
                      right: -30,
                      child: Image.asset(
                        'assets/hero3.png',
                        width: 240,
                        height: 160,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              );
  }
}