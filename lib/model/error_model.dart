import 'package:freezed_annotation/freezed_annotation.dart';
part 'error_model.freezed.dart';
part 'error_model.g.dart';

@Freezed()
@JsonSerializable()
final class ErrorModel with _$ErrorModel {
  const factory ErrorModel({
    String? error,
  }) = _ErrorModel;

  factory ErrorModel.fromJson(Map<String, Object?> json) => _$ErrorModelFromJson(json);
}
