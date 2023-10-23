import 'package:dio/dio.dart';

final class BaseService {
  static const String baseUrl = 'https://reqres.in/api/';
  static final Dio dioService = Dio(
    BaseOptions(
      baseUrl: baseUrl,
    ),
  );
}
