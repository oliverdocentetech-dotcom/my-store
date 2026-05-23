import 'package:flutter/material.dart';
import 'package:store_demo_class/common/image_assets/image_assets.dart';
import 'package:store_demo_class/features/home/presentation/widgets/bottom_navigator_tab.dart';
import 'package:store_demo_class/styles/app_colors.dart';

class BottomNavigatorBar extends StatelessWidget {
  const BottomNavigatorBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.neutralColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Row(
          children: [
            Expanded(
              child: BottomNavigatorTab(
                title: 'Inicio',
                iconPath: ImageAssets.home,
                isSelected: true,
              ),
            ),
            Expanded(
              child: BottomNavigatorTab(
                title: 'Carrito',
                iconPath: ImageAssets.cart,
              ),
            ),
            Expanded(
              child: BottomNavigatorTab(
                title: 'Perfil',
                iconPath: ImageAssets.profile,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
