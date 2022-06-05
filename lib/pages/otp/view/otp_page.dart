import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:mitabl_user/helper/app_config.dart' as config;
import 'package:mitabl_user/helper/appconstants.dart';
import 'package:mitabl_user/helper/route_arguement.dart';
import 'package:mitabl_user/model/otp_response.dart';
import 'package:mitabl_user/pages/otp/cubit/otp_cubit.dart';

import 'package:mitabl_user/repos/authentication_repository.dart';
import 'package:pinput/pinput.dart';
import 'package:formz/formz.dart';

class OTPPage extends StatefulWidget {
  const OTPPage({
    Key? key,
  }) : super(key: key);

  static Route route({RouteArguments? routeArguments}) {
    return MaterialPageRoute<void>(
        builder: (_) => BlocProvider(
              create: (context) => OtpCubit(
                  context.read<AuthenticationRepository>(), routeArguments),
              child: OTPPage(),
            ));
    // );
  }

  @override
  State<StatefulWidget> createState() => _OTPPage();
}

class _OTPPage extends State<OTPPage> {
  // final RouteArguements? routeArguements;

  // int breakPointWidth = 500;

  _OTPPage();

  @override
  void initState() {
    // setUpFields();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return Scaffold(
        body: BlocConsumer<OtpCubit, OtpState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Container(
          alignment: Alignment.topCenter,
          color: Colors.white,
          height: config.AppConfig(context).appHeight(100),
          width: config.AppConfig(context).appWidth(100),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                  top: config.AppConfig(context).appHeight(15),
                  left: config.AppConfig(context).appWidth(5),
                  right: config.AppConfig(context).appWidth(5)),
              child: Container(
                alignment: Alignment.topCenter,
                width: config.AppConfig(context).appWidth(90),
                child: Padding(
                  padding: EdgeInsets.zero,
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Image.asset(
                            'assets/img/logo.png',
                            fit: BoxFit.contain,
                            height: config.AppConfig(context).appHeight(15),
                            width: config.AppConfig(context).appWidth(70),
                          ),
                          SizedBox(
                            height: config.AppConfig(context).appHeight(2),
                          ),
                          Text(
                            'Verify Email',
                            style: GoogleFonts.gothicA1(
                                color: Theme.of(context).primaryColorDark,
                                fontWeight: FontWeight.w600,
                                fontSize:
                                    config.AppConfig(context).appWidth(7)),
                          ),
                          SizedBox(
                            height: config.AppConfig(context).appHeight(1),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: config.AppConfig(context).appHeight(2),
                      ),
                      Text(
                        'We have sent a verification code \non your email ID.',
                        style: GoogleFonts.gothicA1(
                            fontSize: config.AppConfig(context).appHeight(2.5),
                            color: Colors.grey),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: config.AppConfig(context).appHeight(4),
                      ),
                      Pinput(
                        defaultPinTheme: PinTheme(
                          width: config.AppConfig(context).appWidth(12),
                          height: config.AppConfig(context).appHeight(8),
                          textStyle: TextStyle(
                              fontSize: config.AppConfig(context).appHeight(3),
                              color: Colors.black,
                              fontWeight: FontWeight.w600),
                          decoration: BoxDecoration(
                            color:
                                config.AppColors().textFieldBackgroundColor(1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        length: 4,
                        pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                        showCursor: true,
                        onChanged: (value) {
                          context.read<OtpCubit>().onOtpChanged(value: value);
                        },
                        onCompleted: (pin) {},
                      ),
                      SizedBox(
                        height: config.AppConfig(context).appHeight(4),
                      ),
                      _SubmitButton()
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    ));
  }
}

class _SubmitButton extends StatelessWidget {
  final _OTPPage? loginForm;

  const _SubmitButton({Key? key, this.loginForm}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OtpCubit, OtpState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Container(
          height: 45,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.topRight,
                colors: state.status!.isValidated
                    ? [
                        Theme.of(context).primaryColor,
                        Theme.of(context).primaryColor,
                      ]
                    : [
                        Colors.grey,
                        Colors.grey,
                        // Theme.of(context).primaryColorLight,
                        // Theme.of(context).primaryColorLight,
                      ],
              )),
          child: state.statusAPI!.isSubmissionInProgress
              ? const Center(
                  child: CupertinoActivityIndicator(
                    color: Colors.white,
                  ),
                )
              : MaterialButton(
                  child: Text(
                    'SUBMIT',
                    style: GoogleFonts.gothicA1(
                        fontSize: config.AppConfig(context).appWidth(3.5),
                        color: Colors.white),
                  ),
                  minWidth: config.AppConfig(context).appWidth(100),
                  height: 50.0,
                  onPressed: () {
                    // navigatorKey.currentState!.popAndPushNamed('/CookProfile',
                    //     arguments: RouteArguments(data: OTPResponse()));


                    if (state.status!.isValidated) {
                    context.read<OtpCubit>().onSubmitted();
                    }
                  }),
        );
      },
    );
  }
}
