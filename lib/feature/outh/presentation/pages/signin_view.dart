import 'package:animate_do/animate_do.dart';
import 'package:e_commerce/core/route_manager/routes.dart';
import 'package:e_commerce/core/theming/color_palette.dart';
import 'package:e_commerce/feature/outh/presentation/manager/cubit.dart';
import 'package:e_commerce/feature/outh/presentation/manager/states.dart';
import 'package:e_commerce/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SigninView extends StatefulWidget {
  const SigninView({super.key});

  @override
  State<SigninView> createState() => _SigninViewState();
}

class _SigninViewState extends State<SigninView> {
  var formKey = GlobalKey<FormState>();
  bool isObscured = true;
  // TextEditingController emailController = TextEditingController();
  // TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var mediaQuery = MediaQuery.of(context);
    return BlocProvider<AuthCubit>(
        create: (context)=>AuthCubit(),
        child: BlocBuilder<AuthCubit,AuthStates>(
          builder: (context,state){
            var cubitControl =AuthCubit.get(context);
            return Scaffold(
              backgroundColor: const Color(0xFF004182),
              resizeToAvoidBottomInset: false,
              body: Column(
                children: [
                  SizedBox(
                    height: mediaQuery.size.height * .1,
                  ),
                  FadeInUp(
                    from: 0,
                    child: Image.asset(
                      "assets/images/logo.png",
                      color: ColorPalette.textAuthColor,
                      width: mediaQuery.size.height * .3,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Form(
                        key: formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            SizedBox(
                              height: mediaQuery.size.height * .05,
                            ),
                            FadeInUp(
                              from: 50,
                              child: Text(
                                "Welcome Back To Route",
                                style: theme.textTheme.titleLarge?.copyWith(
                                  color: ColorPalette.textAuthColor,
                                ),
                              ),
                            ),
                            FadeInUp(
                              from: 100,
                              child: Text(
                                "Please sign in with your mail",
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: ColorPalette.textAuthColor,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: mediaQuery.size.height * .05,
                            ),
                            FadeInUp(
                              from: 150,
                              child: Text(
                                "User Name",
                                style: theme.textTheme.titleSmall?.copyWith(
                                  color: ColorPalette.textAuthColor,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: mediaQuery.size.height * .02,
                            ),
                            FadeInUp(
                              from: 200,
                              child: TextFormField(
                                controller: cubitControl.emailController,
                                style: theme.textTheme.titleSmall,
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return "Plz enter Email address";
                                  }
                                  var regex = RegExp(
                                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                                  if (!regex.hasMatch(value)) {
                                    return "Invalid Email";
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  filled: true,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  hintText: "enter your Name",
                                  hintStyle: theme.textTheme.bodyMedium
                                      ?.copyWith(color: Colors.black38),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  errorStyle: theme.textTheme.bodySmall,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: mediaQuery.size.height * .025,
                            ),
                            FadeInUp(
                              from: 250,
                              child: Text(
                                "Password",
                                style: theme.textTheme.titleSmall?.copyWith(
                                  color: ColorPalette.textAuthColor,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: mediaQuery.size.height * .02,
                            ),
                            FadeInUp(
                              from: 300,
                              child: TextFormField(
                                controller: cubitControl.passwordController,
                                cursorColor: Colors.white,
                                cursorHeight: 25,
                                style: theme.textTheme.titleSmall,
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return "Plz enter Password";
                                  }

                                  return value.length < 8
                                      ? 'Minimum character length is 8'
                                      : null;
                                },
                                obscureText: isObscured,
                                obscuringCharacter: "*",
                                maxLength: 24,
                                decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  filled: true,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  hintText: "enter your Password",
                                  hintStyle: theme.textTheme.bodyMedium
                                      ?.copyWith(color: Colors.black38),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        isObscured = !isObscured;
                                      });
                                    },
                                    icon: Icon(
                                      isObscured
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                    ),
                                  ),
                                  errorStyle: theme.textTheme.bodySmall,
                                ),
                              ),
                            ),
                            FadeInUp(
                              from: 350,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  InkWell(
                                    onTap: () {},
                                    child: Text(
                                      "forget password",
                                      style: theme.textTheme.bodyLarge?.copyWith(
                                        color: ColorPalette.textAuthColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Spacer(
                              flex: 1,
                            ),
                            FadeInUp(
                              from: 400,
                              child: FilledButton(
                                style: FilledButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                                onPressed: () {
                                  // cubitControl.signIn(emailController.toString(), passwordController.toString());
                                  cubitControl.signIn().then(
                                    (value) {
                                      navigatorKey.currentState?.pushNamedAndRemoveUntil(Routes.layout, (route)=>false,);
                                    },
                                  );
                                  // if (formKey.currentState!.validate()) {
                                  //   // ToDo  change route
                                  //   Navigator.pushReplacementNamed(
                                  //       context, Routes.layout);
                                  // }
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      textAlign: TextAlign.center,
                                      "Login",
                                      style: theme.textTheme.titleMedium?.copyWith(
                                        color: ColorPalette.primaryColor,
                                        height: 2.8,
                                      ),
                                    ),
                                    // Icon(Icons.arrow_forward),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            FadeInUp(
                              from: 450,
                              child: Center(
                                child: InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(context, Routes.register);
                                  },
                                  child: Text(
                                    "Don’t have an account? Create Account",
                                    style: theme.textTheme.bodyLarge
                                        ?.copyWith(color: ColorPalette.textAuthColor),
                                  ),
                                ),
                              ),
                            ),
                            const Spacer(
                              flex: 2,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },

        ),
    );
  }
}
