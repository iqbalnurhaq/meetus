import 'package:flutter/material.dart';
import 'package:meetus/domain/entities/User.dart';
import 'package:meetus/domain/usecases/post_login.dart';
import 'package:meetus/domain/usecases/post_register.dart';
import 'package:meetus/shared/state_enum.dart';

class AuthNotifier extends ChangeNotifier {
  final PostLogin postLogin;
  final PostRegister postRegister;

  AuthNotifier({required this.postLogin, required this.postRegister});

  // Login Field
  late User _loginUser;
  User get user => _loginUser;

  RequestState _loginState = RequestState.Empty;
  RequestState get loginState => _loginState;

  String _loginMessage = '';
  String get loginMessage => _loginMessage;

  //Register Field
  late User _registerUser;
  User get registerUser => _registerUser;

  RequestState _registerState = RequestState.Empty;
  RequestState get registerState => _registerState;

  String _registerMessage = '';
  String get registerMessage => _registerMessage;

  Future<void> authLogin(Map<String, dynamic> body) async {
    _loginState = RequestState.Loading;
    notifyListeners();
    final result = await postLogin.execute(body);

    await result.fold((failure) {
      _loginState = RequestState.Error;
      _loginMessage = failure.message;
      notifyListeners();
    }, (userData) {
      _loginState = RequestState.Loaded;
      _loginUser = userData;
      notifyListeners();
    });
  }

  Future<void> authRegister(Map<String, dynamic> body) async {
    _registerState = RequestState.Loading;
    notifyListeners();
    final result = await postRegister.execute(body);

    await result.fold((failure) {
      _registerState = RequestState.Error;
      _registerMessage = failure.message;
      notifyListeners();
    }, (userData) {
      _registerState = RequestState.Loaded;
      _registerUser = userData;
      notifyListeners();
    });
  }
}
