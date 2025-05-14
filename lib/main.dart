import 'dart:async';
import 'dart:developer';

import 'package:chat_app/core/themes/themes.dart';
import 'package:chat_app/features/home/presentation/bloc/home_bloc.dart';
import 'package:chat_app/features/sign/presentation/pages/login_page.dart';
import 'package:chat_app/firebase_options.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:chat_app/core/helper/app_bloc_observer.dart';
import 'package:chat_app/core/routing/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/sign/presentation/bloc/sign_bloc.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  runZonedGuarded(
    () {
      //
      WidgetsFlutterBinding.ensureInitialized();
      //
      Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
      //
      Bloc.observer = AppBlocObserver();
      //
      AppRouter appRouter = AppRouter();
      //
      runApp(
        ScreenUtilInit(
          designSize: const Size(1080, 1920),
          minTextAdapt: true,
          splitScreenMode: true,
          child: MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => HomeBloc()),
              BlocProvider(create: (contex) => SignBloc()),
            ],
            child: MaterialApp(
              onGenerateRoute: appRouter.onGenerateRoute,
              debugShowCheckedModeBanner: false,
              theme: Themes().lightThemeData(),

              home: MyApp(),
            ),
          ),
        ),
      );
    },
    (error, stackTrace) {
      log('Error: $error');
      log('StackTrace: $stackTrace');
    },
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const LoginPage();
  }
}
