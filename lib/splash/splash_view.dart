import 'dart:async';

import 'package:e_commerce/core/theming/color_palette.dart';
import 'package:flutter/material.dart';

import '../core/route_manager/routes.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    // TODO: implement initState
    Timer(
        const Duration(seconds: 1),
        () {
          Navigator.pushReplacementNamed(
              context,
              Routes.login,
          );
        },
    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var mediaQuery=MediaQuery.of(context);
    return Container(
      width: mediaQuery.size.width,
      height: mediaQuery.size.height,
      color:ColorPalette.primaryColor,
      child: Center(
          child: Image.asset(
              "assets/images/logo.png",
            width: mediaQuery.size.width*.7,
            color: ColorPalette.textAuthColor,
          ),
      ),
    );
  }
}
