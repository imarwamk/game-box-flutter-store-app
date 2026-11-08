
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:game_box/core/app%D9%80colors.dart';
import 'package:game_box/core/app_text_style.dart';
import 'package:game_box/core/responsive.dart';

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

  Widget _socialButton(BuildContext context, String asset) {
    return Container(
      width: context.rs(46),
      height: context.rs(46),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        border: Border.all(color: AppColors.whiteOpacity6),
      ),
      child: Image.asset(asset),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(context.rs(16)),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 420),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 60, sigmaY: 60),
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: context.rs(16),
                  vertical: context.rs(24),
                ),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.05),
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(
                    width: 1,
                    color: AppColors.whiteOpacity03,
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(widget.title, style: AppTextStyles.headlineLarge),
                    SizedBox(height: context.rs(10)),
                    Text(widget.subtitle, style: AppTextStyles.headlineSmall),
                    SizedBox(height: context.rs(24)),
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
                        isDense: true,
                      ),
                    ),
                    SizedBox(height: context.rs(14)),
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
                        border: const OutlineInputBorder(),
                        isDense: true,
                      ),
                    ),
                    SizedBox(height: context.rs(18)),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.whiteOpacity09,
                        foregroundColor: AppColors.white,
                        minimumSize: Size.fromHeight(context.rs(46)),
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
                    SizedBox(height: context.rs(14)),
                    Wrap(
                      alignment: WrapAlignment.center,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Text(widget.bottomText, style: AppTextStyles.caption),
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
                    SizedBox(height: context.rs(10)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _socialButton(context, 'assets/google.png'),
                        SizedBox(width: context.rs(16)),
                        _socialButton(context, 'assets/apple.png'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
