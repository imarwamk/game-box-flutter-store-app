import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:game_box/core/app%D9%80colors.dart';
import 'package:game_box/core/app_text_style.dart';
import 'package:game_box/core/background_custom.dart';
import 'package:game_box/model/product.dart';
import 'package:game_box/widgets/customAppBar.dart';
import 'package:game_box/core/responsive.dart';

class BagScreen extends StatefulWidget {
  const BagScreen({super.key});

  @override
  State<BagScreen> createState() => _BagScreenState();
}

class _BagScreenState extends State<BagScreen> {
  @override
  Widget build(BuildContext context) {
    double totalPrice = 0;
    for (var item in CartManager.cart) {
      totalPrice += double.tryParse(item.proprice) ?? 0;
    }

    return Scaffold(
      body: BackgroundCustom(
        child: Column(
          children: [
            Customappbar(pageName: 'My Bag'),
            Expanded(
              child: ListView.builder(
                itemCount: CartManager.cart.length,
                itemBuilder: (context, index) {
                  final product = CartManager.cart[index];
                  return Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: context.rs(14),
                      vertical: context.rs(4),
                    ),
                    child: Container(
                      height: context.rs(84),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: AppColors.whiteOpacity05,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: 1, color: Colors.white70),
                      ),
                      child: Center(
                        child: ListTile(
                          contentPadding: EdgeInsets.symmetric(horizontal: context.rs(10)),
                          leading: Container(
                            width: context.rs(56),
                            height: context.rs(56),
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
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: AppColors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Row(
                            children: [
                          Image.asset('assets/sar.png', height: context.rs(15)),
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
                              width: context.rs(42),
                              height: context.rs(42),
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
                                  padding: EdgeInsets.zero,
                                  iconSize: context.rs(20),
                                  onPressed: () {
                                    setState(() {
                                      CartManager.cart.removeAt(index);
                                    });
                                  },
                                  icon: Icon(Icons.delete_outline, color: AppColors.white),
                                ),
                                child: SizedBox.square(dimension: context.rs(42)),
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
            Padding(
              padding: EdgeInsets.all(context.rs(14)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                  Text(
                    'Total:',
                    style: AppTextStyles.sectionTitle,
                  ),
                  SizedBox(width: 5,),
                      Image.asset('assets/sar.png', height: context.rs(18)),
                      Text(
                        '${totalPrice.toStringAsFixed(2)}',
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Blur(
                  blur: 60,
                  colorOpacity: 0.06,
                  overlay: Container(
                    width: double.infinity,
                    height: double.infinity,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: AppColors.whiteOpacity9),
                    ),
                    child: Padding(
                      padding: EdgeInsets.zero,
                      child: Text(
                        'Checkout',
                        style: AppTextStyles.buttonPrimary
                      ),
                    ),
                  ),
                  child: SizedBox(width: context.rs(110), height: context.rs(44)),
                ),
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
