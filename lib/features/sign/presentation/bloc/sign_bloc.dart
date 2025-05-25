import 'package:chat_app/features/sign/data/datasources/remote_data_source.dart';
import 'package:chat_app/features/sign/domain/entities/user.dart';
import 'package:chat_app/features/sign/domain/usecases/signup_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repositories/sign_repository.dart';
import '../../domain/usecases/signin_use_case.dart';

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
  // User
  late User myUser;
  //
  SignBloc() : super(SignInitial()) {
    // SignUp Event
    on<SignUpEvent>((event, emit) async {
      final baseRemoteDatasource = RemoteDataSource();
      final baseSignRepository = SignRepository(
        baseRemoteDatasource: baseRemoteDatasource,
      );
      final response = await SignUpUseCase(
        baseSignRepository: baseSignRepository,
      ).call(email: event.email, password: event.password);

      response.fold(
        (l) {
          emit(SignUpState());
        },
        (r) {
          myUser = r;
          emit(SignUpState());
        },
      );
    });
    // SignIn Event
    on<SignInEvent>((event, emit) async {
      final baseRemoteDatasource = RemoteDataSource();
      final baseSignRepository = SignRepository(
        baseRemoteDatasource: baseRemoteDatasource,
      );
      final response = await SignInUseCase(
        baseSignRepository: baseSignRepository,
      ).call(email: event.email, password: event.password);

      response.fold(
        (l) {
          emit(SignUpState());
        },
        (r) {
          myUser = r;
          emit(SignUpState());
        },
      );
    });
  }
}
