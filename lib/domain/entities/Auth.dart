import 'package:equatable/equatable.dart';
import 'package:meetus/domain/entities/User.dart';

class AuthResponse extends Equatable {
  final String status;
  final Auth data;

  AuthResponse({required this.status, required this.data});

  @override
  List<Object?> get props => [
        status,
        data,
      ];
}

class Auth extends Equatable {
  final User user;
  final String token;
  final String refreshToken;

  Auth({
    required this.user,
    required this.token,
    required this.refreshToken,
  });

  @override
  List<Object?> get props => [
        user,
        token,
        refreshToken,
      ];
}
