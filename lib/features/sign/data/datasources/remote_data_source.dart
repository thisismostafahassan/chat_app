import 'dart:convert';
import 'dart:developer';

import 'package:chat_app/core/errors/exceptions.dart';
import 'package:chat_app/features/sign/data/datasources/base_remote_datasource.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/user_model.dart';

class RemoteDataSource implements BaseRemoteDatasource {
  // Sign Up
  @override
  Future<UserModel> signUpWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      log(userCredential.user.toString());
      return UserModel.fromJson(json.decode(userCredential.user!.toString()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw Exception('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        throw Exception('The account already exists for that email.');
      } else {
        throw ServerException(e.message);
      }
    }
  }

  // Sign In
  @override
  Future<UserModel> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      log(userCredential.user.toString());
      return UserModel.fromJson(json.decode(userCredential.user!.toString()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw Exception('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        throw Exception('Wrong password provided for that user.');
      } else {
        throw ServerException(e.message);
      }
    }
  }
}
