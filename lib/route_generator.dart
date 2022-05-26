import 'package:flutter/material.dart';
import 'package:mitabl_user/pages/landing_page/landing_page.dart';
import 'package:mitabl_user/pages/login/view/login_page.dart';
import 'package:mitabl_user/pages/signup/view/signup_page.dart';
import 'package:mitabl_user/splash.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;
    // print('usrRepo' + args.toString());
    print(settings.name.toString());
    switch (settings.name) {
      case '/Splash':
        return MaterialPageRoute<void>(builder: (_) => SplashPage());

      case '/LandingPage':
        return const LandingPage().route();

      case '/LoginPage':
        return LoginPage.route();

      case '/SignUpPage':
        return SignupPage.route();

      default:
        // If there is no such named route in the switch statement, e.g. /third
        return MaterialPageRoute<void>(
            builder: (_) =>
                const Scaffold(body: SafeArea(child: Text('Route Error'))));
    }
  }
}
