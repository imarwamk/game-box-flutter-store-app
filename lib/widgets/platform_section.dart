import 'package:flutter/material.dart';
import 'package:game_box/core/app%D9%80colors.dart';
import 'package:game_box/core/app_text_style.dart';
import 'package:game_box/widgets/cirelavatar.dart';
import 'package:game_box/core/responsive.dart';

class PlatformSection extends StatelessWidget {
  const PlatformSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: context.rs(16), vertical: 5),
          child: Text('Platform', style: AppTextStyles.sectionTitle),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(width: 10),
            MyCirelAvatar(
              image: Image.asset('assets/ps.png', color: AppColors.white),
            ),
            SizedBox(width: context.rs(16)),
            MyCirelAvatar(
              image: Image.asset('assets/nine.png', color: AppColors.white),
            ),
            SizedBox(width: context.rs(16)),
            MyCirelAvatar(
              image: Image.asset('assets/xbox.png', color: AppColors.white),
            ),
            const SizedBox(width: 10),
          ],
        ),
        SizedBox(height: context.rs(14)),
      ],
    );
  }
}
