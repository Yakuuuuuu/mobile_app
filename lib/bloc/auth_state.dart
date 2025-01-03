import 'package:equatable/equatable.dart';
import 'package:mobile_app/data/model/user_model.dart';

abstract class AuthState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AuthInitialState extends AuthState {}

class AuthLoadingState extends AuthState {}

class AuthSuccessState extends AuthState {
  final UserModel user;

  AuthSuccessState(this.user);

  @override
  List<Object?> get props => [user];
}

class AuthErrorState extends AuthState {
  final String error;

  AuthErrorState(this.error);

  @override
  List<Object?> get props => [error];
}
