import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:store_demo_class/common/image_assets/image_assets.dart';
import 'package:store_demo_class/common/widgets/buttons/primary_button.dart';
import 'package:store_demo_class/common/widgets/screens/loading_screen.dart';
import 'package:store_demo_class/common/widgets/text_fields/primary_text_field.dart';
import 'package:store_demo_class/features/auth/presentation/screens/register_screen.dart';
import 'package:store_demo_class/features/home/presentation/screens/home_screen.dart';
import 'package:store_demo_class/styles/app_colors.dart';
import 'package:store_demo_class/styles/text_styles.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  bool isLoading = false;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    if(isLoading) {
      return LoadingScreen();
    }

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
              Text('Mi Tienda',
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
              SizedBox(height: 24,),
              PrimaryButton(
                  onTap: () {
                    if(emailController.text.isEmpty){
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('El correo no puede estar vacío')));
                      return;
                    }
                    if(passwordController.text.isEmpty){
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('La contraseña no puede estar vacía')));
                      return;
                    }
                    loginUserWithEmailAndPassword();
                  },
                  text: 'INGRESAR'),
              Spacer(),
              Text('¿No estás registrado?',
                style: AppTextStyles.textDescriptionStyle,),
              GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterScreen()));
                  },
                  child: Text('REGISTRARSE',style: AppTextStyles.textButtonStyle,))
            ],
          ),
        ),
      )
    );
  }

  Future<void> loginUserWithEmailAndPassword() async {
    setState(() {
      isLoading = true;
    });
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text);
      Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
    } on FirebaseAuthException catch(e) {
      SnackBar snackBar = SnackBar(content: Text(e.message ?? 'Error al ingresar'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      setState(() {
        isLoading = false;
      });
    }
  }
}
