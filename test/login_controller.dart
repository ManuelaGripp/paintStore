// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:paint_store/app/controller/login_controller.dart';
import 'package:paint_store/app/model/login_request.dart';
import 'package:paint_store/app/model/login_response.dart';
import 'package:paint_store/app/repository/login_repository.dart';
import 'package:paint_store/app/utils/utils.dart';

import 'package:paint_store/main.dart';

class LoginRepositoryMock extends Mock implements LoginRepository {}

void main() {
  final repository = LoginRepositoryMock();
  final controller = LoginController(repository);

  test(
    'o status must change',
    () async {
      LoginRequest loginData =
          LoginRequest(email: 'email@email', password: '123');
      when(repository.loginUser(loginData)).thenAnswer(
          (realInvocation) async => LoginResponse(token: '123456789'));
      controller.login(loginData);
      expect(controller.state, StatusEnum.success);
    },
  );
}
