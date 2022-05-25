import 'package:flutter/material.dart';
import 'package:mitabl_user/helper/app_config.dart' as config;
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: config.AppConfig(context).appHeight(100),
      child: Text('dfdf'),
    );
  }
}
