import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:teckzy_machine_test/models/product_model.dart';
import 'package:teckzy_machine_test/repositories/product_repository.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductRepository productRepository = ProductRepository();
  List<ProductList> productData = [];
  ProductCubit() : super(ProductInitial());

  Future productDetails() async {
    emit(ProductLoading());
    final dataResponse = await productRepository.productDetailsById();
    if (dataResponse.isNotEmpty) {
      productData = dataResponse;
      emit(ProductSuccess());
    } else {
      emit(ProductFailure());
    }
  }
}
