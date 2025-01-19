import 'package:equatable/equatable.dart';

abstract class RegisterEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class RegisterStudentEvent extends RegisterEvent {
  final String email;
  final String password;
  final String confirmPassword;

  RegisterStudentEvent({
    required this.email,
    required this.password,
    required this.confirmPassword,
  });

  @override
  List<Object?> get props => [email, password, confirmPassword];
}
