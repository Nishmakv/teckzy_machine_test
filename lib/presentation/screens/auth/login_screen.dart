import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teckzy_machine_test/bloc/auth/auth_cubit.dart';
import 'package:teckzy_machine_test/presentation/screens/home_screen.dart';
import 'package:teckzy_machine_test/presentation/widgets/commons/commons.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LoginCubit authCubit = BlocProvider.of<LoginCubit>(context);
    return BlocListener<LoginCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const HomeScreen();
              },
            ),
          );
        } else if (state is AuthFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Login Failed"),
            ),
          );
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Log in',
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'Unlock Your Experience: Sign In Now',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 30),
                  AppTextField(
                    controller: authCubit.usernameController,
                    label: 'Username',
                    hintText: 'Enter your mail/mobile',
                  ),
                  const SizedBox(height: 10),
                  AppTextField(
                    controller: authCubit.passwordController,
                    label: 'Password',
                    isPassword: true,
                    hintText: 'Enter your password',
                  ),
                  const SizedBox(height: 10),
                  const SizedBox(height: 25),
                  Center(
                    child: AppButton(
                      onPressed: () {
                        authCubit.userLogin();
                      },
                      text: 'Login',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
