import 'package:bloc/bloc.dart';
import 'package:e_shop/core/error/utils_map_failure_to_message.dart';
import 'package:e_shop/core/use_cases/use_case.dart';
import 'package:e_shop/features/auth/domain/usecase/logout_use_case.dart';
import 'package:e_shop/features/auth/domain/usecase/login_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase loginUseCase;
  final LogoutUseCase logoutUseCase;
  AuthBloc({
    required this.loginUseCase,
    required this.logoutUseCase,
  }) : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      if (event is LoginEvent) {
        emit(AuthLoadingState());
        final failureOrLogin = await loginUseCase(
          event.loginParams,
        );
        emit(
          failureOrLogin.fold(
            (failure) => AuthErrorState(
                message: UtilsMapFailureToMessage.mapFailureToMessage(failure)),
            (userCredential) => LoginLoadedState(
              userCredential: userCredential,
              loginParams: event.loginParams,
            ),
          ),
        );
      }
      if (event is LogoutEvent) {
        emit(AuthLoadingState());
        final failureOrlogout = await logoutUseCase(NoParams());
        emit(
          failureOrlogout.fold(
            (failure) => AuthErrorState(
                message: UtilsMapFailureToMessage.mapFailureToMessage(failure)),
            (userCredential) => LogoutLoadedState(),
          ),
        );
      }
    });
  }
}
