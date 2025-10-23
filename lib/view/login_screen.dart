import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_box/core/app_text_style.dart';
import 'package:game_box/core/background_custom.dart';
import 'package:game_box/cubits/login_cubit.dart';
import 'package:game_box/cubits/signup_cubite.dart';
import 'package:game_box/view/signup%D9%80screen.dart';
import 'package:game_box/widgets/form_widget.dart';
import 'package:game_box/widgets/home_widget.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: BackgroundCustom(
        child: BlocConsumer<LoginCubit, BaseState>(
          listener: (context, state) {
            if (state is LodingState) {
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (_) =>
                    const Center(child: CircularProgressIndicator()),
              );
            } else {
              if (state is SuccuessState) {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (_) => HomeWidget()),
                  (Route<dynamic> route) => false,
                );
              } else if (state is FailureState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: Colors.transparent,
                    content: Text(
                      state.failureMessage,
                      style: AppTextStyles.errorText,
                    ),
                  ),
                );
              }
            }
          },
          builder: (context, state) {
            return FormWidget(
              title: 'Login',
              subtitle: 'Welcome back',
              buttonText: 'Login',
              emailController: emailController,
              passwordController: passwordController,
              onSubmit: () {
                context.read<LoginCubit>().login(
                  emailController.text,
                  passwordController.text,
                );
              },
              bottomText: 'Don\'t have an account?',
              bottomButtonText: 'Signup',
              onBottomButtonPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BlocProvider(
                      create: (context) => SignupCubit(),
                      child: SignupScreen(),
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
