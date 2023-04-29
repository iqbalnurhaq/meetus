import 'package:equatable/equatable.dart';
import 'package:meetus/domain/entities/User.dart';

class UserModel extends Equatable {
  final int id;
  final String name;
  final String email;
  final String role;
  final String? avatar;
  final String? profession;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.role,
    required this.avatar,
    required this.profession,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        role: json["role"],
        avatar: json["avatar"],
        profession: json["profession"],
      );

  factory UserModel.fromMap(Map<String, dynamic> map) => UserModel(
        id: map['id'],
        name: map['name'],
        email: map['email'],
        role: map['role'],
        avatar: map['avatar'],
        profession: map['profession'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
        'avatar': avatar,
        'profession': profession
      };

  User toEntity() {
    return User(
      id: this.id,
      name: this.name,
      email: this.email,
      role: this.role,
      avatar: this.avatar,
      profession: this.profession,
    );
  }

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
