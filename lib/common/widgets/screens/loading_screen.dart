import 'package:flutter/material.dart';
import 'package:store_demo_class/styles/app_colors.dart';
import 'package:store_demo_class/styles/text_styles.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 8,
            children: [
              Spacer(),
              CircularProgressIndicator(
                color: AppColors.primaryColor,
              ),
              SizedBox(
                width: double.infinity,
              ),
              Text('Carngando...', style: AppTextStyles.textDescriptionStyle,),
              Spacer(),
            ],
          )),
    );
  }
}
