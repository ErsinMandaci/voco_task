import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:voco_task/model/user_data_model.dart';

part 'user_model.freezed.dart';

part 'user_model.g.dart';

@freezed
final class UserModel with _$UserModel {
  const factory UserModel({
    int? page,
    int? per_page,
    int? total,
    int? total_pages,
    List<Data>? data,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, Object?> json) => _$UserModelFromJson(json);
}
