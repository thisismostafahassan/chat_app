import 'package:chat_app/core/routing/app_router.dart';
import 'package:chat_app/core/themes/colors/app_colors.dart';
import 'package:chat_app/core/widgets/custom_sized_box.dart';
import 'package:chat_app/core/widgets/custom_text_button.dart';
import 'package:chat_app/core/widgets/custom_text_field.dart';
import 'package:chat_app/features/sign/presentation/bloc/sign_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpPage extends StatelessWidget {
  static const String routeName = '/SignUpPage';
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: AppRouter.homeBloc,
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Form(
            key: context.read<SignBloc>().signUpFormKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomSizedBox(height: 200),
                  Image.asset('assets/images/scholar.png'),
                  Text(
                    'Scholar Chat',
                    style: GoogleFonts.pacifico(
                      fontSize: 70.sp,
                      color: Colors.white,
                    ),
                  ),
                  //
                  CustomSizedBox(height: 200),
                  //
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Sign Up',
                        style: GoogleFonts.aBeeZee(
                          color: Colors.white,
                          fontSize: 50.sp,
                        ),
                      ),
                    ],
                  ),
                  //
                  CustomSizedBox(height: 30),
                  //
                  CustomTextField(
                    focusNode: context.read<SignBloc>().signUpEmailFocusNode,
                    controller: context.read<SignBloc>().signUpEmailController,
                    hintText: 'Email',
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).requestFocus(
                        context.read<SignBloc>().signUpPassFocusNode,
                      );
                    },
                  ),
                  //
                  CustomSizedBox(height: 20),
                  //
                  CustomTextField(
                    focusNode: context.read<SignBloc>().signUpPassFocusNode,
                    controller:
                        context.read<SignBloc>().signUpPasswordController,
                    hintText: 'Password',
                  ),
                  //
                  CustomSizedBox(height: 30),
                  //
                  CustomTextButton(
                    text: 'Sign Up',
                    onPressed: () {
                      if (context
                          .read<SignBloc>()
                          .signUpFormKey
                          .currentState!
                          .validate()) {
                        context.read<SignBloc>().add(
                          SignUpEvent(
                            email:
                                context
                                    .read<SignBloc>()
                                    .signUpEmailController
                                    .text,
                            password:
                                context
                                    .read<SignBloc>()
                                    .signUpPasswordController
                                    .text,
                          ),
                        );
                      }
                    },
                  ),
                  //
                  CustomSizedBox(height: 30),
                  //
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account?",
                        style: TextStyle(color: Colors.cyan),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
