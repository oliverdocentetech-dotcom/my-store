import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:store_demo_class/common/image_assets/image_assets.dart';
import 'package:store_demo_class/common/widgets/buttons/primary_button.dart';
import 'package:store_demo_class/common/widgets/text_fields/primary_text_field.dart';
import 'package:store_demo_class/features/auth/presentation/screens/login_screen.dart';
import 'package:store_demo_class/styles/app_colors.dart';
import 'package:store_demo_class/styles/text_styles.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final confirmPasswordController = TextEditingController();

    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              spacing: 16,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  ImageAssets.store,
                  height: 80,
                  width: 80,
                ),
                Text('Mi Tienda - Registro',
                  style: AppTextStyles.textTitleStyle,
                ),
                SizedBox(height: 24,),
                PrimaryTextField(
                  hintText: 'Ingresa tu correo electrónico',
                  labelText: 'Correo',
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                ),
                PrimaryTextField(
                  hintText: 'Ingresa tu contraseña',
                  labelText: 'Contraeña',
                  keyboardType: TextInputType.text,
                  isPassword: true,
                  controller: passwordController,
                ),
                PrimaryTextField(
                  hintText: 'Confirma tu contraseña',
                  labelText: 'Confirmar Contraeña',
                  keyboardType: TextInputType.text,
                  isPassword: true,
                  controller: confirmPasswordController,
                ),
                SizedBox(height: 24,),
                PrimaryButton(
                    onTap: () {

                    },
                    text: 'REGISTRAR'),
                Spacer(),
                Text('¿Ya tienes una cuenta?',
                  style: AppTextStyles.textDescriptionStyle,),
                GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Text('INGRESAR',style: AppTextStyles.textButtonStyle,))
              ],
            ),
          ),
        )
    );
  }
}
