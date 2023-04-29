import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int id;
  final String name;
  final String email;
  final String role;
  final String? avatar;
  final String? profession;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.role,
    required this.avatar,
    required this.profession,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        email,
        role,
        avatar,
        profession,
      ];
}
