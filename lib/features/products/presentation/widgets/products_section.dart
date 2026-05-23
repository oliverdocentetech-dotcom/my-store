import 'package:flutter/material.dart';
import 'package:store_demo_class/common/widgets/text_fields/primary_text_field.dart';
import 'package:store_demo_class/styles/text_styles.dart';

class ProductsSection extends StatelessWidget {
  const ProductsSection({super.key});

  @override
  Widget build(BuildContext context) {

    final searchProductController = TextEditingController();

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 16,
        children: [
          PrimaryTextField(
              suffixIcon: Icons.search,
              hintText: 'Buscar productos',
              labelText: 'Buscar productos',
              controller: searchProductController),
          Text('Categorías', style: AppTextStyles.textButtonStyle,),
        ],
      ),
    );
  }
}
