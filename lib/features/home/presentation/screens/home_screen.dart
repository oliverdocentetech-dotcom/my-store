import 'package:flutter/material.dart';
import 'package:store_demo_class/common/image_assets/image_assets.dart';
import 'package:store_demo_class/common/widgets/text_fields/primary_text_field.dart';
import 'package:store_demo_class/features/home/presentation/widgets/bottom_navigator_bar.dart';
import 'package:store_demo_class/features/products/presentation/widgets/products_section.dart';
import 'package:store_demo_class/styles/app_colors.dart';
import 'package:store_demo_class/styles/text_styles.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        title: Row(
          spacing: 8,
          children: [
            Image.asset(
              ImageAssets.storeImage,
              height: 32,
              width: 32,
            ),
            Text('Mi Tienda', style: AppTextStyles.textButtonStyle,),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ProductsSection(),
            ),
            BottomNavigatorBar(),
          ],
        ),
      ),
    );
  }
}
