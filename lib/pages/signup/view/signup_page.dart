import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mitabl_user/helper/app_config.dart' as config;
import 'package:mitabl_user/helper/appconstants.dart';
import 'package:mitabl_user/pages/login/cubit/login_cubit.dart';

import '../cubit/sign_up_cubit.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({
    Key? key,
  }) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(
        builder: (_) => BlocProvider(
              create: (context) => SignUpCubit(),
              child: SignupPage(),
            ));
    // );
  }

  @override
  State<StatefulWidget> createState() => _SignupPage();
}

class _SignupPage extends State<SignupPage> with TickerProviderStateMixin {
  // final RouteArguements? routeArguements;

  // int breakPointWidth = 500;

  _SignupPage();

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
      body: BlocConsumer<SignUpCubit, SignUpState>(builder: (context, state) {
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
                            'Create Account',
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
                        height: config.AppConfig(context).appHeight(8),
                      ),
                      Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _FirstName(
                              loginForm: this,
                            ),
                            SizedBox(
                              height: config.AppConfig(context).appHeight(2),
                            ),
                            _LastName(
                              loginForm: this,
                            ),
                            SizedBox(
                              height: config.AppConfig(context).appHeight(2),
                            ),
                            _Email(
                              loginForm: this,
                            ),
                            SizedBox(
                              height: config.AppConfig(context).appHeight(2),
                            ),
                            _PhoneNo(
                              loginForm: this,
                            ),
                            SizedBox(
                              height: config.AppConfig(context).appHeight(2),
                            ),
                            // Text(
                            //   ' Forgot password?',
                            //   style: GoogleFonts.gothicA1(
                            //       fontSize: config.AppConfig(context)
                            //           .appHeight(2),
                            //       color: Theme.of(context).primaryColor),
                            // ),
                            SizedBox(
                              height: config.AppConfig(context).appHeight(3),
                            ),
                            _LoginButton(
                              loginForm: this,
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
  final _SignupPage? loginForm;

  const _Email({Key? key, this.loginForm}) : super(key: key);

  @override
  State<_Email> createState() => _EmailState();
}

class _EmailState extends State<_Email> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      print('constraibtWidth ${constraint.maxWidth}');
      return BlocBuilder<SignUpCubit, SignUpState>(builder: (context, state) {
        return Container(
          alignment: Alignment.center,
          padding: EdgeInsets.zero,
          child: TextFormField(
            controller: widget.loginForm!.mobileNoTextEditor,
            style: TextStyle(color: Colors.black),
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.name,
            maxLength: 15,
            onChanged: (text) {
              context.read<SignUpCubit>().onEmailChanged(value: text);
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
                  color: Colors.grey,
                  fontSize: config.AppConfig(context).appWidth(4)),
              // labelText: 'Mobile Number',
              hintText: 'Email Address',
              contentPadding:
                  EdgeInsets.all(config.AppConfig(context).appWidth(2)),
              fillColor: config.AppColors().textFieldBackgroundColor(1),
              filled: true,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(
                  color: Colors.white,
                ),
              ),
              border: InputBorder.none,
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(
                  color: Colors.white,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(
                  color: Colors.white,
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(
                  color: Colors.white,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
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

class _FirstName extends StatefulWidget {
  final _SignupPage? loginForm;

  const _FirstName({Key? key, this.loginForm}) : super(key: key);

  @override
  State<_FirstName> createState() => _FirstNameState();
}

class _FirstNameState extends State<_FirstName> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(builder: (context, state) {
      return Container(
        alignment: Alignment.center,
        padding: EdgeInsets.zero,
        child: TextFormField(
          // controller: widget.loginForm!.mobileNoTextEditor,
          style: TextStyle(color: Colors.black),
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.name,
          maxLength: 15,
          onChanged: (text) {
            context.read<SignUpCubit>().onFirstNameChanged(value: text);
          },
          decoration: InputDecoration(
            counterText: '',
            errorText: state.nameFirst!.invalid
                ? 'Please enter a valid first name'
                : null,

            // suffixIcon: state.email!.valid
            //     ? Icon(
            //   Icons.check_circle_outline,
            //   color: Theme.of(context).primaryColor,
            // )
            //     : SizedBox(),
            hintStyle: GoogleFonts.gothicA1(
                color: Colors.grey,
                fontSize: config.AppConfig(context).appWidth(4)),
            // labelText: 'Mobile Number',
            hintText: 'First Name',
            contentPadding:
                EdgeInsets.all(config.AppConfig(context).appWidth(2)),
            fillColor: config.AppColors().textFieldBackgroundColor(1),
            filled: true,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                color: Colors.white,
              ),
            ),
            border: InputBorder.none,
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                color: Colors.white,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                color: Colors.white,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                color: Colors.white,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                color: Colors.white,
              ),
            ),
          ),
        ),
      );
    });
  }
}

class _LastName extends StatefulWidget {
  final _SignupPage? loginForm;

  const _LastName({Key? key, this.loginForm}) : super(key: key);

  @override
  State<_LastName> createState() => _LastNameState();
}

class _LastNameState extends State<_LastName> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(builder: (context, state) {
      return Container(
        alignment: Alignment.center,
        padding: EdgeInsets.zero,
        child: TextFormField(
          // controller: widget.loginForm!.mobileNoTextEditor,
          style: TextStyle(color: Colors.black),
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.name,
          maxLength: 15,
          onChanged: (text) {
            context.read<SignUpCubit>().onLastNameChanged(value: text);
          },
          decoration: InputDecoration(
            counterText: '',
            errorText: state.nameLast!.invalid
                ? 'Please enter a valid last name'
                : null,

            // suffixIcon: state.email!.valid
            //     ? Icon(
            //   Icons.check_circle_outline,
            //   color: Theme.of(context).primaryColor,
            // )
            //     : SizedBox(),
            hintStyle: GoogleFonts.gothicA1(
                color: Colors.grey,
                fontSize: config.AppConfig(context).appWidth(4)),
            // labelText: 'Mobile Number',
            hintText: 'Last Name',
            contentPadding:
                EdgeInsets.all(config.AppConfig(context).appWidth(2)),
            fillColor: config.AppColors().textFieldBackgroundColor(1),
            filled: true,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                color: Colors.white,
              ),
            ),
            border: InputBorder.none,
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                color: Colors.white,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                color: Colors.white,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                color: Colors.white,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                color: Colors.white,
              ),
            ),
          ),
        ),
      );
    });
  }
}

