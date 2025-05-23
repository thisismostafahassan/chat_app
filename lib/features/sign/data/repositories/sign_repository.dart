import 'package:chat_app/core/errors/exceptions.dart';
import 'package:chat_app/core/errors/failure.dart';
import 'package:chat_app/features/sign/data/models/user_model.dart';
import 'package:chat_app/features/sign/domain/entities/user.dart';
import 'package:chat_app/features/sign/domain/repositories/base_sign_repository.dart';
import 'package:dartz/dartz.dart';

import '../datasources/base_remote_datasource.dart' show BaseRemoteDatasource;

class SignRepository extends BaseSignRepository {
  final BaseRemoteDatasource baseRemoteDatasource;
  SignRepository({required this.baseRemoteDatasource});
  @override
  Future<Either<Failure, UserModel>> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    final user = await baseRemoteDatasource.signUpWithEmailAndPassword(
      email: email,
      password: password,
    );
    try {
      return Right(user);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.message));
    }
  }

  @override
  Future<Either<Failure, User>> signUpWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    final user = await baseRemoteDatasource.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    try {
      return Right(user);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.message));
    }
  }
}
