import 'package:animate_do/animate_do.dart';
import 'package:e_commerce/feature/outh/presentation/manager/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../../core/route_manager/routes.dart';
import '../../../../core/theming/color_palette.dart';
import '../../../../main.dart';
import '../manager/states.dart';

class RegistrationView extends StatefulWidget {
  const RegistrationView({super.key});

  @override
  State<RegistrationView> createState() => _RegistrationViewState();
}

class _RegistrationViewState extends State<RegistrationView> {

  bool isObscured = false;
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var mediaQuery = MediaQuery
        .of(context)
        .size
        .height;
    return BlocProvider<AuthCubit>(
      create: (context)=>AuthCubit(),
      child: BlocBuilder<AuthCubit,AuthStates>(
        builder: (context,state){
          var cubitControl=AuthCubit.get(context);
          return Scaffold(
            backgroundColor: const Color(0xFF004182),
            resizeToAvoidBottomInset: false,
            body: Column(
              children: [
                SizedBox(
                  height: mediaQuery * .1,
                ),
                FadeInUp(
                  from: 0,
                  child: Image.asset(
                    "assets/images/logo.png",
                    color: ColorPalette.textAuthColor,
                    width: mediaQuery * .3,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Form(
                      key: formKey,
                      child: ListView(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              SizedBox(
                                height: mediaQuery * .05,
                              ),
                              FadeInUp(
                                from: 50,
                                child: Text(
                                  "Full Name",
                                  style: theme.textTheme.titleSmall?.copyWith(
                                    color: ColorPalette.textAuthColor,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: mediaQuery * .02,
                              ),
                              FadeInUp(
                                from: 50,

                                child: TextFormField(
                                  controller: cubitControl.nameSignUpController,
                                  style: theme.textTheme.titleSmall,
                                  validator: (value) {
                                    if (value == null || value
                                        .trim()
                                        .isEmpty) {
                                      return "Plz enter The Name";
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
                              const SizedBox(
                                height: 25,
                              ),
                              FadeInUp(
                                from: 100,

                                child: Text(
                                  "Mobile Number",
                                  style: theme.textTheme.titleSmall?.copyWith(
                                    color: ColorPalette.textAuthColor,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: mediaQuery * .02,
                              ),
                              FadeInUp(
                                from: 150,
                                child: IntlPhoneField(
                                  countries: [
                                    const Country(
                                      name: "Egypt",
                                      nameTranslations: {
                                        "sk": "Egypt",
                                        "se": "Egypt",
                                        "pl": "Egipt",
                                        "no": "Egypt",
                                        "ja": "エジプト",
                                        "it": "Egitto",
                                        "zh": "埃及",
                                        "nl": "Egypt",
                                        "de": "Ägypt",
                                        "fr": "Égypte",
                                        "es": "Egipt",
                                        "en": "Egypt",
                                        "pt_BR": "Egito",
                                        "sr-Cyrl": "Египат",
                                        "sr-Latn": "Egipat",
                                        "zh_TW": "埃及",
                                        "tr": "Mısır",
                                        "ro": "Egipt",
                                        "ar": "مصر",
                                        "fa": "مصر",
                                        "yue": "埃及"
                                      },
                                      flag: "🇪🇬",
                                      code: "EG",
                                      dialCode: "20",
                                      minLength: 10,
                                      maxLength: 10,
                                    ),
                                    const Country(
                                      name: "Palestinian Territory, Occupied",
                                      nameTranslations: {
                                        "sk": "Palestínske územia",
                                        "se": "Palestina",
                                        "pl": "Terytoria Palestyńskie",
                                        "no": "Det palestinske området",
                                        "ja": "パレスチナ自治区",
                                        "it": "Territori palestinesi",
                                        "zh": "巴勒斯坦领土",
                                        "nl": "Palestijnse gebieden",
                                        "de": "Palästinensische Autonomiegebiete",
                                        "fr": "Territoires palestiniens",
                                        "es": "Territorios Palestinos",
                                        "en": "Palestinian Territories",
                                        "pt_BR": "Territórios Palestinos",
                                        "sr-Cyrl": "Палестина",
                                        "sr-Latn": "Palestina",
                                        "zh_TW": "巴勒斯坦",
                                        "tr": "Filistin",
                                        "ro": "Palestina",
                                        "ar": "فلسطين",
                                        "fa": "فلسطین",
                                        "yue": "巴勒斯坦，国"
                                      },
                                      flag: "🇵🇸",
                                      code: "PS",
                                      dialCode: "970",
                                      minLength: 9,
                                      maxLength: 9,
                                    ),
                                    const Country(
                                      name: "United Arab Emirates",
                                      nameTranslations: {
                                        "sk": "Spojené arabské emiráty",
                                        "se": "Ovttastuvvan Arábaemiráhtat",
                                        "pl": "Zjednoczone Emiraty Arabskie",
                                        "no": "De forente arabiske emirater",
                                        "ja": "アラブ首長国連邦",
                                        "it": "Emirati Arabi Uniti",
                                        "zh": "阿拉伯联合酋长国",
                                        "nl": "Verenigde Arabische Emiraten",
                                        "de": "Vereinigte Arabische Emirate",
                                        "fr": "Émirats arabes unis",
                                        "es": "Emiratos Árabes Unidos",
                                        "en": "United Arab Emirates",
                                        "pt_BR": "Emirados Árabes Unidos",
                                        "sr-Cyrl": "Уједињени Арапски Емирати",
                                        "sr-Latn": "Ujedinjeni Arapski Emirati",
                                        "zh_TW": "阿拉伯聯合大公國",
                                        "tr": "Birleşik Arap Emirlikleri",
                                        "ro": "Emiratele Arabe Unite",
                                        "ar": "الإمارات العربية المتحدة",
                                        "fa": "امارات متحده عربی",
                                        "yue": "阿拉伯聯合酋長國"
                                      },
                                      flag: "🇦🇪",
                                      code: "AE",
                                      dialCode: "971",
                                      minLength: 9,
                                      maxLength: 9,
                                    ),
                                    const Country(
                                      name: "Saudi Arabia",
                                      nameTranslations: {
                                        "sk": "Saudská Arábia",
                                        "se": "Saudi-Arábia",
                                        "pl": "Arabia Saudyjska",
                                        "no": "Saudi-Arabia",
                                        "ja": "サウジアラビア",
                                        "it": "Arabia Saudita",
                                        "zh": "沙特阿拉伯",
                                        "nl": "Saoedi-Arabië",
                                        "de": "Saudi-Arabien",
                                        "fr": "Arabie saoudite",
                                        "es": "Arabia Saudí",
                                        "en": "Saudi Arabia",
                                        "pt_BR": "Arábia Saudita",
                                        "sr-Cyrl": "Саудијска Арабија",
                                        "sr-Latn": "Saudijska Arabija",
                                        "zh_TW": "沙烏地阿拉",
                                        "tr": "Suudi Arabistan",
                                        "ro": "Arabia Saudită",
                                        "ar": "السعودية",
                                        "fa": "عربستان سعودی",
                                        "yue": "沙地阿拉伯"
                                      },
                                      flag: "🇸🇦",
                                      code: "SA",
                                      dialCode: "966",
                                      minLength: 9,
                                      maxLength: 9,
                                    ),
                                  ],
                                  controller: cubitControl.mobileNumberSignUpController,
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
                                  languageCode: "en",
                                  onChanged: (phone) {},
                                  onCountryChanged: (country) {},
                                ),
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              FadeInUp(
                                from: 200,
                                child: Text(
                                  "E-mail address",
                                  style: theme.textTheme.titleSmall?.copyWith(
                                    color: ColorPalette.textAuthColor,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: mediaQuery * .02,
                              ),
                              FadeInUp(
                                from: 250,
                                child: TextFormField(
                                  controller: cubitControl.emailSignUpController,
                                  style: theme.textTheme.titleSmall,
                                  validator: (value) {
                                    if (value == null || value
                                        .trim()
                                        .isEmpty) {
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
                              const SizedBox(
                                height: 25,
                              ),
                              FadeInUp(
                                from: 300,
                                child: Text(
                                  "Password",
                                  style: theme.textTheme.titleSmall?.copyWith(
                                    color: ColorPalette.textAuthColor,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: mediaQuery * .02,
                              ),
                              FadeInUp(
                                from: 350,
                                child: TextFormField(
                                  controller: cubitControl.passwordSignUpController,
                                  cursorColor: theme.primaryColor,
                                  cursorHeight: 25,
                                  style: theme.textTheme.titleSmall,
                                  validator: (value) {
                                    if (value == null || value
                                        .trim()
                                        .isEmpty) {
                                      return "Plz enter Password";
                                    }
                                    return null;
                                  },
                                  obscureText: isObscured,
                                  obscuringCharacter: "*",
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
                              const SizedBox(
                                height: 15,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                FadeInUp(
                  from: 500,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: FilledButton(
                      style: FilledButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      onPressed: () {
                        cubitControl.signUp().then((value) {
                          if(value){
                            navigatorKey.currentState?.pushNamedAndRemoveUntil(Routes.layout, (route)=>false,);
                          }
                        },);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            textAlign: TextAlign.center,
                            "Sign Up",
                            style: theme.textTheme.titleSmall?.copyWith(
                              color: ColorPalette.primaryColor,
                              height: 3.5,
                            ),
                          ),
                          // Icon(Icons.arrow_forward),
                        ],
                      ),
                    ),
                  ),
                ),
                FadeInUp(
                  from: 550,
                  child: Center(
                    child: InkWell(
                      onTap: () {

                        Navigator.pushNamed(context, Routes.login);
                      },
                      child: Text(
                        "Have an account? Login",
                        style: theme.textTheme.titleSmall?.copyWith(
                          color: ColorPalette.textAuthColor,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
