import '../../domain/entities/auth_login_entity.dart';
import 'user_model.dart';

class AuthLoginModel extends AuthLoginEntity {
  AuthLoginModel({String? token, UserModel? user,String? errorMsg}) : super(token: token, user: user,errorMsg: errorMsg);

  factory AuthLoginModel.fromJson(Map<String, dynamic> json) => AuthLoginModel(
    token: json['token'] as String?,
    user: json['user'] == null ? null : UserModel.fromJson(json['user'] as Map<String, dynamic>),
  );

  @override
  Map<String, dynamic> toJson() => {
    'token': token,
    'user': user?.toJson(),
  };
}