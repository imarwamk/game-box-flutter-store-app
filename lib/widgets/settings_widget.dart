
import 'package:flutter/material.dart';
import 'package:game_box/core/app%D9%80colors.dart';
import 'package:game_box/core/app_text_style.dart';

class SettingList extends StatelessWidget {
  final String title;
  final IconData settingIcons;
  final Color color;
  final VoidCallback onPressed;
  const SettingList({
    super.key,
    required this.title,
    required this.settingIcons,
    required this.onPressed,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: double.infinity,
        height: 100,
        decoration: BoxDecoration(
          color: AppColors.whiteOpacity02,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(width: 0.5, color: AppColors.whiteOpacity9),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(title, style: AppTextStyles.headlineSmall),
                  IconButton(
                    icon: Icon(settingIcons, size: 40, color: color),
                    onPressed: onPressed,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
