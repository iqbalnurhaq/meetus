import 'dart:ffi';

import 'package:meetus/data/datasources/db/database_helper.dart';
import 'package:meetus/data/models/user_table.dart';
import 'package:meetus/shared/exception.dart';

abstract class AuthLocalDataSource {
  Future<bool> insertUser(UserTable user);
  Future<UserTable?> getUser();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final DatabaseHelper databaseHelper;

  AuthLocalDataSourceImpl({required this.databaseHelper});

  @override
  Future<UserTable?> getUser() async {
    final result = await databaseHelper.getUser();
    if (result != null) {
      return UserTable.fromMap(result);
    } else {
      return null;
    }
  }

  @override
  Future<bool> insertUser(UserTable user) async {
    try {
      await databaseHelper.insertUser(user);
      return true;
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }
}
