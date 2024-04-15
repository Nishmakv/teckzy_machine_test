import 'package:flutter/material.dart';
import 'package:teckzy_machine_test/presentation/widgets/commons/commons.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
              const AppTextField(
                label: 'Email/Mobile',
                hintText: 'Enter your mail/mobile',
              ),
              const SizedBox(height: 10),
              const AppTextField(
                label: 'Password',
                isPassword: true,
                hintText: 'Enter your password',
              ),
              const SizedBox(height: 10),
              const SizedBox(height: 25),
              Center(
                child: AppButton(
                  onPressed: () {},
                  text: 'Login',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
