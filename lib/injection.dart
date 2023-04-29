import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:meetus/data/datasources/auth_local_data_source.dart';
import 'package:meetus/data/datasources/auth_remote_data_source.dart';
import 'package:meetus/data/datasources/db/database_helper.dart';
import 'package:meetus/data/repositories/auth_repository_impl.dart';
import 'package:meetus/domain/repositories/auth_repository.dart';
import 'package:meetus/domain/usecases/post_login.dart';
import 'package:meetus/domain/usecases/post_register.dart';
import 'package:meetus/provider/auth_notifier.dart';

final locator = GetIt.instance;

void init() {
  locator.registerFactory(
    () => AuthNotifier(
      postLogin: locator(),
      postRegister: locator(),
    ),
  );

  // use case
  locator.registerLazySingleton(() => PostLogin(locator()));
  locator.registerLazySingleton(() => PostRegister(locator()));

  // repository
  locator.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      authRemoteDataSource: locator(),
      authLocalDataSource: locator(),
    ),
  );

  // data source
  locator.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(client: locator()));
  locator.registerLazySingleton<AuthLocalDataSource>(
      () => AuthLocalDataSourceImpl(databaseHelper: locator()));

  // helper
  locator.registerLazySingleton<DatabaseHelper>(() => DatabaseHelper());

  // external
  locator.registerLazySingleton(() => http.Client());
}
