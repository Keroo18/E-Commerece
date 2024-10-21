import 'package:bloc/bloc.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:e_commerce/core/route_manager/route_generator.dart';
import 'package:e_commerce/core/theming/application_theme_management.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'core/route_manager/routes.dart';
import 'core/services/bloc_observer.dart';
final GlobalKey<NavigatorState> navigatorKey=GlobalKey<NavigatorState>();
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  runApp( EasyLocalization(
    supportedLocales: [
      Locale('en'),
      Locale('ar'),
    ],
    path: 'assets/translations', // <-- change the path of the translation files
    fallbackLocale: Locale('en'),
      child: ECommerceApp(),
  ),);
}

class ECommerceApp extends StatelessWidget {
  const ECommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "E-Commerce",
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      initialRoute: Routes.initial,
      onGenerateRoute: RouteGenerator.onGenerateRoute,
      theme: ApplicationThemeManagement.ThemeMode,
      builder: (context, child) {
        // Combine EasyLoading and BotToast
        child = EasyLoading.init()(context, child);
        child = BotToastInit()(context, child);  // BotToast initialization
        return child;
      },
      //TODO search
      navigatorObservers: [BotToastNavigatorObserver()],
    );
  }
}


