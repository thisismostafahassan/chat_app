import 'package:chat_app/features/sign/data/models/user_model.dart';

abstract class BaseRemoteDatasource {
  // Sign Up
  Future<UserModel> signUpWithEmailAndPassword({
    required String email,
    required String password,
  });
  // Sign In
  Future<UserModel> signInWithEmailAndPassword({
    required String email,
    required String password,
  });
}
