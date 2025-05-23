import 'package:chat_app/features/sign/domain/entities/user.dart';
import 'package:chat_app/features/sign/domain/repositories/base_sign_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';

class SignInUseCase {
  final BaseSignRepository baseSignRepository;
  SignInUseCase({required this.baseSignRepository});

  Future<Either<Failure, User>> call({
    required String email,
    required String password,
  }) async {
    return baseSignRepository.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
}
