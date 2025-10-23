import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:game_box/core/app%D9%80colors.dart';

class MyCirelAvatar extends StatelessWidget {
  final Image image;

  const MyCirelAvatar({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: Blur(
        blur: 50,
        colorOpacity: 0.09,
        overlay: Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.whiteOpacity02,
            border: Border.all(width: 1, color: AppColors.whiteOpacity3),
          ),
          child: ClipOval(child: image),
        ),
        child: Padding(padding: EdgeInsets.all(40)),
      ),
    );
  }
}
