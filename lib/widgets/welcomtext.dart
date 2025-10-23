import 'package:flutter/material.dart';
import 'package:game_box/core/app_text_style.dart';

class welcometext extends StatelessWidget {
  const welcometext({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
                padding: const EdgeInsets.only(left: 20, top: 20),
                child: Text(
                  ' Hello, Marwa!',
                  style: AppTextStyles.headlineSmall,
                ),
              );
  }
}