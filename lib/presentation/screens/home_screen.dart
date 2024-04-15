import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teckzy_machine_test/bloc/product/product_cubit.dart';
import 'package:teckzy_machine_test/presentation/screens/auth/login_screen.dart';
import 'package:teckzy_machine_test/presentation/widgets/product_grid.dart';
import 'package:teckzy_machine_test/services/storage_service.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ProductCubit productCubit = BlocProvider.of<ProductCubit>(context)
      ..productDetails();
    StorageService storage = StorageService();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Products"),
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
              onPressed: () {
                storage.deleteToken();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const LoginScreen();
                    },
                  ),
                );
              },
              icon: const Icon(Icons.logout_outlined))
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 16,
            left: 16,
            right: 16,
          ),
          child: ProductGridWidget(
            bloc: productCubit,
          ),
        ),
      ),
    );
  }
}
