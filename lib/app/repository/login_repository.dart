import 'package:dio/dio.dart';
import 'package:paint_store/app/model/login_request.dart';
import 'package:paint_store/app/model/login_response.dart';
import 'package:paint_store/app/utils/endpoints.dart';

class LoginRepository {
  late Dio _dio;

  LoginRepository([Dio? dio]) : _dio = dio ?? Dio();

  Future<void> loginUser(LoginRequest loginRequest) async {
    Response response =
        await _dio.post(Endpoints.login, data: loginRequest.toJson());
  }
}