class _PhoneNo extends StatefulWidget {
  final _SignupPage? loginForm;

  const _PhoneNo({Key? key, this.loginForm}) : super(key: key);

  @override
  State<_PhoneNo> createState() => _PhoneNoState();
}

class _PhoneNoState extends State<_PhoneNo> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(builder: (context, state) {
      return Container(
        alignment: Alignment.center,
        padding: EdgeInsets.zero,
        child: TextFormField(
          // controller: widget.loginForm!.mobileNoTextEditor,
          style: TextStyle(color: Colors.black),
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.phone,
          maxLength: 15,
          onChanged: (text) {
            context.read<SignUpCubit>().onPhoneChanged(value: text);
          },
          decoration: InputDecoration(
            counterText: '',
            errorText:
                state.phone.invalid ? 'Please enter a valid phone no' : null,

            // suffixIcon: state.email!.valid
            //     ? Icon(
            //   Icons.check_circle_outline,
            //   color: Theme.of(context).primaryColor,
            // )
            //     : SizedBox(),
            hintStyle: GoogleFonts.gothicA1(
                color: Colors.grey,
                fontSize: config.AppConfig(context).appWidth(4)),
            // labelText: 'Mobile Number',
            hintText: 'Phone',
            contentPadding:
                EdgeInsets.all(config.AppConfig(context).appWidth(2)),
            fillColor: config.AppColors().textFieldBackgroundColor(1),
            filled: true,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                color: Colors.white,
              ),
            ),
            border: InputBorder.none,
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                color: Colors.white,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                color: Colors.white,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                color: Colors.white,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                color: Colors.white,
              ),
            ),
          ),
        ),
      );
    });
  }
}

class _LoginButton extends StatelessWidget {
  final _SignupPage? loginForm;

  const _LoginButton({Key? key, this.loginForm}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpState>(
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
                              Colors.grey,
                              Colors.grey,
                              // Theme.of(context).primaryColor,
                              // Theme.of(context).primaryColor,
                            ],
                    )),
                child: MaterialButton(
                    child: const Text(
                      'SIGN IN',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      ),
                    ),
                    minWidth: config.AppConfig(context).appWidth(100),
                    height: 50.0,
                    onPressed: () {
                      if (state.status!.isValidated) {
                        // context.read<SignUpCubit>().doLogin();
                      }
                    }),
              );
      },
    );
  }
}
