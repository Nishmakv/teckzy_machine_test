import 'package:dio/dio.dart';
import 'package:teckzy_machine_test/models/product_model.dart';
import 'package:teckzy_machine_test/services/storage_service.dart';

class ProductRepository {
  Dio client = Dio();
  StorageService prefs = StorageService();

  Future productDetailsById() async {
    List<ProductList> productData = [];
    String token = await prefs.getToken('token');
    final response = await client.get('https://dummyjson.com/products',
        options: Options(headers: {
          'content-type': 'application/json',
          'Authorization': 'Bearer $token',
        }));
    (response.data['products'] as List).forEach((element) {
      productData.add(ProductList.fromJson(element));
    });
    return productData;
  }
}
