import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_data_model.freezed.dart';
part 'user_data_model.g.dart';



@freezed
class Data with _$Data {
  const factory Data({
    int? id,
    String? email,
    String? first_name,
    String? last_name,
    String? avatar,
  }) = _Data;

  factory Data.fromJson(Map<String, Object?> json) => _$DataFromJson(json);
}
