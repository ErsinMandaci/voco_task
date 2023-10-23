import 'package:dio/dio.dart';
import 'package:voco_task/model/user_model.dart';
import 'package:voco_task/service/auth/base_service.dart';

final class UserService {
  final Dio dioService = BaseService.dioService;

  Future<UserModel> getUsers({required int page}) async {
    try {
      final response = await dioService.get<dynamic>('users?page=$page');

      if (response.statusCode == 200 && response.data != null) {
        return UserModel.fromJson(response.data as Map<String, dynamic>);
      } else {
        throw Exception('Failed to get users');
      }
    } catch (e) {
      rethrow;
    }
  }


}
