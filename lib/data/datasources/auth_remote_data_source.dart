import 'dart:convert';
import 'package:meetus/data/models/auth_model.dart';
import 'package:http/http.dart' as http;
import 'package:meetus/shared/exception.dart';
import 'package:meetus/shared/failure.dart';

abstract class AuthRemoteDataSource {
  Future<AuthResponseModel> login(Map<String, dynamic> body);
  Future<AuthResponseModel> register(Map<String, dynamic> body);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  static const BASE_URL = "http://172.20.10.7:3000/api";

  final http.Client client;

  AuthRemoteDataSourceImpl({required this.client});

  @override
  Future<AuthResponseModel> login(Map<String, dynamic> body) async {
    final response =
        await client.post(Uri.parse('$BASE_URL/auth/login'), body: body);
    if (response.statusCode == 200) {
      return AuthResponseModel.fromJson(json.decode(response.body));
    } else {
      throw ServerFailure(json.decode(response.body)["message"]);
    }
  }

  @override
  Future<AuthResponseModel> register(Map<String, dynamic> body) async {
    final response =
        await client.post(Uri.parse('$BASE_URL/auth/register'), body: body);
    if (response.statusCode == 200) {
      return AuthResponseModel.fromJson(json.decode(response.body));
    } else {
      throw ServerFailure(json.decode(response.body)["message"]);
    }
  }
}
