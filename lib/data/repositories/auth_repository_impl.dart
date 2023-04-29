import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:meetus/data/datasources/auth_local_data_source.dart';
import 'package:meetus/data/datasources/auth_remote_data_source.dart';
import 'package:meetus/data/models/user_table.dart';
import 'package:meetus/domain/entities/Auth.dart';
import 'package:meetus/domain/entities/User.dart';
import 'package:meetus/domain/repositories/auth_repository.dart';
import 'package:meetus/shared/exception.dart';
import 'package:meetus/shared/failure.dart';
import 'package:meetus/shared/shared_preference.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;
  final AuthLocalDataSource authLocalDataSource;

  SharedPref sharedPref = SharedPref();

  AuthRepositoryImpl({
    required this.authRemoteDataSource,
    required this.authLocalDataSource,
  });

  @override
  Future<Either<Failure, User>> postLogin(Map<String, dynamic> body) async {
    try {
      final result = await authRemoteDataSource.login(body);
      if (result.status == "success") {
        return Right(result.data.user.toEntity());
      } else {
        return Left(ConnectionFailure(''));
      }
    } on ServerFailure catch (e) {
      return Left(ServerFailure(e.message.toString()));
    } on ServerException {
      return Left(ServerFailure(''));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, User>> postRegister(Map<String, dynamic> body) async {
    try {
      final result = await authRemoteDataSource.register(body);

      if (result.status == "success") {
        await authLocalDataSource
            .insertUser(UserTable.fromModel(result.data.user));

        final localUser = await authLocalDataSource.getUser();

        await sharedPref.saveString("token", result.data.token);

        return Right(localUser!.toEntity());
      } else {
        return Left(ConnectionFailure(''));
      }
    } on ServerFailure catch (e) {
      return Left(ServerFailure(e.message.toString()));
    } on ServerException {
      return Left(ServerFailure(''));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to the network'));
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    }
  }
}
