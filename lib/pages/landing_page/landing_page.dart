import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mitabl_user/repos/authentication_repository.dart';
import 'package:mitabl_user/helper/app_config.dart' as config;

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  Route route() {
    return MaterialPageRoute(builder: (context) {
      return LandingPage();
    });
  }

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: config.AppConfig(context).appHeight(15),
        ),
        Center(
          child: Image.asset(
            'assets/img/logo.png',
            height: config.AppConfig(context).appHeight(20),
            width: config.AppConfig(context).appWidth(80),
            fit: BoxFit.contain,
          ),
        ),
        SizedBox(
          height: config.AppConfig(context).appHeight(15),
        ),
        Column(
          children: [
            MaterialButton(
              height: config.AppConfig(context).appHeight(6),
              minWidth: config.AppConfig(context).appWidth(70),
              onPressed: () {
                navigatorKey.currentState!.pushNamed('/LoginPage');
              },
              color: Theme.of(context).primaryColor,
              child: Text(
                'LOGIN',
                style: GoogleFonts.gothicA1(
                    fontSize: config.AppConfig(context).appWidth(3.5),
                    color: Colors.white),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      config.AppConfig(context).appWidth(10))),
            ),
            SizedBox(
              height: config.AppConfig(context).appHeight(2),
            ),
            MaterialButton(
              height: config.AppConfig(context).appHeight(6),
              minWidth: config.AppConfig(context).appWidth(70),
              onPressed: () {},
              color: Theme.of(context).primaryColorDark,
              child: Text(
                'CREATE NEW ACCOUNT',
                style: GoogleFonts.gothicA1(
                    fontSize: config.AppConfig(context).appWidth(3.5),
                    color: Colors.white),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      config.AppConfig(context).appWidth(10))),
            )
          ],
        ),
        const Spacer(),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: 'By login in, you agree to our\n',
            style: GoogleFonts.gothicA1(
                fontSize: config.AppConfig(context).appWidth(3),
                color: Colors.black),
            children: <TextSpan>[
              TextSpan(
                  text: 'terms of services',
                  style: GoogleFonts.gothicA1(
                      fontSize: config.AppConfig(context).appWidth(3),
                      color: Colors.black,
                      decoration: TextDecoration.underline)),
              TextSpan(
                text: ' and',
              ),
              TextSpan(
                  text: ' privacy policy',
                  style: GoogleFonts.gothicA1(
                      fontSize: config.AppConfig(context).appWidth(3),
                      color: Colors.black,
                      decoration: TextDecoration.underline)),
            ],
          ),
        ),
        SizedBox(
          height: config.AppConfig(context).appHeight(2),
        ),
      ],
    ));
  }
}
