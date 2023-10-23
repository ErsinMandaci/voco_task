import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:voco_task/service/auth/auth_service.dart';
import 'package:voco_task/service/database/token_database.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier() : super(const AuthState(isLogin: false));

  Future<bool> login(String email, String password) async {
    final response = await AuthService.login(email, password);
    try {
      state = state.copyWith(isLogin: false);
      if (response.token != null) {
        await TokenService.saveToken(response.token!);
        state = state.copyWith(token: response.token);
        state = state.copyWith(isLogin: true);
        return true;
      }
      return false;
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> checkToken() async {
    final token = await TokenService.getToken();
    if (token != null) {
      state = state.copyWith(token: token, isLogin: true);
      return true;
    }
    state = state.copyWith(isLogin: false);
    return false;
  }

  Future<void> removeToken() async {
    await TokenService.removeToken();
    state = state.copyWith(isLogin: false);
  }
}

final class AuthState extends Equatable {
  const AuthState({
    this.token,
    this.isLogin,
  });

  final String? token;
  final bool? isLogin;

  AuthState copyWith({
    String? token,
    bool? isLogin,
  }) {
    return AuthState(
      token: token ?? this.token,
      isLogin: isLogin ?? this.isLogin,
    );
  }

  @override
  List<Object?> get props => [token, isLogin];
}
