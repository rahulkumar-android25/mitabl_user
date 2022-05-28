import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mitabl_user/helper/app_config.dart' as config;
import 'package:mitabl_user/helper/helper.dart';
import 'package:mitabl_user/pages/login/cubit/login_cubit.dart';
import 'package:mitabl_user/repos/authentication_repository.dart';

class LoginForm extends StatefulWidget {
  // final RouteArguements? routeArguements;

  const LoginForm({
    Key? key,
    /*this.routeArguements*/
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LoginForm();
}

class _LoginForm extends State<LoginForm> with TickerProviderStateMixin {
  // final RouteArguements? routeArguements;

  // int breakPointWidth = 500;

  _LoginForm();

  @override
  void initState() {
    // setUpFields();
    super.initState();
  }

/*  setUpFields() async {
    var prefs = await SharedPreferences.getInstance();
    bool? isRemebered = prefs.getBool(AppConstants.REMEMBER_ME);
    print('rememverMeee ${isRemebered}');
    var mobileNo, password;
    if (isRemebered != null && isRemebered) {
      mobileNo = prefs.getString(AppConstants.MOBILE_NO);
      password = prefs.getString(AppConstants.PASSWORD);
    }
    if (mobileNo != null && password != null) {
      mobileNoTextEditor!.text = mobileNo.toString();
      passwordTextEditor!.text = password.toString();
    }
  }*/

  TextEditingController? mobileNoTextEditor = TextEditingController();
  TextEditingController? passwordTextEditor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    timeDilation = 0.4;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return BlocConsumer<LoginCubit, LoginState>(builder: (context, state) {
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
                          'Welcome Back!',
                          style: GoogleFonts.gothicA1(
                              color: Theme.of(context).primaryColorDark,
                              fontWeight: FontWeight.w600,
                              fontSize: config.AppConfig(context).appWidth(7)),
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
                          _MobilePhone(
                            loginForm: this,
                          ),
                          SizedBox(
                            height: config.AppConfig(context).appHeight(2),
                          ),
                          _Password(
                            loginForm: this,
                          ),
                          SizedBox(
                            height: config.AppConfig(context).appHeight(0.5),
                          ),
                          InkWell(
                            onTap: () => navigatorKey.currentState!
                                .pushNamed('/ForgotPage'),
                            child: Text(
                              ' Forgot password?',
                              style: GoogleFonts.gothicA1(
                                  fontSize:
                                      config.AppConfig(context).appHeight(1.5),
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
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
      if (state.apiStatus.isSubmissionFailure) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('${state.serverMessage}')));
      } else if (state.apiStatus.isSubmissionSuccess) {
        Helper.showToast('${state.serverMessage}');
      }
    });
  }
}

class _MobilePhone extends StatefulWidget {
  final _LoginForm? loginForm;

  const _MobilePhone({Key? key, this.loginForm}) : super(key: key);

  @override
  State<_MobilePhone> createState() => _MobilePhoneState();
}

class _MobilePhoneState extends State<_MobilePhone> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      print('constraibtWidth ${constraint.maxWidth}');
      return BlocBuilder<LoginCubit, LoginState>(builder: (context, state) {
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
              context.read<LoginCubit>().onEmailChanged(value: text);
            },
            decoration: InputDecoration(
              counterText: '',
              errorText:
                  state.email.invalid ? 'Please enter a valid email id' : null,

              suffixIcon: state.email.valid
                  ? Icon(
                      Icons.check_circle_outline,
                      color: Theme.of(context).primaryColor,
                    )
                  : SizedBox(),
              hintStyle: GoogleFonts.gothicA1(
                  color: Theme.of(context).hintColor,
                  fontSize: config.AppConfig(context).appWidth(4)),
              // labelText: 'Mobile Number',
              hintText: 'Username',
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

class _Password extends StatefulWidget {
  final _LoginForm? loginForm;

  const _Password({Key? key, this.loginForm}) : super(key: key);

  @override
  State<_Password> createState() => _PasswordState();
}

class _PasswordState extends State<_Password> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      return BlocBuilder<LoginCubit, LoginState>(builder: (context, state) {
        return Container(
          child: TextFormField(
            controller: widget.loginForm!.passwordTextEditor,
            style: TextStyle(color: Colors.black),
            obscureText: state.showPassword,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.visiblePassword,
            onChanged: (text) {
              context.read<LoginCubit>().onPasswordChanged(value: text);
            },
            maxLength: 50,
            decoration: InputDecoration(
              errorText: state.password.invalid
                  ? 'Please enter a valid password'
                  : null,
              counterText: '',
              suffixIcon: IconButton(
                onPressed: () {
                  context.read<LoginCubit>().showPassword();
                },
                color: Colors.white,
                icon: Icon(
                  !state.showPassword ? Icons.visibility_off : Icons.visibility,
                  color: Theme.of(context).primaryColorLight,
                ),
              ),
              hintStyle: GoogleFonts.gothicA1(
                  color: Theme.of(context).hintColor,
                  fontSize: config.AppConfig(context).appWidth(4)),
              hintText: 'Password',
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
            ),
          ),
        );
      });
    });
  }
}

class _LoginButton extends StatelessWidget {
  final _LoginForm? loginForm;

  const _LoginButton({Key? key, this.loginForm}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Container(
          height: 45,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.topRight,
                colors: state.status.isValidated
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
              child: state.apiStatus.isSubmissionInProgress
                  ? const Center(
                      child: CupertinoActivityIndicator(
                        color: Colors.white,
                      ),
                    )
                  : Text(
                      'LOGIN',
                      style: GoogleFonts.gothicA1(
                          fontSize: config.AppConfig(context).appWidth(3.5),
                          color: Colors.white),
                    ),
              height: config.AppConfig(context).appHeight(6),
              minWidth: config.AppConfig(context).appWidth(100),
              onPressed: () {
                if (state.status.isValidated) {
                  context.read<LoginCubit>().doLogin();
                }
              }),
        );
      },
    );
  }
}
