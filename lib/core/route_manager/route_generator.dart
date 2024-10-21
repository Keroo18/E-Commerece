import 'package:e_commerce/core/route_manager/routes.dart';
import 'package:e_commerce/feature/outh/presentation/pages/registeration_view.dart';
import 'package:e_commerce/feature/outh/presentation/pages/signin_view.dart';
import 'package:e_commerce/layout/layout_view.dart';
import 'package:e_commerce/splash/splash_view.dart';
import 'package:flutter/material.dart';

class RouteGenerator{
  static Route<dynamic> onGenerateRoute(RouteSettings setting)
  {
    switch(setting.name){
      case Routes.initial:
        return MaterialPageRoute(
            builder: (context) => const SplashView(),
    );
      case Routes.login:
        return MaterialPageRoute(
          builder: (context) => const SigninView(),
        );
      case Routes.register:
        return MaterialPageRoute(
          builder: (context) => const RegistrationView(),
        );
      case Routes.layout:
        return MaterialPageRoute(
          builder: (context) => const LayoutView(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const SplashView(),
        );

    }
  }
}