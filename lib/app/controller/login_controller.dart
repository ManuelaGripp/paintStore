import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:paint_store/app/model/login_request.dart';
import 'package:paint_store/app/repository/login_repository.dart';
import 'package:paint_store/app/utils/utils.dart';

class LoginController {
  late final LoginRepository _repository;
  final state = ValueNotifier<StatusEnum>(StatusEnum.start);
  final messageError = ValueNotifier<String>('Erro ao fazer login');

  LoginController([LoginRepository? repository])
      : _repository = repository ?? LoginRepository();

  void start() {
    state.value = StatusEnum.start;
  }

  Future login(LoginRequest loginRequest) async {
    state.value = StatusEnum.loading;
    print('Login');

    try {
      await _repository.loginUser(loginRequest);
      state.value = StatusEnum.success;
    } on DioException catch (e) {
      state.value = StatusEnum.error;
      messageError.value = e.response?.data['error'] ?? 'Erro ao fazer login';
    }
  }
}
