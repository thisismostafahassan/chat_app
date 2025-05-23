import 'package:chat_app/core/errors/failure.dart';
import 'package:chat_app/features/sign/domain/entities/user.dart';
import 'package:chat_app/features/sign/domain/repositories/base_sign_repository.dart';
import 'package:dartz/dartz.dart';

class SignUpUseCase {
  final BaseSignRepository baseSignRepository;

  SignUpUseCase({required this.baseSignRepository});

  Future<Either<Failure, User>> call({
    required String email,
    required String password,
  }) async {
    return await baseSignRepository.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
}
