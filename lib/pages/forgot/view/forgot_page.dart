import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mitabl_user/helper/app_config.dart' as config;
import 'package:mitabl_user/pages/forgot/cubit/forgot_cubit.dart';
import 'package:mitabl_user/repos/authentication_repository.dart';

class ForgotPage extends StatefulWidget {
  const ForgotPage({
    Key? key,
  }) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(
        builder: (_) => BlocProvider(
              create: (context) => ForgotCubit(),
              child: ForgotPage(),
            ));
    // );
  }

  @override
  State<StatefulWidget> createState() => _ForgotPage();
}

class _ForgotPage extends State<ForgotPage> with TickerProviderStateMixin {
  // final RouteArguements? routeArguements;

  // int breakPointWidth = 500;

  _ForgotPage();

  @override
  void initState() {
    // setUpFields();
    super.initState();
  }

  TextEditingController? mobileNoTextEditor = TextEditingController();
  TextEditingController? passwordTextEditor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    timeDilation = 0.4;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return Scaffold(
      body: BlocConsumer<ForgotCubit, ForgotState>(builder: (context, state) {
        return Container(
          alignment: Alignment.center,
          color: Colors.white,
          height: config.AppConfig(context).appHeight(100),
          width: config.AppConfig(context).appWidth(100),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                  top: config.AppConfig(context).appHeight(2),
                  left: config.AppConfig(context).appWidth(5),
                  right: config.AppConfig(context).appWidth(5)),
              child: Container(
                alignment: Alignment.center,
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
                            'Forgot Password',
                            style: GoogleFonts.gothicA1(
                                color: Theme.of(context).primaryColorDark,
                                fontWeight: FontWeight.w600,
                                fontSize:
                                    config.AppConfig(context).appWidth(7)),
                          ),
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              text: 'Enter your email address below to\n',
                              style: GoogleFonts.gothicA1(
                                fontSize: config.AppConfig(context).appWidth(3),
                                color: Theme.of(context).primaryColorDark,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                    text: 'reset your password',
                                    style: GoogleFonts.gothicA1(
                                      fontSize:
                                          config.AppConfig(context).appWidth(3),
                                      color: Theme.of(context).primaryColorDark,
                                    )),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: config.AppConfig(context).appHeight(1),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: config.AppConfig(context).appHeight(8),
                      ),
                      Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _Email(
                              loginForm: this,
                            ),
                            SizedBox(
                              height: config.AppConfig(context).appHeight(2),
                            ),
                            SizedBox(
                              height: config.AppConfig(context).appHeight(2),
                            ),
                            _LoginButton(
                              loginForm: this,
                            ),
                            SizedBox(
                              height: config.AppConfig(context).appHeight(2),
                            ),
                            InkWell(
                              onTap: () => navigatorKey.currentState!.pop(),
                              child: Container(
                                alignment: Alignment.center,
                                child: Text(
                                  '< Back to login',
                                  style: GoogleFonts.gothicA1(
                                    fontSize:
                                        config.AppConfig(context).appHeight(2),
                                    color: Theme.of(context).primaryColorDark,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: config.AppConfig(context).appHeight(4.5),
                            ),
                          ]),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      }, listener: (context, state) async {
        print('status form ${state.status}');
        // if (state.status!.isSubmissionFailure) {
        //   ScaffoldMessenger.of(context)
        //       .showSnackBar(SnackBar(content: Text('${state.serverMessage}')));
        // }
      }),
    );
  }
}

class _Email extends StatefulWidget {
  final _ForgotPage? loginForm;

  const _Email({Key? key, this.loginForm}) : super(key: key);

  @override
  State<_Email> createState() => _EmailState();
}

class _EmailState extends State<_Email> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      print('constraibtWidth ${constraint.maxWidth}');
      return BlocBuilder<ForgotCubit, ForgotState>(builder: (context, state) {
        return Container(
          alignment: Alignment.center,
          padding: EdgeInsets.zero,
          child: TextFormField(
            controller: widget.loginForm!.mobileNoTextEditor,
            style: TextStyle(color: Colors.black),
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.name,
            maxLength: 55,
            onChanged: (text) {
              context.read<ForgotCubit>().onEmailChanged(value: text);
            },
            decoration: InputDecoration(
              counterText: '',
              errorText:
                  state.email!.invalid ? 'Please enter a valid email id' : null,

              suffixIcon: state.email!.valid
                  ? Icon(
                      Icons.check_circle_outline,
                      color: Theme.of(context).primaryColor,
                    )
                  : SizedBox(),
              hintStyle: GoogleFonts.gothicA1(
                  color: Theme.of(context).hintColor,
                  fontSize: config.AppConfig(context).appWidth(4)),
              // labelText: 'Mobile Number',
              hintText: 'Email',
              contentPadding:
                  EdgeInsets.all(config.AppConfig(context).appWidth(3)),
              fillColor: config.AppColors().textFieldBackgroundColor(1),
              filled: true,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(
                  color: Colors.white,
                ),
              ),
              border: InputBorder.none,
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(
                  color: Colors.white,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(
                  color: Colors.white,
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(
                  color: Colors.white,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        );
      });
    });
  }
}

class _LoginButton extends StatelessWidget {
  final _ForgotPage? loginForm;

  const _LoginButton({Key? key, this.loginForm}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgotCubit, ForgotState>(
      listener: (context, state) {},
      builder: (context, state) {
        return state.status!.isSubmissionInProgress
            ? const CircularProgressIndicator()
            : Container(
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
                              Theme.of(context).primaryColorLight,
                              Theme.of(context).primaryColorLight,
                            ],
                    )),
                child: MaterialButton(
                    child: Text(
                      'SUBMIT',
                      style: GoogleFonts.gothicA1(
                          fontSize: config.AppConfig(context).appWidth(3.5),
                          color: Colors.white),
                    ),
                    minWidth: config.AppConfig(context).appWidth(100),
                    height: 50.0,
                    onPressed: () {
                      if (state.status!.isValidated) {
                        // context.read<ForgotCubit>().doLogin();
                      }
                    }),
              );
      },
    );
  }
}
