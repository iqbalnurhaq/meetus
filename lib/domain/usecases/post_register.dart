import 'package:dartz/dartz.dart';
import 'package:meetus/domain/entities/Auth.dart';
import 'package:meetus/domain/entities/User.dart';
import 'package:meetus/domain/repositories/auth_repository.dart';
import 'package:meetus/shared/failure.dart';

class PostRegister {
  final AuthRepository repository;

  PostRegister(this.repository);

  Future<Either<Failure, User>> execute(Map<String, dynamic> body) {
    return repository.postRegister(body);
  }
}
