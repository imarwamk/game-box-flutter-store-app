import 'package:flutter/material.dart';
import 'package:game_box/view/bag_screen.dart';
import 'package:game_box/view/favorite_screen.dart';
import 'package:game_box/view/home_screen.dart';
import 'package:game_box/view/settings_screen.dart';
import 'package:game_box/widgets/customBottomNav.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
      int _selectedIndex= 0;

final List<Widget> _pages = [
  HomeScreen(),
  BagScreen(),
  FavoriteScreen(),
  SettingsScreen(),
];

  void _navigaterBottomBar(int index){
    setState((){
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: CustomBottomNav(
        currentIndex: _selectedIndex,
        onTap: _navigaterBottomBar,
      ),
    );
  }
}