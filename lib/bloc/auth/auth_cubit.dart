// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:teckzy_machine_test/repositories/auth_repository.dart';
part 'auth_state.dart';

class LoginCubit extends Cubit<AuthState> {
  AuthRepository authRepository = AuthRepository();

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  LoginCubit() : super(AuthInitial());

  Future userLogin() async {
    emit(AuthLoading());
    final dataResponse = await authRepository.userSignIn(
        usernameController.text, passwordController.text);
    if (dataResponse) {

      emit(AuthSuccess());
    } else {
      emit(AuthFailure());
    }
  }
}
