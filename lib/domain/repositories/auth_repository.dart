import 'package:dartz/dartz.dart';
import 'package:meetus/domain/entities/Auth.dart';
import 'package:meetus/domain/entities/User.dart';
import 'package:meetus/shared/failure.dart';

abstract class AuthRepository {
  Future<Either<Failure, User>> postLogin(Map<String, dynamic> body);
  Future<Either<Failure, User>> postRegister(Map<String, dynamic> body);
}
