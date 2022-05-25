import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:mitabl_user/pages/signup/cubit/sign_up_cubit.dart' as cubit;
import 'package:mitabl_user/helper/app_config.dart' as config;
import 'package:mitabl_user/pages/signup/view/signup_form.dart';
import 'package:mitabl_user/repos/authentication_repository.dart';
import 'package:mitabl_user/repos/user_repository.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(
        builder: (_) => BlocProvider(
              create: (context) => cubit.SignUpCubit(
                  authenticationRepository:
                      context.read<AuthenticationRepository>(),
                  userRepository: context.read<UserRepository>()),
              child: SignUpPage(),
            ));
  }

  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: Container(
          height: config.AppConfig(context).appHeight(100),
          width: config.AppConfig(context).appWidth(100),
          child: BlocConsumer<cubit.SignUpCubit, cubit.SignUpState>(
              builder: (context, state) {
                return const SignUpForm();
              },
              listener: (context, state) {})),
    );
  }
}
