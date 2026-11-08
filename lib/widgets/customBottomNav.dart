import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:game_box/core/app%D9%80colors.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:game_box/core/responsive.dart';

class CustomBottomNav extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNav({required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.paddingOf(context).bottom;

    return Blur(
      blur: 50,
      colorOpacity: 0.09,
      overlay: Container(
        width: double.infinity,
        height: double.infinity,
        color: const Color.fromARGB(255, 110, 128, 195),
        padding: EdgeInsets.only(
          left: context.rs(12),
          right: context.rs(12),
          bottom: bottomInset,
        ),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 560),
            child: GNav(
              color: AppColors.white,
              activeColor: AppColors.white,
              tabBackgroundColor: AppColors.whiteOpacity09,
              tabBorder: Border.all(color: AppColors.whiteOpacity03, width: 1),
              gap: context.rs(6),
              iconSize: context.rs(20),
              onTabChange: onTap,
              padding: EdgeInsets.symmetric(
                horizontal: context.rs(12),
                vertical: context.rs(10),
              ),
              tabs: const [
                GButton(icon: Icons.home, text: 'Home'),
                GButton(icon: Icons.shopping_bag, text: 'Bag'),
                GButton(icon: Icons.favorite, text: 'Fav'),
                GButton(icon: Icons.settings, text: 'Settings'),
              ],
            ),
          ),
        ),
      ),
      child: SizedBox(height: context.rs(66) + bottomInset),
    );
  }
}
