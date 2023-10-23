import 'package:freezed_annotation/freezed_annotation.dart';
part 'login.freezed.dart';
part 'login.g.dart';

@freezed
final class Login with _$Login {
  const factory Login({
    String? token,
  }) = _Login;

  factory Login.fromJson(Map<String, Object?> json) => _$LoginFromJson(json);
}
