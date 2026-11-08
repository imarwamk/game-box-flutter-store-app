import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:game_box/core/app%D9%80colors.dart';
import 'package:game_box/core/app_text_style.dart';
import 'package:game_box/core/background_custom.dart';
import 'package:game_box/widgets/home_widget.dart';
import 'package:game_box/core/responsive.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundCustom(
        child: SafeArea(
          child: Column(
          children: [
            Expanded(
              flex: 6,
              child: Padding(
                padding: EdgeInsets.all(context.rs(24)),
                child: Image.asset('assets/logo.png', fit: BoxFit.contain),
              ),
            ),
            Text(
              'Welcome',
              textAlign: TextAlign.center,
              style: AppTextStyles.headlineLarge,
            ),
            SizedBox(height: 5),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: context.rs(24)),
              child: Text(
                'Discover the Latest Games and Accessories..',
                textAlign: TextAlign.center,
                style: AppTextStyles.headlineSmall,
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomeWidget(),
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Blur(
                  blur: 60,
                  colorOpacity: 0.06,
                  overlay: Container(
                    width: double.infinity,
                    height: double.infinity,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: AppColors.whiteOpacity9),
                    ),
                    child: Padding(
                      padding: EdgeInsets.zero,
                      child: Text(
                        'Get Started',
                        style: AppTextStyles.buttonPrimary,
                      ),
                    ),
                  ),
                  child: SizedBox(width: context.rs(160), height: context.rs(48)),
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
        ),
      ),
    );
  }
}
