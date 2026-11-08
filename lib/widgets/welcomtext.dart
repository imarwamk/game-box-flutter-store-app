import 'package:flutter/material.dart';
import 'package:game_box/core/app_text_style.dart';
import 'package:game_box/core/responsive.dart';

class welcometext extends StatelessWidget {
  const welcometext({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
                padding: EdgeInsets.only(left: context.rs(16), top: context.rs(10)),
                child: Text(
                  ' Hello, Marwa!',
                  style: AppTextStyles.headlineSmall,
                ),
              );
  }
}