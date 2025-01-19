import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entity/auth_entity.dart';

abstract interface class IAuthRepository {
  Future<Either<Failure, void>> registerStudent(AuthEntity student);

  Future<Either<Failure, String>> loginStudent(String email, String password);

  // Future<Either<Failure, String>> uploadProfilePicture(File file);

  Future<Either<Failure, AuthEntity>> getCurrentUser();
}
