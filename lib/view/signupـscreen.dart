import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_box/core/app_text_style.dart';
import 'package:game_box/core/background_custom.dart';
import 'package:game_box/cubits/login_cubit.dart';
import 'package:game_box/cubits/signup_cubite.dart';
import 'package:game_box/view/login_screen.dart';
import 'package:game_box/states/signupstate.dart';
import 'package:game_box/widgets/form_widget.dart';
import 'package:game_box/widgets/home_widget.dart';

class SignupScreen extends StatefulWidget {
  SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: BackgroundCustom(
        child: BlocConsumer<SignupCubit, SignupState>(
          listener: (context, state) {
            if (state is SignupLoading) {
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (_) =>
                    const Center(child: CircularProgressIndicator()),
              );
            } else {
              Navigator.of(context, rootNavigator: true).pop();
              if (state is SignupSuccess) {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (_) => HomeWidget()),
                  (Route<dynamic> route) => false,
                );
              } else if (state is SignupFailure) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: Colors.transparent,
                    content: Text(
                      state.errorMessage,
                      style: AppTextStyles.errorText,
                    ),
                  ),
                );
              }
            }
          },
          builder: (context, state) {
            return FormWidget(
              title: "Register",
              subtitle: "Create your account",
              buttonText: "Signup",
              emailController: emailController,
              passwordController: passwordController,
              onSubmit: () {
                context.read<SignupCubit>().signup(
                  emailController.text,
                  passwordController.text,
                );
              },
              bottomText: 'Already have an account?',
              bottomButtonText: 'Login',
              onBottomButtonPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BlocProvider(
                      create: (context) => LoginCubit(),
                      child: LoginScreen(),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
