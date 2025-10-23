import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:game_box/core/app%D9%80colors.dart';
import 'package:game_box/core/background_custom.dart';
import 'package:game_box/model/product.dart';
import 'package:game_box/widgets/customAppBar.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundCustom(
        child: Column(
          children: [
            Customappbar(pageName: 'Favorites'),
            Expanded(
              child: ListView.builder(
                itemCount: CartManager.favorites.length,
                itemBuilder: (context, index) {
                  final product = CartManager.favorites[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 5,
                    ),
                    child: Container(
                      height: 100,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: AppColors.whiteOpacity05,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: 1, color: Colors.white70),
                      ),
                      child: Center(
                        child: ListTile(
                          leading: Container(
                            decoration: BoxDecoration(),
                            child: ClipRRect(
                              borderRadius: BorderRadiusGeometry.circular(10),
                              child: Image.asset(
                                product.proimage,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          title: Text(
                            product.proname,
                            style: TextStyle(
                              color: AppColors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Row(
                            children: [
                              Image.asset('assets/sar.png', height: 20),
                              Text(
                                product.proprice,
                                style: TextStyle(
                                  color: AppColors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          trailing: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                color: AppColors.whiteOpacity9,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  width: 0.5,
                                  color: AppColors.whiteOpacity03,
                                ),
                              ),
                              child: Blur(
                                blur: 70,
                                colorOpacity: 0.09,
                                overlay: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      CartManager.cart.removeAt(index);
                                    });
                                  },
                                  icon: Icon(Icons.delete_outline, color:AppColors.white),
                                ),
                                child: Padding(padding: EdgeInsets.all(20)),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
