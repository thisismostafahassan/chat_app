part of 'sign_bloc.dart';

abstract class SignEvent extends Equatable {
  const SignEvent();

  @override
  List<Object> get props => [];
}

// SignUp Event
class SignUpEvent extends SignEvent {
  final String email;
  final String password;

  const SignUpEvent({required this.email, required this.password});
}

// SignIn Event
class SignInEvent extends SignEvent {
  final String email;
  final String password;

  const SignInEvent({required this.email, required this.password});
}
