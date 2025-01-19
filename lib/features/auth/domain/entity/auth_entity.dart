import 'package:equatable/equatable.dart';

class AuthEntity extends Equatable {
  final String? id;
  final String email;
  final String password;
  // final bool isAdmin;

  const AuthEntity({
    this.id,
    required this.email,
    required this.password,
    // this.isAdmin = false,
  });

  @override
  List<Object?> get props => [id, email, password];
}
