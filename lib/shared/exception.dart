import 'package:sqflite/sqflite.dart';

class ServerException implements Exception {}

class DatabaseException implements Exception {
  final String message;

  DatabaseException(this.message);
}
