import 'package:dio/dio.dart';
import 'package:voco_task/model/error_model.dart';
import 'package:voco_task/model/login.dart';
import 'package:voco_task/service/auth/base_service.dart';
import 'package:voco_task/service/exception/service_exception.dart';

class AuthService {
  static final Dio _apiServiceInstance = BaseService.dioService;

  static Future<Login> login(String email, String password) async {
    try {
      final response = await _apiServiceInstance.post<dynamic>(
        'login',
        data: {
          'email': email,
          'password': password,
        },
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200 && response.data != null) {
        final loginResponse = Login.fromJson(response.data as Map<String, dynamic>);
        return loginResponse;
      } else {
        throw Exception('Failed to login');
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 400 && e.response?.data is Map<String, dynamic>) {
        final errorResponse = ErrorModel.fromJson(e.response?.data as Map<String, dynamic>);
        ServiceException.fromErrorString(errorResponse.error ?? '');
        throw Exception(errorResponse.error);
      } else {
        rethrow;
      }
    }
  }
}
