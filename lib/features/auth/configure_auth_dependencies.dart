// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:e_shop/features/auth/data/datasource/auth_remote_data_source.dart';
import 'package:e_shop/features/auth/data/repositories_impl/auth_repository_impl.dart';
import 'package:e_shop/features/auth/domain/repositories/auth_repository.dart';
import 'package:e_shop/features/auth/domain/usecase/login_use_case.dart';
import 'package:e_shop/features/auth/domain/usecase/logout_use_case.dart';
import 'package:e_shop/features/auth/domain/usecase/sign_up_use_case.dart';
import 'package:e_shop/features/auth/presentation/blocs/bloc/auth_bloc.dart';
import 'package:get_it/get_it.dart';

void configureAuthDependencies({required GetIt di}) async {
  //? Bloc
  di.registerFactory(
    () => AuthBloc(
      signUpUseCase: di(),
      loginUseCase: di(),
      logoutUseCase: di(),
    ),
  );
  //? Repository
  di.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      authRemoteDataSource: di(),
    ),
  );

  //? Usecases
  di.registerLazySingleton(
    () => LoginUseCase(
      authRepository: di(),
    ),
  );
  di.registerLazySingleton(
    () => LogoutUseCase(
      authRepository: di(),
    ),
  );
  di.registerLazySingleton(
    () => SignUpUseCase(
      authRepository: di(),
    ),
  );

  //? Data sources
  di.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(
      firebaseAuthInstance: di(),
    ),
  );
}
