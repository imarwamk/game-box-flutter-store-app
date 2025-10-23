
import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:game_box/core/app%D9%80colors.dart';
import 'package:game_box/core/app_text_style.dart';

class FormWidget extends StatefulWidget {
  final String title;
  final String subtitle;
  final String buttonText;
  final VoidCallback onSubmit;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final String bottomText;
  final String bottomButtonText;
  final VoidCallback onBottomButtonPressed;

  const FormWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.buttonText,
    required this.onSubmit,
    required this.emailController,
    required this.passwordController,
    required this.bottomText,
    required this.bottomButtonText,
    required this.onBottomButtonPressed,
  });

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Blur(
                blur: 60,
                colorOpacity: 0.05,
                overlay: Container(
                  height: 600,
                  width: 500,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                      width: 1,
                      color: AppColors.whiteOpacity03,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(widget.title, style: AppTextStyles.headlineLarge),
                        const SizedBox(height: 18),
                        Text(widget.subtitle, style: AppTextStyles.headlineSmall),
                        const SizedBox(height: 40),
                        TextField(
                          style: const TextStyle(color: AppColors.white),
                          controller: widget.emailController,
                          decoration: const InputDecoration(
                            suffixIcon: Icon(
                              Icons.email_outlined,
                              color: AppColors.white,
                            ),
                            labelText: 'Email',
                            labelStyle: AppTextStyles.hint,
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextField(
                          style: const TextStyle(color: AppColors.white),
                          obscureText: _isObscure,
                          controller: widget.passwordController,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              icon: Icon(
                                _isObscure
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                              color: AppColors.white,
                              onPressed: () {
                                setState(() {
                                  _isObscure = !_isObscure;
                                });
                              },
                            ),
                            labelText: 'Password',
                            labelStyle: AppTextStyles.hint,
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 25),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.whiteOpacity09,
                            foregroundColor: AppColors.white,
                            padding: const EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 142,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                              side: BorderSide(
                                color: AppColors.whiteOpacity9,
                                width: 0.5,
                              ),
                            ),
                            elevation: 0,
                          ),
                          onPressed: widget.onSubmit,
                          child: Text(
                            widget.buttonText,
                            style: AppTextStyles.buttonSecondary,
                          ),
                        ),
                        const SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              widget.bottomText,
                              style: AppTextStyles.caption,
                            ),
                            TextButton(
                              onPressed: widget.onBottomButtonPressed,
                              child: Text(
                                widget.bottomButtonText,
                                style: AppTextStyles.captionBold,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Divider(
                                color: AppColors.white,
                                thickness: 1,
                                endIndent: 10,
                              ),
                            ),
                            Text(' OR ', style: AppTextStyles.caption),
                            Expanded(
                              child: Divider(
                                color: AppColors.white,
                                thickness: 1,
                                endIndent: 10,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                border: Border.all(
                                  color: AppColors.whiteOpacity6
                                ),
                              ),
                              child: Image.asset('assets/google.png'),
                            ),
                            SizedBox(width: 20),
                            Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                border: Border.all(
                                  color: AppColors.whiteOpacity6
                                ),
                              ),
                              child: Image.asset('assets/apple.png'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 500, vertical: 300),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
