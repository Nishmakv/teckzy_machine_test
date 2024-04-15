import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teckzy_machine_test/bloc/auth/auth_cubit.dart';
import 'package:teckzy_machine_test/bloc/product/product_cubit.dart';
import 'package:teckzy_machine_test/presentation/screens/auth/login_screen.dart';
import 'package:teckzy_machine_test/presentation/screens/home_screen.dart';
import 'package:teckzy_machine_test/services/storage_service.dart';
import 'package:teckzy_machine_test/utils/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  StorageService storageService = StorageService();
  final token = await storageService.getToken("token");
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => LoginCubit(),
      ),
      BlocProvider(
        create: (context) => ProductCubit(),
      ),
    ],
    child: MyApp(
      token: token,
    ),
  ));
}

class MyApp extends StatelessWidget {
  final String? token;
  const MyApp({super.key, required this.token});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: appTheme,
      debugShowCheckedModeBanner: false,
      home: token == null || token!.isEmpty
          ? const LoginScreen()
          : const HomeScreen(),
    );
  }
}
