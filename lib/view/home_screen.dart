import 'package:flutter/material.dart';
import 'package:game_box/core/background_custom.dart';
import 'package:game_box/widgets/platform_section.dart';
import 'package:game_box/widgets/best_offers_section.dart';
import 'package:game_box/widgets/customAppBar.dart';
import 'package:game_box/widgets/hero_banner.dart';
import 'package:game_box/widgets/top_saller_section.dart';
import 'package:game_box/widgets/welcomtext.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundCustom(child: 
      SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Customappbar(pageName: 'GameBox'),
              welcometext(),
              HeroBanner(),
              PlatformSection(),
              TopSellerSection(),
              BestOffersSection(),
            ],
          ),
        ),
        ),
    );
  }
}
