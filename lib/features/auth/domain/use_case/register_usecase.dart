import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../app/usecase/usecase.dart';
import '../../../../core/error/failure.dart';
import '../entity/auth_entity.dart';
import '../repository/auth_repository.dart';

class RegisterUserParams extends Equatable {
  final String email;
  final String password;
  // final bool isAdmin;

  const RegisterUserParams({
    required this.email,
    required this.password,
    // this.isAdmin = false,
  });

  const RegisterUserParams.initial()
      : email = '',
        password = '';
  // isAdmin = false;

  @override
  List<Object?> get props => [email, password];
}

class RegisterUseCase implements UsecaseWithParams<void, RegisterUserParams> {
  final IAuthRepository repository;

  RegisterUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(RegisterUserParams params) {
    final authEntity = AuthEntity(
      id: null,
      email: params.email,
      password: params.password,
      // isAdmin: params.isAdmin,
    );
    return repository.registerStudent(authEntity);
  }
}
