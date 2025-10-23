import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_box/core/app%D9%80colors.dart';
import 'package:game_box/core/app_text_style.dart';
import 'package:game_box/core/background_custom.dart';
import 'package:game_box/cubits/login_cubit.dart';
import 'package:game_box/view/login_screen.dart';
import 'package:game_box/services/shared_prefernces_helper.dart';
import 'package:game_box/widgets/home_widget.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundCustom(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: 80,
                right: 80,
                bottom: 0,
                top: 200,
              ),
              child: Image.asset(
                'assets/logo.png',
                width: 300,
                height: 400,
                fit: BoxFit.cover,
              ),
            ),
            Text(
              'Welcome',
              textAlign: TextAlign.center,
              style: AppTextStyles.headlineLarge,
            ),
            SizedBox(height: 5),
            Text(
              'Discover the Latest Games and Accessories..',
              textAlign: TextAlign.center,
              style: AppTextStyles.headlineSmall,
            ),
            const Spacer(),
            GestureDetector(
              onTap: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return SharedPrefsHelper().getString('userEmail') == null
                        ? BlocProvider(
                            create: (_) => LoginCubit(),
                            child: LoginScreen(),
                          )
                        : HomeWidget();
                  },
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Blur(
                  blur: 60,
                  colorOpacity: 0.06,
                  overlay: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: AppColors.whiteOpacity9),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Text(
                        'Get Started',
                        style: AppTextStyles.buttonPrimary,
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 25, horizontal: 60),
                  ),
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
