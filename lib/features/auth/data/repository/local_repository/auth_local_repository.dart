import 'package:dartz/dartz.dart';

import '../../../../../core/error/failure.dart';
import '../../../domain/entity/auth_entity.dart';
import '../../../domain/repository/auth_repository.dart';
import '../../data_source/local_data_source/auth_local_data_source.dart';

class AuthLocalRepository implements IAuthRepository {
  final AuthLocalDataSource _authLocalDataSource;

  AuthLocalRepository(this._authLocalDataSource);

  @override
  Future<Either<Failure, AuthEntity>> getCurrentUser() async {
    try {
      final currentUser = await _authLocalDataSource.getCurrentUser();
      return Right(currentUser);
    } catch (e) {
      return Left(LocalDatabaseFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> loginStudent(
    String email,
    String password,
  ) async {
    try {
      final result = await _authLocalDataSource.loginStudent(email, password);
      return Right(result);
    } catch (e) {
      return Left(LocalDatabaseFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> registerStudent(AuthEntity student) async {
    try {
      await _authLocalDataSource.registerStudent(student);
      return const Right(null);
    } catch (e) {
      return Left(LocalDatabaseFailure(message: e.toString()));
    }
  }

  // @override
  // Future<Either<Failure, String>> uploadProfilePicture(File file) async {
  //   // TODO: Implement uploadProfilePicture when required
  //   throw UnimplementedError();
  // }
}
