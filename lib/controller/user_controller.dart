import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:voco_task/model/user_data_model.dart';
import 'package:voco_task/service/auth/user_service.dart';

class UserNotifier extends StateNotifier<UserState> {
  UserNotifier() : super(const UserState());

  Future<List<Data>> getUsers({required int page}) async {
    final response = await UserService().getUsers(page: page);
    if (response.data != null) {
      state = state.copyWith(data: response.data, page: response.page, totalPages: response.total_pages);
      return response.data ?? [];
    } else {
      throw Exception('Failed to get users');
    }
  }

  Future<void> nextPage() async {
    if (state.page != null && state.totalPages != null && state.page! < state.totalPages!) {
      final newPage = state.page! + 1;
      state = state.copyWith(page: newPage);
      await getUsers(page: newPage);
    }
  }

  Future<void> previousPage() async {
    if (state.page != null && state.page! > 1) {
      final newPage = state.page! - 1;
      state = state.copyWith(page: newPage);
      await getUsers(page: newPage);
    }
  }
}

final class UserState extends Equatable {
  const UserState({this.data, this.page, this.totalPages});

  final List<Data>? data;
  final int? page;
  final int? totalPages;

  UserState copyWith({
    List<Data>? data,
    int? page,
    int? totalPages,
  }) {
    return UserState(
      data: data ?? this.data,
      page: page ?? this.page,
      totalPages: totalPages ?? this.totalPages,
    );
  }

  @override
  List<Object?> get props => [data, page, totalPages];
}
