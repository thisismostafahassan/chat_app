part of 'sign_bloc.dart';

abstract class SignState extends Equatable {
  const SignState();

  @override
  List<Object> get props => [];
}

class SignInitial extends SignState {}

class SignUpState extends SignState {}

class SignInState extends SignState {}
