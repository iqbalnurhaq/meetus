import 'package:equatable/equatable.dart';
import 'package:meetus/data/models/user_model.dart';
import 'package:meetus/domain/entities/Auth.dart';
import 'package:meetus/domain/entities/User.dart';

class AuthResponseModel extends Equatable {
  final String status;
  final AuthDataModel data;

  AuthResponseModel({
    required this.status,
    required this.data,
  });

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) =>
      AuthResponseModel(
        status: json["status"],
        data: AuthDataModel.fromJson(json["data"]),
      );

  AuthResponse toEntity() {
    return AuthResponse(
      status: this.status,
      data: this.data.toEntity(),
    );
  }

  @override
  List<Object?> get props => [
        status,
        data,
      ];
}

class AuthDataModel extends Equatable {
  final UserModel user;
  final String token;
  final String refreshToken;

  AuthDataModel({
    required this.user,
    required this.token,
    required this.refreshToken,
  });

  factory AuthDataModel.fromJson(Map<String, dynamic> json) => AuthDataModel(
        user: UserModel.fromJson(json["user"]),
        token: json["token"],
        refreshToken: json["refresh_token"],
      );

  Auth toEntity() {
    return Auth(
        user: this.user.toEntity(),
        token: this.token,
        refreshToken: this.refreshToken);
  }

  @override
  List<Object?> get props => [
        user,
        token,
        refreshToken,
      ];
}
