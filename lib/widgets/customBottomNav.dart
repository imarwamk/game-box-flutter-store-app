import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:game_box/core/app%D9%80colors.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class CustomBottomNav extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNav({required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Blur(
      blur: 50,
      colorOpacity: 0.09,
      overlay: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 110, 128, 195),
          ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
          child: GNav(
            color: AppColors.white,
            activeColor: AppColors.white,
            tabBackgroundColor: AppColors.whiteOpacity09,
            tabBorder: Border.all(color: AppColors.whiteOpacity03, width: 1),
            gap: 8,
            onTabChange: onTap,
            padding: const EdgeInsets.all(16),
            tabs: const [
              GButton(icon: Icons.home, text: 'Home'),
              GButton(icon: Icons.shopping_bag, text: 'Bag'),
              GButton(icon: Icons.favorite, text: 'Fav'),
              GButton(icon: Icons.settings, text: 'Settings'),
            ],
          ),
        ),
      ),
      child: Padding(padding: EdgeInsets.all(47)),
    );
  }
}
