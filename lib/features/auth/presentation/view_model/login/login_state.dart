part of 'login_bloc.dart';

class LoginState {
  final bool isLoading;
  final bool isSuccess;

  const LoginState({
    required this.isLoading,
    required this.isSuccess,
  });

  factory LoginState.initial() {
    return const LoginState(
      isLoading: false,
      isSuccess: false,
    );
  }

  LoginState copyWith({
    bool? isLoading,
    bool? isSuccess,
  }) {
    return LoginState(
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
    );
  }
}
