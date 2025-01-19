part of 'login_bloc.dart';

sealed class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object?> get props => [];
}

class LoginStudentEvent extends LoginEvent {
  final BuildContext context;
  final String username;
  final String password;

  const LoginStudentEvent({
    required this.context,
    required this.username,
    required this.password,
  });

  @override
  List<Object?> get props => [username, password];
}

class NavigateRegisterScreenEvent extends LoginEvent {
  final BuildContext context;
  final Widget destination;

  const NavigateRegisterScreenEvent({
    required this.context,
    required this.destination,
  });

  @override
  List<Object?> get props => [destination];
}
