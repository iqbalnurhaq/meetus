import 'package:equatable/equatable.dart';
import 'package:meetus/data/models/user_model.dart';
import 'package:meetus/domain/entities/User.dart';

class UserTable extends Equatable {
  final int id;
  final String name;
  final String email;
  final String role;
  final String? avatar;
  final String? profession;

  UserTable({
    required this.id,
    required this.name,
    required this.email,
    required this.role,
    required this.avatar,
    required this.profession,
  });

  factory UserTable.fromEntity(User user) => UserTable(
        id: user.id,
        name: user.name,
        email: user.email,
        role: user.role,
        avatar: user.avatar,
        profession: user.profession,
      );

  factory UserTable.fromMap(Map<String, dynamic> map) => UserTable(
        id: map['id'],
        name: map['name'],
        email: map['email'],
        role: map['role'],
        avatar: map['avatar'],
        profession: map['profession'],
      );

  factory UserTable.fromModel(UserModel user) => UserTable(
        id: user.id,
        name: user.name,
        email: user.email,
        role: user.role,
        avatar: user.avatar,
        profession: user.profession,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
        'role': role,
        'avatar': avatar,
        'profession': profession,
      };

  User toEntity() => User(
        id: this.id,
        name: this.name,
        email: this.email,
        role: this.role,
        avatar: this.avatar,
        profession: this.profession,
      );

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
