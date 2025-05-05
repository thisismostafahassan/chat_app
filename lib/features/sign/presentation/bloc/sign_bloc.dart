import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sign_event.dart';
part 'sign_state.dart';

class SignBloc extends Bloc<SignEvent, SignState> {
  //Login
  final loginFormKey = GlobalKey<FormState>();
  final FocusNode? loginEmailFocusNode = FocusNode();
  final FocusNode? loginPassFocusNode = FocusNode();
  TextEditingController loginEmailController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();
  //SignUp
  final signUpFormKey = GlobalKey<FormState>();
  final FocusNode? signUpEmailFocusNode = FocusNode();
  final FocusNode? signUpPassFocusNode = FocusNode();
  TextEditingController signUpEmailController = TextEditingController();
  TextEditingController signUpPasswordController = TextEditingController();
  //
  SignBloc() : super(SignInitial()) {
    on<SignEvent>((event, emit) {});
  }
}
