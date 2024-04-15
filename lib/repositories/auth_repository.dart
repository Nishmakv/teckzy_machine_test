import 'package:dio/dio.dart';
import 'package:teckzy_machine_test/services/storage_service.dart';


class AuthRepository {
  Dio client = Dio();
  StorageService prefs = StorageService();
  Future userSignIn(String username, String password) async {
    final response = await client.post('https://dummyjson.com/auth/login',
        data: {
          "username": username,
          "password": password,
        },
        options: Options(headers: {
          'content-type': 'application/json',
        }));

    if (response.data['token'] != null) {
      prefs.saveToken('token', response.data['token']);
      return true;
    } else {
      return false;
    }
  }
}
