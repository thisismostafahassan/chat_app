import 'package:chat_app/features/home/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/home/presentation/bloc/home_bloc.dart';
import '../../features/sign/presentation/pages/login_page.dart' show LoginPage;

class AppRouter {
  static final homeBloc = HomeBloc();

  // Routes
  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      // Login Page
      case LoginPage.routeName:
        return MaterialPageRoute(
          builder: (context) {
            return BlocProvider.value(
              value: homeBloc,
              child: const LoginPage(),
            );
          },
        );
      // Home Page
      case HomePage.routeName:
        return MaterialPageRoute(
          builder: (context) {
            return BlocProvider.value(value: homeBloc, child: const HomePage());
          },
        );
      //default route
      default:
        return MaterialPageRoute(
          builder: (context) {
            return BlocProvider.value(value: homeBloc, child: const HomePage());
          },
        );
    }
  }
}
