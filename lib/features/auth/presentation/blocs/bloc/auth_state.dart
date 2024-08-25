part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

class AuthLoadingState extends AuthState {}

class AuthErrorState extends AuthState {
  final String message;
  const AuthErrorState({
    required this.message,
  });
}

class LoginLoadedState extends AuthState {
  final UserCredential userCredential;
  final LoginParams loginParams;
  const LoginLoadedState({
    required this.userCredential,
    required this.loginParams,
  });
}

class SignUpLoadedState extends AuthState {
  final UserCredential userCredential;
  const SignUpLoadedState({
    required this.userCredential,
  });
}

class LogoutLoadedState extends AuthState {}
