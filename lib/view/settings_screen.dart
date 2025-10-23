import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_box/core/app%D9%80colors.dart';
import 'package:game_box/core/background_custom.dart';
import 'package:game_box/cubits/login_cubit.dart';
import 'package:game_box/view/login_screen.dart';
import 'package:game_box/services/shared_prefernces_helper.dart';
import 'package:game_box/widgets/customAppBar.dart';
import 'package:game_box/widgets/settings_widget.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isDarkMode = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundCustom(
        child: Column(
          children: [
            Customappbar(pageName: 'Settings'),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SettingList(
                    title: 'Logout',
                    settingIcons: Icons.logout,
                    color: AppColors.white,
                    onPressed: () async {
                      try {
                        await FirebaseAuth.instance.signOut();
                        await SharedPrefsHelper().clear();
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BlocProvider(
                              create: (context) => LoginCubit(),
                              child: LoginScreen(),
                            ),
                          ),
                          (Route<dynamic> route) => false,
                        );
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Logout failed: ${e.toString()}"),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                    },
                  ),
                  SettingList(
                    title: 'Language',
                    settingIcons: Icons.language,
                    color: AppColors.white,
                    onPressed: () {},
                  ),
                  SettingList(
                    title: isDarkMode ? 'Dark Mode' : 'Ligth Mode',
                    settingIcons: isDarkMode
                        ? Icons.dark_mode
                        : Icons.light_mode_outlined,
                    color: isDarkMode ? Colors.blue : AppColors.white,
                    onPressed: () {
                      setState(() {
                        isDarkMode = !isDarkMode;
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
