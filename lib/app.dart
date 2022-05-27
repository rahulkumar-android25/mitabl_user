import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mitabl_user/pages/login/cubit/login_cubit.dart';
import 'package:mitabl_user/pages/signup/cubit/sign_up_cubit.dart';
import 'package:mitabl_user/repos/authentication_repository.dart';
import 'package:mitabl_user/repos/user_repository.dart';
import 'package:mitabl_user/route_generator.dart';

import 'auth_bloc/authentication/authentication_bloc.dart';
import 'helper/app_config.dart' as config;

class App extends StatelessWidget {
  final AuthenticationRepository authenticationRepository;
  final UserRepository userRepository;

  const App(
      {Key? key,
      required this.authenticationRepository,
      required this.userRepository})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => authenticationRepository),
        RepositoryProvider(create: (context) => userRepository),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => AuthenticationBloc(
              authenticationRepository: authenticationRepository,
              userRepository: userRepository,
            ),
          ),
          BlocProvider(
            create: (_) => LoginCubit(
              authenticationRepository: authenticationRepository,
              userRepository: userRepository,
            ),
          ),
        ],
        child: AppView(
          userRepository: userRepository,
        ),
      ),
    );
  }
}

class AppView extends StatefulWidget {
  AppView({this.userRepository});

  final UserRepository? userRepository;

  @override
  _AppViewState createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  // final _navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState? get _navigator => navigatorKey.currentState;

  @override
  void initState() {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        navigatorKey: navigatorKey,
        builder: (context, child) {
          return BlocListener<AuthenticationBloc, AuthenticationState>(
            listener: (context, state) async {
              print('checkStatus ${state.status}');
              switch (state.status) {
                case AuthenticationStatus.authenticated:
                  // _navigator!.pushNamedAndRemoveUntil(
                  //     '/DashboardPage', (route) => false);
                  _navigator!
                      .pushNamedAndRemoveUntil('/HomePage', (route) => false);
                  break;

                case AuthenticationStatus.unauthenticated:
                  print('app:-unauthenticated');

                  _navigator!.pushNamedAndRemoveUntil(
                      '/LandingPage', (route) => false);

                  break;
                default:
                  break;
              }
            },
            child: child,
          );
        },
        initialRoute: '/Splash',
        debugShowCheckedModeBanner: false,
        onGenerateRoute: RouteGenerator.generateRoute,
        theme: ThemeData(
          fontFamily: 'Poppins',
          primaryColor: config.AppColors().colorPrimary(1),
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
              elevation: 0, foregroundColor: Colors.white),
          brightness: Brightness.light,
          accentColor: config.AppColors().accentColor(1),
          dividerColor: config.AppColors().accentColor(0.1),
          focusColor: config.AppColors().secondColor(1),
          hintColor: config.AppColors().hintTextBackgroundColor(1),
          scaffoldBackgroundColor: config.AppColors().scaffoldColor(1),
          primaryColorLight: config.AppColors().colorPrimaryLight(1),
          primaryColorDark: config.AppColors().colorPrimaryDark(1),
          textTheme: TextTheme(
            headline5: GoogleFonts.poppins(
                fontSize: 25.0,
                fontWeight: FontWeight.w600,
                color: Colors.black,
                height: 1.35),
            headline4: const TextStyle(
                fontSize: 20.0,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                color: Colors.black,
                height: 2.35),
            headline3: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
                color: Colors.black,
                height: 1.35),
            headline2: GoogleFonts.poppins(
              fontSize: 22.0,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
            headline1: GoogleFonts.poppins(
              fontSize: 22.0,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
            subtitle1: GoogleFonts.poppins(
              letterSpacing: 0.1,
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 15.5,
            ),
            headline6: GoogleFonts.poppins(
              fontSize: 16.0,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
            bodyText2: const TextStyle(
                fontSize: 12.0, color: Colors.black, height: 1.35),
            bodyText1: TextStyle(
                fontSize: 14.0,
                color: config.AppColors().secondColor(1),
                height: 1.35),
            caption: TextStyle(
                fontSize: 12.0,
                color: config.AppColors().accentColor(1),
                height: 1.35),
          ),
        ));
  }
}
