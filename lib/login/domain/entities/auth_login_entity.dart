import '../../data/models/user_model.dart';

class AuthLoginEntity {
  UserModel? user;
  String? token;
  String? errorMsg;

  AuthLoginEntity({
    this.user,
    this.token,
    this.errorMsg
  });

  factory AuthLoginEntity.fromJson(Map<String, dynamic> json) {
    return AuthLoginEntity(
      user: json['user'] == null ? null : UserModel.fromJson(json['user'] as Map<String, dynamic>),
      token: json['token'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user': user?.toJson(),
      'token': token,
    };
  }
}
