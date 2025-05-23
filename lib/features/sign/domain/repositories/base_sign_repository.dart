import 'package:chat_app/core/errors/failure.dart';
import 'package:chat_app/features/sign/domain/entities/user.dart';
import 'package:dartz/dartz.dart';

abstract class BaseSignRepository {
  // Sign Up
  Future<Either<Failure, User>> signUpWithEmailAndPassword({
    required String email,
    required String password,
  });
  // Sign In
  Future<Either<Failure, User>> signInWithEmailAndPassword({
    required String email,
    required String password,
  });
}
