//with params and without params success type explained in video 
//with params and without params success type explained in video

import 'package:dartz/dartz.dart';

import '../../core/error/failure.dart';

abstract interface class UsecaseWithParams<SuccessType, Params> {
  Future<Either<Failure, SuccessType>> call(Params params);
}

abstract interface class UsecaseWithoutParams<SuccessType> {
  Future<Either<Failure, SuccessType>> call();
}
