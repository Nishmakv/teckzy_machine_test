import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teckzy_machine_test/bloc/product/product_cubit.dart';

class ProductGridWidget extends StatelessWidget {
  final ProductCubit bloc;
  const ProductGridWidget({super.key, required this.bloc});
  @override
  Widget build(BuildContext context) {
    final double w = MediaQuery.of(context).size.width;

    return BlocConsumer<ProductCubit, ProductState>(listener: (context, state) {
      if (state is ProductFailure) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Product fetching failed")));
      }
    }, builder: (context, state) {
      if (state is ProductLoading) {
        return Center(
          child: CircularProgressIndicator(
            color: Theme.of(context).colorScheme.primary,
          ),
        );
      }
      return Expanded(
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 5,
            mainAxisSpacing: 10,
          ),
          itemCount: bloc.productData.length,
          itemBuilder: (context, index) {
            final data = bloc.productData[index];
            return Container(
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 100,
                    width: w / 2,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        data.thumbnail,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    data.title,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Colors.black45,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    '₹${data.price.toString()}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      );
    });
  }
}
