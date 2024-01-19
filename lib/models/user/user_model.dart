import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    required String email,
    required String name,
    required String phone_number,
    required String profile_picture,
    required int age,
    required String gender,
    required bool email_verified,
    required bool phone_verified,
    required bool is_staff,
    @Default(false) bool isActive,
  }) = _UserModel;
  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

}