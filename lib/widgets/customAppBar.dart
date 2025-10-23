import 'package:flutter/material.dart';
import 'package:game_box/core/app_text_style.dart';

class Customappbar extends StatelessWidget implements PreferredSizeWidget
{
  final String pageName;

  const Customappbar({super.key,
  required this.pageName
  });

  @override
  Widget build(BuildContext context) {
    return 
    AppBar(
        backgroundColor:Colors.white.withOpacity(0.0),
        elevation: 0,
        title: 
        Text(
          pageName,
          style: AppTextStyles.headlineLarge
        ),
      );
  }
    @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

}