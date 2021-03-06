import 'package:flutter/material.dart';
import 'package:flutter_playground/src/animations/animations_page.dart';
import 'package:flutter_playground/src/animations/controlled/button/controlled_animated_button_page.dart';
import 'package:flutter_playground/src/animations/controlled/list/controlled_animated_list_page.dart';
import 'package:flutter_playground/src/animations/demo/controlled_animations_screen_demo.dart';
import 'package:flutter_playground/src/animations/demo/implicit_animations_screen_demo.dart';
import 'package:flutter_playground/src/animations/implicit/button/implicit_animated_button_page.dart';
import 'package:flutter_playground/src/animations/implicit/list/implicit_animated_list_page.dart';
import 'package:flutter_playground/src/di/main_module.dart';
import 'package:flutter_playground/src/home/home_page.dart';
import 'package:flutter_playground/src/main_page/splash/flutterando_splash_page.dart';
import 'package:flutter_playground/src/mockup_page/mockup_page.dart';
import 'package:flutter_playground/src/mockup_page/money_screen/money_page.dart';
import 'package:flutter_playground/src/mockup_page/tinder_screen/tinder_page.dart';
import 'package:flutter_playground/src/playground_page/playground_screen.dart';
import 'package:flutter_playground/src/routes/constants_router.dart';
import 'package:flutter_playground/themes/themes.dart';
import 'package:provider/provider.dart';

import 'playground_page/validador_cpf/validador_cpf_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: module,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: splashRoute,
        home: const FlutterandoSplashPage(),
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: ThemeMode.system,
        routes: {
          homeRoute: (context) => const HomePage(),
          playgroundRoute: (context) => const PlaygroundScreen(),
          mockupRoute: (context) => const MockupPage(),
          tinderRoute: (context) => const TinderPage(),
          moneyRoute: (context) => const MoneyPage(),
          animationsRoute: (context) => const AnimationsPage(),
          implicitAnimatedButton: (context) =>
              const ImplicitAnimatedButtonPage(),
          implicitAnimatedList: (context) => const ImplicitAnimatedListPage(),
          implicitAnimationsDemo: (context) =>
              const ImplicitAnimationPageDemo(),
          controlledAnimationsDemo: (context) =>
              const ControlledAnimationsPageDemo(),
          controlledAnimatedButton: (context) =>
              const ControlledAnimatedButtonPage(),
          controlledAnimatedList: (context) =>
              const ControlledAnimatedListPage(),
          validadorCpfPlayground: (context) => const ValidadorCpfPage(),
        },
      ),
    );
  }
}
